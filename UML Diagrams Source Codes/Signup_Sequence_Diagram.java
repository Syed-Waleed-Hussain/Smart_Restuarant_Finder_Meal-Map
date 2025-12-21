import org.eclipse.emf.ecore.resource.Resource;
import org.eclipse.emf.ecore.resource.ResourceSet;
import org.eclipse.emf.ecore.resource.impl.ResourceSetImpl;
import org.eclipse.emf.common.util.URI;
import org.eclipse.uml2.uml.*;
import java.io.IOException;
import java.util.Collections;

public class SignUpSequenceDiagramCreator {

    private static final UMLFactory FACTORY = UMLFactory.eINSTANCE;

    public static void createAndSaveModel(URI fileURI) {
        // 1. Setup Resource Set
        ResourceSet resourceSet = new ResourceSetImpl();
        Resource.Factory.Registry.INSTANCE.getExtensionToFactoryMap()
            .put("uml", new org.eclipse.uml2.uml.resource.UMLResource.Factory.Impl());

        // 2. Create the Model and Interaction (Sequence Diagram)
        Model model = FACTORY.createModel();
        model.setName("UserSignUpWorkflowModel");
        Collaboration collaboration = FACTORY.createCollaboration();
        collaboration.setName("SignUpCollaboration");
        model.getPackagedElements().add(collaboration);

        Interaction sequenceDiagram = FACTORY.createInteraction();
        sequenceDiagram.setName("UserRegistrationWithOTP");
        collaboration.getOwnedBehaviors().add(sequenceDiagram);

        // 3. Lifelines (Participants)
        Lifeline user = createLifeline(sequenceDiagram, "User", FACTORY.createActor());
        Lifeline ui = createLifeline(sequenceDiagram, "SignUpUI", FACTORY.createClass(), "<<Boundary>>");
        Lifeline authController = createLifeline(sequenceDiagram, "AuthController", FACTORY.createClass(), "<<Control>>");
        Lifeline passHasher = createLifeline(sequenceDiagram, "PasswordHasher", FACTORY.createClass(), "<<Control>>");
        Lifeline userEntity = createLifeline(sequenceDiagram, "UserEntity", FACTORY.createClass(), "<<Entity>>");
        Lifeline otpService = createLifeline(sequenceDiagram, "OTPService", FACTORY.createClass(), "<<Control>>");

        // --- 4. Registration and Hashing Flow ---
        
        // 1. Sign Up Request (User -> SignUpUI)
        Message msg1 = createMessage(sequenceDiagram, "1. Sign Up Request (Name, Email, Pass)", user, ui);
        // 2. processCredentials (SignUpUI -> AuthController)
        Message msg2 = createMessage(sequenceDiagram, "2. processCredentials(Password)", ui, authController);
        // 3. hashPassword (AuthController -> PasswordHasher)
        Message msg3 = createMessage(sequenceDiagram, "3. hashPassword(Password)", authController, passHasher);
        // 4. return HashedPassword (PasswordHasher -> AuthController)
        Message msg4 = createReply(sequenceDiagram, "4. return HashedPassword", passHasher, authController, msg3);
        // 5. createPendingUser (AuthController -> UserEntity)
        Message msg5 = createMessage(sequenceDiagram, "5. createPendingUser(HashedPassword)", authController, userEntity);
        // 6. return PendingUserRecord (UserEntity -> AuthController)
        Message msg6 = createReply(sequenceDiagram, "6. return PendingUserRecord", userEntity, authController, msg5);
        // 7. generateAndSendOTP (AuthController -> OTPService)
        Message msg7 = createMessage(sequenceDiagram, "7. generateAndSendOTP()", authController, otpService);
        // 8. Send OTP (OTPService -> User) - Asynchronous/Found Message (External)
        Message msg8 = createMessage(sequenceDiagram, "8. Send OTP (via Email/SMS Gateway)", otpService, user);
        msg8.setMessageSort(MessageSort.ASYNCHCALL_LITERAL); // Often external calls are asynchronous

        // 9. Prompt for OTP (SignUpUI -> User)
        Message msg9 = createReply(sequenceDiagram, "9. Prompt for OTP", ui, user, msg1);

        // --- 5. OTP Validation Flow ---
        
        // 10. submitOTP (User -> SignUpUI)
        Message msg10 = createMessage(sequenceDiagram, "10. submitOTP(Code)", user, ui);
        // 11. validateCode (SignUpUI -> AuthController)
        Message msg11 = createMessage(sequenceDiagram, "11. validateCode(Code)", ui, authController);
        // 12. checkAndConfirm (AuthController -> UserEntity)
        Message msg12 = createMessage(sequenceDiagram, "12. checkAndConfirm(Code)", authController, userEntity);
        // 13. return ConfirmedUserRecord (UserEntity -> AuthController)
        Message msg13 = createReply(sequenceDiagram, "13. return ConfirmedUserRecord", userEntity, authController, msg12);
        // 14. signUpSuccess (AuthController -> SignUpUI)
        Message msg14 = createReply(sequenceDiagram, "14. signUpSuccess()", authController, ui, msg11);
        // 15. Display Success Message (SignUpUI -> User)
        Message msg15 = createReply(sequenceDiagram, "15. Display Success Message (Redirect to Login)", ui, user, msg10);

        // 6. Save the model
        Resource resource = resourceSet.createResource(fileURI);
        resource.getContents().add(model);
        try {
            resource.save(Collections.emptyMap());
            System.out.println("UML Sequence Model saved successfully to: " + fileURI.toFileString());
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    // --- HELPER METHODS ---

    private static Lifeline createLifeline(Interaction interaction, String name, Type representedType, String... stereotypes) {
        Classifier participant = (Classifier) representedType;
        participant.setName(name);
        if (stereotypes.length > 0) {
            participant.setName(stereotypes[0] + " " + name); 
        }
        interaction.getNearestPackage().getPackagedElements().add(participant);

        Lifeline lifeline = interaction.createLifeline(name);
        lifeline.setRepresents(interaction.createPartDecomposition(name, participant));
        return lifeline;
    }

    private static Message createMessage(Interaction container, String name, Lifeline sender, Lifeline receiver) {
        Message message = container.createMessage(name);
        
        // Create send/receive events (OccurrenceSpecifications)
        MessageOccurrenceSpecification sendEvent = FACTORY.createMessageOccurrenceSpecification();
        sendEvent.setName(name + "Send");
        sendEvent.setCovered(sender);
        
        MessageOccurrenceSpecification receiveEvent = FACTORY.createMessageOccurrenceSpecification();
        receiveEvent.setName(name + "Receive");
        receiveEvent.setCovered(receiver);
        
        message.setSendEvent(sendEvent);
        message.setReceiveEvent(receiveEvent);
        
        container.getFragments().add(sendEvent);
        container.getFragments().add(receiveEvent);
        
        message.setMessageSort(MessageSort.SYNCHCALL_LITERAL);
        message.setSignature(FACTORY.createOperation()); 
        
        return message;
    }

    private static Message createReply(Interaction container, String name, Lifeline sender, Lifeline receiver, Message request) {
        Message reply = createMessage(container, name, sender, receiver);
        reply.setMessageSort(MessageSort.REPLY_LITERAL);
        
        reply.setSignature(request.getSignature());
        return reply;
    }

    public static void main(String[] args) {
        // Replace with your desired path
        URI fileURI = URI.createFileURI("C:/UML_Projects/SignUpSequenceDiagram.uml"); 
        createAndSaveModel(fileURI);
    }
}