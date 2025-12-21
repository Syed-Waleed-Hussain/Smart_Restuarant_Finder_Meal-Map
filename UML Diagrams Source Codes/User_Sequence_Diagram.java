import org.eclipse.emf.ecore.resource.Resource;
import org.eclipse.emf.ecore.resource.ResourceSet;
import org.eclipse.emf.ecore.resource.impl.ResourceSetImpl;
import org.eclipse.emf.common.util.URI;
import org.eclipse.uml2.uml.*;
import java.io.IOException;
import java.util.Collections;

public class UserSequenceDiagramCreator {

    private static final UMLFactory FACTORY = UMLFactory.eINSTANCE;

    public static void createAndSaveModel(URI fileURI) {
        // 1. Setup Resource Set
        ResourceSet resourceSet = new ResourceSetImpl();
        Resource.Factory.Registry.INSTANCE.getExtensionToFactoryMap()
            .put("uml", new org.eclipse.uml2.uml.resource.UMLResource.Factory.Impl());

        // 2. Create the Model and Interaction (Sequence Diagram)
        Model model = FACTORY.createModel();
        model.setName("UserWorkflowModel");
        Collaboration collaboration = FACTORY.createCollaboration();
        collaboration.setName("UserInteractionCollaboration");
        model.getPackagedElements().add(collaboration);

        Interaction sequenceDiagram = FACTORY.createInteraction();
        sequenceDiagram.setName("UserSearchAndReservation");
        collaboration.getOwnedBehaviors().add(sequenceDiagram);

        // 3. Lifelines (Participants)
        Lifeline user = createLifeline(sequenceDiagram, "User", FACTORY.createActor());
        Lifeline searchUI = createLifeline(sequenceDiagram, "SearchUI", FACTORY.createClass(), "<<Boundary>>");
        Lifeline searchController = createLifeline(sequenceDiagram, "SearchController", FACTORY.createClass(), "<<Control>>");
        Lifeline ds = createLifeline(sequenceDiagram, "RestaurantDS", FACTORY.createClass(), "<<Entity>>");
        Lifeline recommender = createLifeline(sequenceDiagram, "Recommender", FACTORY.createClass(), "<<Control>>");

        // --- 4. Search and Recommendation Flow ---
        
        // 1. Explore Restaurants (User -> SearchUI)
        Message msg1 = createMessage(sequenceDiagram, "1. Explore Restaurants", user, searchUI);
        // 2. initiateSearch (SearchUI -> SearchController)
        Message msg2 = createMessage(sequenceDiagram, "2. initiateSearch()", searchUI, searchController);
        // 3. getInitialData (SearchController -> RestaurantDS)
        Message msg3 = createMessage(sequenceDiagram, "3. getInitialData(Cuisine, Range, Rating, Location)", searchController, ds);
        // 4. return FilteredData (RestaurantDS -> SearchController)
        Message msg4 = createReply(sequenceDiagram, "4. return FilteredData", ds, searchController, msg3);
        // 5. getRecommendations (SearchController -> Recommender)
        Message msg5 = createMessage(sequenceDiagram, "5. getRecommendations(FilteredData)", searchController, recommender);
        // 6. return TopRecommendedList (Recommender -> SearchController)
        Message msg6 = createReply(sequenceDiagram, "6. return TopRecommendedList", recommender, searchController, msg5);
        // 7. displayResults (SearchController -> SearchUI)
        Message msg7 = createReply(sequenceDiagram, "7. displayResults(List)", searchController, searchUI, msg2);
        // 8. View Recommended List (SearchUI -> User)
        Message msg8 = createReply(sequenceDiagram, "8. View Recommended List", searchUI, user, msg1);

        // --- 5. View Details Flow ---
        
        // 9. selectRestaurant (User -> SearchUI)
        Message msg9 = createMessage(sequenceDiagram, "9. selectRestaurant(DetailsRequest)", user, searchUI);
        // 10. viewDetails (SearchUI -> SearchController)
        Message msg10 = createMessage(sequenceDiagram, "10. viewDetails(ID)", searchUI, searchController);
        // 11. getMenuAndReviews (SearchController -> RestaurantDS)
        Message msg11 = createMessage(sequenceDiagram, "11. getMenuAndReviews(ID)", searchController, ds);
        // 12. return Details (RestaurantDS -> SearchController)
        Message msg12 = createReply(sequenceDiagram, "12. return Details", ds, searchController, msg11);
        // 13. displayDetails (SearchController -> SearchUI)
        Message msg13 = createReply(sequenceDiagram, "13. displayDetails()", searchController, searchUI, msg10);
        
        // --- 6. Reservation Flow ---
        
        // 14. requestReservation (User -> SearchUI)
        Message msg14 = createMessage(sequenceDiagram, "14. requestReservation(Date, Guests, Notes)", user, searchUI);
        // 15. submitReservation (SearchUI -> SearchController)
        Message msg15 = createMessage(sequenceDiagram, "15. submitReservation(Data)", searchUI, searchController);
        // 16. createReservation (SearchController -> RestaurantDS)
        Message msg16 = createMessage(sequenceDiagram, "16. createReservation(Data)", searchController, ds);
        // 17. return Reservation ID (RestaurantDS -> SearchController)
        Message msg17 = createReply(sequenceDiagram, "17. return Reservation ID", ds, searchController, msg16);
        // 18. displayStatus (SearchController -> SearchUI)
        Message msg18 = createReply(sequenceDiagram, "18. displayStatus(Pending)", searchController, searchUI, msg15);
        // 19. Reservation Status: Pending (SearchUI -> User)
        Message msg19 = createReply(sequenceDiagram, "19. Reservation Status: Pending", searchUI, user, msg14);

        // 7. Save the model
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
        
        // Add events to the interaction
        container.getFragments().add(sendEvent);
        container.getFragments().add(receiveEvent);
        
        message.setMessageSort(MessageSort.SYNCHCALL_LITERAL);
        message.setSignature(FACTORY.createOperation()); // Placeholder for operation
        
        return message;
    }

    private static Message createReply(Interaction container, String name, Lifeline sender, Lifeline receiver, Message request) {
        Message reply = createMessage(container, name, sender, receiver);
        reply.setMessageSort(MessageSort.REPLY_LITERAL);
        
        // Wire the reply to the request
        reply.setSignature(request.getSignature());
        return reply;
    }

    public static void main(String[] args) {
        // Replace with your desired path
        URI fileURI = URI.createFileURI("C:/UML_Projects/UserSequenceDiagram.uml"); 
        createAndSaveModel(fileURI);
    }
}