import org.eclipse.emf.ecore.resource.Resource;
import org.eclipse.emf.ecore.resource.ResourceSet;
import org.eclipse.emf.ecore.resource.impl.ResourceSetImpl;
import org.eclipse.emf.common.util.URI;
import org.eclipse.uml2.uml.*;
import org.eclipse.uml2.uml.internal.impl.UMLFactoryImpl;

import java.io.IOException;
import java.util.Collections;

public class ReservationSystemModelCreator {

    // UML Factory instance
    private static final UMLFactory FACTORY = UMLFactory.eINSTANCE;

    public static void createAndSaveModel(URI fileURI) {
        // 1. Setup Resource Set
        ResourceSet resourceSet = new ResourceSetImpl();
        Resource.Factory.Registry.INSTANCE.getExtensionToFactoryMap()
            .put("uml", new org.eclipse.uml2.uml.resource.UMLResource.Factory.Impl());

        // 2. Create the Model (Root Package)
        Model reservationModel = FACTORY.createModel();
        reservationModel.setName("ReservationSystemModel");

        // 3. Create Collaboration for Sequence Diagram
        Collaboration collaboration = FACTORY.createCollaboration();
        collaboration.setName("ReservationUpdateScenario");
        reservationModel.getPackagedElements().add(collaboration);

        // 4. Create Interaction (The actual Sequence Diagram)
        Interaction sequenceDiagram = FACTORY.createInteraction();
        sequenceDiagram.setName("UpdateReservationStatus");
        collaboration.getOwnedBehaviors().add(sequenceDiagram);

        // --- UML ELEMENTS ---

        // 5. Lifelines (Participants in the Sequence Diagram)
        Lifeline ownerLifeline = createLifeline(sequenceDiagram, "Owner", FACTORY.createActor());
        Lifeline userLifeline = createLifeline(sequenceDiagram, "User", FACTORY.createActor());
        Lifeline uiLifeline = createLifeline(sequenceDiagram, "ReservationUI", FACTORY.createClass()); // <<Boundary>>
        Lifeline managerLifeline = createLifeline(sequenceDiagram, "ReservationManager", FACTORY.createClass()); // <<Control>>
        Lifeline entityLifeline = createLifeline(sequenceDiagram, "ReservationEntity", FACTORY.createClass()); // <<Entity>>
        Lifeline notifierLifeline = createLifeline(sequenceDiagram, "UserNotifier", FACTORY.createClass()); // <<Control>>
        
        // Helper to add stereotypes (optional but good for E-C-E)
        applyStereotype(uiLifeline.getRepresents(), "Boundary");
        applyStereotype(managerLifeline.getRepresents(), "Control");
        applyStereotype(entityLifeline.getRepresents(), "Entity");
        applyStereotype(notifierLifeline.getRepresents(), "Control");

        // --- SEQUENCE MESSAGES (Owner updates Status to Confirmed) ---

        // 2.0: Owner -> ReservationUI: Update Status (Confirmed)
        Message msg2_0 = createMessage(sequenceDiagram, "Update Status (Confirmed)", ownerLifeline, uiLifeline);

        // 3.0: ReservationUI -> ReservationManager: processStatusUpdate(ID, Status)
        Message msg3_0 = createMessage(sequenceDiagram, "processStatusUpdate(ID, Status)", uiLifeline, managerLifeline);
        
        // 4.0: ReservationManager -> ReservationEntity: updateStatus(Confirmed)
        Message msg4_0 = createMessage(sequenceDiagram, "updateStatus(Confirmed)", managerLifeline, entityLifeline);
        
        // 4.1: ReservationEntity -> UserNotifier: postStatusChanged(ID) (Asynchronous)
        Message msg4_1 = createMessage(sequenceDiagram, "postStatusChanged(ID)", entityLifeline, notifierLifeline);
        msg4_1.setMessageKind(MessageKind.ASYNCH_LITERAL); // Important: Asynchronous call

        // 5.0: ReservationEntity -> ReservationManager: return Success (Reply)
        Message msg5_0 = createReply(sequenceDiagram, "return Success", entityLifeline, managerLifeline, msg4_0);

        // 6.0: ReservationManager -> ReservationUI: displayConfirmation() (Reply)
        Message msg6_0 = createReply(sequenceDiagram, "displayConfirmation()", managerLifeline, uiLifeline, msg3_0);

        // 7.0: ReservationUI -> Owner: Display Update Success (Reply)
        Message msg7_0 = createReply(sequenceDiagram, "Display Update Success", uiLifeline, ownerLifeline, msg2_0);

        // --- NOTIFICATION PATH (UserNotifier pushes status) ---

        // 8.0: UserNotifier -> ReservationManager: retrieveUpdate(ID) (Asynchronous)
        Message msg8_0 = createMessage(sequenceDiagram, "retrieveUpdate(ID)", notifierLifeline, managerLifeline);
        msg8_0.setMessageKind(MessageKind.ASYNCH_LITERAL); 

        // 9.0: ReservationManager -> ReservationEntity: fetchUpdatedStatus()
        Message msg9_0 = createMessage(sequenceDiagram, "fetchUpdatedStatus()", managerLifeline, entityLifeline);

        // 9.1: ReservationEntity -> ReservationManager: return Status Data (Reply)
        Message msg9_1 = createReply(sequenceDiagram, "return Status Data", entityLifeline, managerLifeline, msg9_0);
        
        // 9.2: ReservationManager -> UserNotifier: return Status Data (Reply)
        Message msg9_2 = createReply(sequenceDiagram, "return Status Data", managerLifeline, notifierLifeline, msg8_0);

        // 10.0: UserNotifier -> User: pushNotification(Status)
        Message msg10_0 = createMessage(sequenceDiagram, "pushNotification(Status)", notifierLifeline, userLifeline);
        
        // 6. Save the model
        Resource resource = resourceSet.createResource(fileURI);
        resource.getContents().add(reservationModel);
        try {
            resource.save(Collections.emptyMap());
            System.out.println("UML Model saved successfully to: " + fileURI.toFileString());
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    // --- HELPER METHODS ---

    private static Lifeline createLifeline(Interaction interaction, String name, Type representedType) {
        Classifier participant = (Classifier) representedType;
        participant.setName(name);
        interaction.getNearestPackage().getPackagedElements().add(participant); // Add participant to package

        Lifeline lifeline = interaction.createLifeline(name);
        lifeline.setRepresents(interaction.createPartDecomposition(name, participant));
        return lifeline;
    }

    private static Message createMessage(Interaction interaction, String name, Lifeline sender, Lifeline receiver) {
        Message message = interaction.createMessage(name);
        message.setReceiveEvent(interaction.createMessageOccurrenceSpecification());
        message.setSendEvent(interaction.createMessageOccurrenceSpecification());
        
        message.setSender(sender);
        message.setReceiver(receiver);
        return message;
    }
    
    private static Message createReply(Interaction interaction, String name, Lifeline sender, Lifeline receiver, Message request) {
        Message reply = createMessage(interaction, name, sender, receiver);
        reply.setMessageSort(MessageSort.REPLY_LITERAL);
        reply.setSignature(request.getSignature());
        return reply;
    }
    
    // Simple mock for applying a stereotype to show the intent (Boundary/Control/Entity)
    private static void applyStereotype(ConnectableElement element, String stereotypeName) {
        // In a real Papyrus/EMF environment, this would involve loading the profile and applying the stereotype.
        // For simple model creation, we just set the name/type intent.
        if (element.getType() instanceof Class) {
            element.getType().setName("<<" + stereotypeName + ">>" + element.getType().getName());
        }
    }

    public static void main(String[] args) {
        // Replace with your desired path, e.g., "file:/C:/path/to/my/model.uml"
        URI fileURI = URI.createFileURI("C:/UML_Projects/ReservationUpdateDiagram.uml"); 
        createAndSaveModel(fileURI);
    }
}