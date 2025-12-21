import org.eclipse.emf.ecore.resource.Resource;
import org.eclipse.emf.ecore.resource.ResourceSet;
import org.eclipse.emf.ecore.resource.impl.ResourceSetImpl;
import org.eclipse.emf.common.util.URI;
import org.eclipse.uml2.uml.*;
import java.io.IOException;
import java.util.Collections;

public class OwnerSequenceDiagramCreator {

    private static final UMLFactory FACTORY = UMLFactory.eINSTANCE;

    public static void createAndSaveModel(URI fileURI) {
        // 1. Setup Resource Set
        ResourceSet resourceSet = new ResourceSetImpl();
        Resource.Factory.Registry.INSTANCE.getExtensionToFactoryMap()
            .put("uml", new org.eclipse.uml2.uml.resource.UMLResource.Factory.Impl());

        // 2. Create the Model and Interaction (Sequence Diagram)
        Model model = FACTORY.createModel();
        model.setName("OwnerWorkflowModel");
        Collaboration collaboration = FACTORY.createCollaboration();
        collaboration.setName("OwnerManagementCollaboration");
        model.getPackagedElements().add(collaboration);

        Interaction sequenceDiagram = FACTORY.createInteraction();
        sequenceDiagram.setName("OwnerCompleteWorkflow");
        collaboration.getOwnedBehaviors().add(sequenceDiagram);

        // 3. Lifelines (Participants)
        Lifeline owner = createLifeline(sequenceDiagram, "Owner", FACTORY.createActor());
        Lifeline ui = createLifeline(sequenceDiagram, "UI", FACTORY.createClass(), "<<Boundary>>");
        Lifeline controller = createLifeline(sequenceDiagram, "SystemController", FACTORY.createClass(), "<<Control>>");
        Lifeline ds = createLifeline(sequenceDiagram, "RestaurantDS", FACTORY.createClass(), "<<Entity>>");

        // --- 4. Main Flow: Login and Dashboard Access ---
        
        // 1. Log In (Owner -> UI)
        Message msg1 = createMessage(sequenceDiagram, "1. Log In (Email, Password)", owner, ui);
        // 2. authenticate (UI -> Controller)
        Message msg2 = createMessage(sequenceDiagram, "2. authenticate(Credentials)", ui, controller);
        // 3. verifyLogin (Controller -> DS)
        Message msg3 = createMessage(sequenceDiagram, "3. verifyLogin(OwnerID)", controller, ds);
        // 4. return Success & Role (DS -> Controller)
        Message msg4 = createReply(sequenceDiagram, "4. return Success & Role", ds, controller, msg3);
        // 5. loginSuccess() (Controller -> UI)
        Message msg5 = createReply(sequenceDiagram, "5. loginSuccess()", controller, ui, msg2);
        // 6. Display Dashboard (UI -> Owner)
        Message msg6 = createReply(sequenceDiagram, "6. Display Dashboard (Access Shared & Owner Tabs)", ui, owner, msg1);

        // --- 5. Combined Fragment: Parallel (par) for Shared Features ---
        CombinedFragment sharedFeaturesPar = createCombinedFragment(sequenceDiagram, InteractionOperatorKind.PAR_LITERAL, "[Access Shared Features]");
        
        // 7a. Explore Restaurants Path
        InteractionOperand explorePath = sharedFeaturesPar.createOperand("[Access Shared Features]");
        Message msg7a = createMessage(explorePath, "7a. Click Explore Restaurants", owner, ui, msg6.getMessageEnd(msg6.getReceiveEvent()));
        Message msg8a = createMessage(explorePath, "8a. requestSearchUI()", ui, controller);
        Message msg9a = createReply(explorePath, "9a. displaySearchUI()", controller, ui, msg8a);
        
        // 7b. My Reservation Path
        InteractionOperand reservationPath = sharedFeaturesPar.createOperand();
        Message msg7b = createMessage(reservationPath, "7b. Click My Reservation", owner, ui, msg6.getMessageEnd(msg6.getReceiveEvent()));
        Message msg8b = createMessage(reservationPath, "8b. requestMyReservations()", ui, controller);
        Message msg9b = createReply(reservationPath, "9b. displayReservations()", controller, ui, msg8b);
        
        // 7c. Favorites/Promotions (Implicit in diagram - treated as internal UI action)
        // Message msg7c = createMessage(sharedFeaturesPar.createOperand(), "7c. Click Favorites / Promotions", owner, ui, msg6.getMessageEnd(msg6.getReceiveEvent()));
        
        // --- End of PAR fragment ---

        // 10. Click Owner Dashboard Tab
        Message msg10 = createMessage(sequenceDiagram, "10. Click Owner Dashboard Tab", owner, ui);
        // 11. requestOwnerDashboard()
        Message msg11 = createMessage(sequenceDiagram, "11. requestOwnerDashboard()", ui, controller);
        // 12. getDashboardMetrics()
        Message msg12 = createMessage(sequenceDiagram, "12. getDashboardMetrics()", controller, ds);
        // 13. return Counts
        Message msg13 = createReply(sequenceDiagram, "13. return Counts (Reservations, Reviews, etc.)", ds, controller, msg12);
        // 14. displayDashboard(ManagementLinks)
        Message msg14 = createReply(sequenceDiagram, "14. displayDashboard(ManagementLinks)", controller, ui, msg11);
        
        // --- 6. Combined Fragment: Alternative (alt) for Management Actions ---
        Message lastMessage = msg14; // Start point for the ALT fragment

        // 15. Select Management Action
        Message msg15 = createMessage(sequenceDiagram, "15. Select Management Action", owner, ui);
        
        CombinedFragment managementAlt = createCombinedFragment(sequenceDiagram, InteractionOperatorKind.ALT_LITERAL);
        managementAlt.getOperands().add(createOwnerManagementOperand(ui, controller, ds, owner, "Change or Edit Restaurant Information", "16a. editInfo(NewData)", "17a. updateRestaurantInfo(NewData)", "18a. return Confirmation", "19a. Display Confirmation"));
        managementAlt.getOperands().add(createOwnerManagementOperand(ui, controller, ds, owner, "Manage Reservations (Update Status)", "16b. getPendingReservations()", "17b. fetchReservations(Pending)", "18b. return PendingList", "19b. selectReservation(ID, Status: Confirmed/Cancelled/Pending)"));
        managementAlt.getOperands().add(createOwnerManagementOperand(ui, controller, ds, owner, "Manage Menu", "16c. requestManageMenu(ItemData)", "17c. updateMenu(ItemData)", "18c. return Confirmation", "19c. Display Confirmation"));
        managementAlt.getOperands().add(createOwnerManagementOperand(ui, controller, ds, owner, "Manage Promotions", "16d. requestManagePromotions(PromoData)", "17d. updatePromotions(PromoData)", "18d. return Confirmation", "19d. Display Confirmation"));
        
        // Adjust bounds/lifeline to encompass the alt fragment (manual step in Papyrus)

        // --- 7. Logout Flow ---
        
        // 25. Click Logout
        Message msg25 = createMessage(sequenceDiagram, "25. Click Logout", owner, ui);
        // 26. processLogout()
        Message msg26 = createMessage(sequenceDiagram, "26. processLogout()", ui, controller);
        // 27. logoutSuccess()
        Message msg27 = createReply(sequenceDiagram, "27. logoutSuccess()", controller, ui, msg26);
        // 28. Redirect to Login Screen
        Message msg28 = createReply(sequenceDiagram, "28. Redirect to Login Screen", ui, owner, msg25);

        // 8. Save the model
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
            // Simple approach to indicate stereotype intent
            participant.setName(stereotypes[0] + " " + name); 
        }
        interaction.getNearestPackage().getPackagedElements().add(participant);

        Lifeline lifeline = interaction.createLifeline(name);
        lifeline.setRepresents(interaction.createPartDecomposition(name, participant));
        return lifeline;
    }

    private static Message createMessage(InteractionFragment container, String name, Lifeline sender, Lifeline receiver) {
        return createMessage(container, name, sender, receiver, null);
    }
    
    private static Message createMessage(InteractionFragment container, String name, Lifeline sender, Lifeline receiver, MessageEnd precedingEnd) {
        Message message = container.getOwner().createMessage(name);
        
        // Create send/receive events (OccurrenceSpecifications)
        MessageOccurrenceSpecification sendEvent = FACTORY.createMessageOccurrenceSpecification();
        sendEvent.setName(name + "Send");
        sendEvent.setCovered(sender);
        
        MessageOccurrenceSpecification receiveEvent = FACTORY.createMessageOccurrenceSpecification();
        receiveEvent.setName(name + "Receive");
        receiveEvent.setCovered(receiver);
        
        message.setSendEvent(sendEvent);
        message.setReceiveEvent(receiveEvent);
        message.setSignature(FACTORY.createOperation());
        
        // Add events to the interaction/fragment
        if (container instanceof Interaction) {
            ((Interaction) container).getFragments().add(sendEvent);
            ((Interaction) container).getFragments().add(receiveEvent);
        } else if (container instanceof InteractionOperand) {
            ((InteractionOperand) container).getFragments().add(sendEvent);
            ((InteractionOperand) container).getFragments().add(receiveEvent);
        }
        
        // Set the message sort (default is synchronous call)
        message.setMessageSort(MessageSort.SYNCHCALL_LITERAL);
        
        // If there's a preceding end, position this message after it (conceptually)
        if (precedingEnd != null) {
            // Note: Precise ordering requires careful positioning in Papyrus. 
            // Here, we just rely on the order in the fragments list for simple visualization.
        }

        return message;
    }

    private static Message createReply(InteractionFragment container, String name, Lifeline sender, Lifeline receiver, Message request) {
        Message reply = createMessage(container, name, sender, receiver);
        reply.setMessageSort(MessageSort.REPLY_LITERAL);
        
        // Wire the reply to the request
        reply.setSignature(request.getSignature());
        return reply;
    }

    private static CombinedFragment createCombinedFragment(Interaction interaction, InteractionOperatorKind operator, String... guard) {
        CombinedFragment fragment = FACTORY.createCombinedFragment();
        fragment.setInteractionOperator(operator);
        
        if (guard.length > 0) {
            InteractionOperand initialOperand = FACTORY.createInteractionOperand();
            initialOperand.setName(guard[0]); // Using name field for the guard text
            
            // Set the guard constraint
            if (guard[0] != null && !guard[0].isEmpty()) {
                LiteralString constraintValue = FACTORY.createLiteralString();
                constraintValue.setValue(guard[0]);
                initialOperand.createGuard(null, constraintValue);
            }
            fragment.getOperands().add(initialOperand);
        }
        interaction.getFragments().add(fragment);
        return fragment;
    }
    
    // Custom helper for the ALT fragment's complex structure
    private static InteractionOperand createOwnerManagementOperand(Lifeline ui, Lifeline controller, Lifeline ds, Lifeline owner, String guard, String msg16, String msg17, String msg18, String msg19) {
        InteractionOperand operand = FACTORY.createInteractionOperand();
        
        // Set the guard constraint
        LiteralString constraintValue = FACTORY.createLiteralString();
        constraintValue.setValue(guard);
        operand.createGuard(null, constraintValue);
        
        // 16. UI -> Controller
        Message message16 = createMessage(operand, msg16, ui, controller);
        
        // 17. Controller -> DS
        Message message17 = createMessage(operand, msg17, controller, ds);
        
        // 18. DS -> Controller (Reply)
        Message message18 = createReply(operand, msg18, ds, controller, message17);
        
        // 19. Controller -> UI (Reply or specific action)
        Message message19;
        if (msg19.contains("Display Confirmation")) {
             message19 = createReply(operand, msg19, controller, ui, message16);
        } else {
             // Special handling for Reservation flow message (19b. selectReservation)
             message19 = createMessage(operand, msg19, owner, ui);
             
             // Additional steps for Reservation Update follow the 19b message
             // 20b. updateReservationStatus (UI -> Controller)
             Message msg20b = createMessage(operand, "20b. updateReservationStatus(ID, NewStatus)", ui, controller, message19.getMessageEnd(message19.getReceiveEvent()));
             // 21b. saveStatus (Controller -> DS)
             Message msg21b = createMessage(operand, "21b. saveStatus(ID, NewStatus)", controller, ds);
             // 22b. return Success (DS -> Controller Reply)
             Message msg22b = createReply(operand, "22b. return Success", ds, controller, msg21b);
             // 23b. Notify User (Controller -> UI -> Owner)
             Message msg23b_1 = createMessage(operand, "23b. Notify User of Status Change", controller, ui);
             Message msg23b_2 = createMessage(operand, "23b. Notify User of Status Change", ui, owner);
             // 24b. Display Confirmation (UI -> Owner Reply)
             createReply(operand, "24b. Display Confirmation", ui, owner, msg20b);

        }

        return operand;
    }

    public static void main(String[] args) {
        // Replace with your desired path
        URI fileURI = URI.createFileURI("C:/UML_Projects/OwnerSequenceDiagram.uml"); 
        createAndSaveModel(fileURI);
    }
}