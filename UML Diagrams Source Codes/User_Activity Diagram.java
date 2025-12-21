import org.eclipse.emf.ecore.resource.Resource;
import org.eclipse.emf.ecore.resource.ResourceSet;
import org.eclipse.emf.ecore.resource.impl.ResourceSetImpl;
import org.eclipse.emf.common.util.URI;
import org.eclipse.uml2.uml.*;
import java.io.IOException;
import java.util.Collections;

public class UserActivityDiagramCreator {

    private static final UMLFactory FACTORY = UMLFactory.eINSTANCE;

    public static void createAndSaveActivityModel(URI fileURI) {
        // 1. Setup Resource Set
        ResourceSet resourceSet = new ResourceSetImpl();
        Resource.Factory.Registry.INSTANCE.getExtensionToFactoryMap()
            .put("uml", new org.eclipse.uml2.uml.resource.UMLResource.Factory.Impl());

        // 2. Create the Model and Activity Diagram
        Model model = FACTORY.createModel();
        model.setName("CustomerWorkflowModel");
        Activity userActivity = FACTORY.createActivity();
        userActivity.setName("CustomerUserFullWorkflow");
        model.getPackagedElements().add(userActivity);

        // --- 3. Create Partition (Swimlane) ---
        ActivityPartition userFlow = createPartition(userActivity, "Customer/User Interaction Flow");

        // --- 4. Create Nodes (Initial/Final/Actions/Decision/Fork/Join/Merge) ---

        // Initial/Login/Signup Nodes
        InitialNode startNode = userActivity.createOwnedNode("Start", InitialNode.class);
        startNode.setInPartition(userFlow);
        DecisionNode accountDecision = createDecisionNode(userFlow, "Decision: Existing Account?");
        Action signUpCollect = createAction(userFlow, "Collect Sign Up Info (Name, Email, Number, Password)");
        Action systemHashOtp = createAction(userFlow, "System: Hash Password & Send OTP");
        Action verifyOtp = createAction(userFlow, "Enter & Verify OTP for Authentication");
        Action login = createAction(userFlow, "Login (Enter Email & Password)");
        
        // Main Menu/Action Node
        DecisionNode userActionDecision = createDecisionNode(userFlow, "Decision: User Action");
        
        // Explore/Search Nodes
        Action systemAutoFetchLoc = createAction(userFlow, "System: Auto-Fetch Location at Run Time");
        Action inputCriteria = createAction(userFlow, "Input Criteria (Cuisine, Range, Rating)");
        ForkNode searchFork = userActivity.createOwnedNode("SearchInputFork", ForkNode.class);
        searchFork.setInPartition(userFlow);
        JoinNode searchJoin = userActivity.createOwnedNode("SearchInputJoin", JoinNode.class);
        searchJoin.setInPartition(userFlow);
        Action clickSearch = createAction(userFlow, "Click Search");
        Action systemApplyKB = createAction(userFlow, "System: Apply KB RS Logic (Constraints Approach)");
        Action displayResults = createAction(userFlow, "Display Recommended Restaurants List");
        DecisionNode selectRestaurantDecision = createDecisionNode(userFlow, "Decision: Select Restaurant?");
        Action viewDetails = createAction(userFlow, "View Details (Location, Menu/Price, Rating/Reviews)");
        DecisionNode reserveTableDecision = createDecisionNode(userFlow, "Decision: Reserve Table?");
        
        // Reservation/Review Nodes
        Action inputReservation = createAction(userFlow, "Input Reservation Details (Date, Guests, Notes)");
        Action systemCreateReservation = createAction(userFlow, "System: Create Reservation Record (Status: Pending)");
        Action addReviewFavorite = createAction(userFlow, "Add Review / Favorite");
        
        // Other Actions Nodes
        Action myReservation = createAction(userFlow, "My Reservation (Check Status/Details)");
        Action favorites = createAction(userFlow, "Favorites (Check List)");
        Action promotions = createAction(userFlow, "Promotions (Check Offers)");
        Action dashboard = createAction(userFlow, "Dashboard (Check Stats: Reservations, Reviews, Favorites Count)");
        
        // End Nodes
        MergeNode loopMerge = userActivity.createOwnedNode("LoopMerge", MergeNode.class);
        loopMerge.setInPartition(userFlow);
        Action logout = createAction(userFlow, "Logout");
        FinalNode endNode = userActivity.createOwnedNode("End", FinalNode.class);
        endNode.setInPartition(userFlow);


        // --- 5. Create Control Flows ---

        // Start/Login Flow
        createFlow(startNode, accountDecision);
        createFlow(accountDecision, signUpCollect, "No / Sign Up");
        createFlow(signUpCollect, systemHashOtp);
        createFlow(systemHashOtp, verifyOtp);
        createFlow(verifyOtp, login);
        createFlow(accountDecision, login, "Yes / Login");
        createFlow(login, userActionDecision);
        
        // Exploration Flow (Fork/Join)
        createFlow(userActionDecision, searchFork, "Explore");
        createFlow(searchFork, systemAutoFetchLoc);
        createFlow(searchFork, inputCriteria);
        createFlow(systemAutoFetchLoc, searchJoin);
        createFlow(inputCriteria, searchJoin);
        createFlow(searchJoin, clickSearch);
        createFlow(clickSearch, systemApplyKB);
        createFlow(systemApplyKB, displayResults);
        createFlow(displayResults, selectRestaurantDecision);
        
        // Restaurant Selection/Reservation Path
        createFlow(selectRestaurantDecision, viewDetails, "Yes");
        createFlow(viewDetails, reserveTableDecision);
        
        createFlow(reserveTableDecision, inputReservation, "Yes");
        createFlow(inputReservation, systemCreateReservation);
        createFlow(systemCreateReservation, addReviewFavorite);
        createFlow(addReviewFavorite, loopMerge);
        
        // Reservation Decision Loops
        createFlow(selectRestaurantDecision, displayResults, "No / Search Again", true); // Loop back to display list
        createFlow(reserveTableDecision, displayResults, "No / Return to List", true); // Loop back to display list

        // Other Action Paths
        createFlow(userActionDecision, myReservation, "My Reservation");
        createFlow(myReservation, loopMerge);
        
        createFlow(userActionDecision, favorites, "Favorites");
        createFlow(favorites, loopMerge);

        createFlow(userActionDecision, promotions, "Promotions");
        createFlow(promotions, loopMerge);

        createFlow(userActionDecision, dashboard, "Dashboard");
        createFlow(dashboard, loopMerge);
        
        // Main Loop Back and End
        createFlow(loopMerge, userActionDecision, "Return to Main Menu");
        createFlow(userActionDecision, logout, "Logout");
        createFlow(logout, endNode);
        
        // 6. Save the model
        Resource resource = resourceSet.createResource(fileURI);
        resource.getContents().add(model);
        try {
            resource.save(Collections.emptyMap());
            System.out.println("UML Activity Model saved successfully to: " + fileURI.toFileString());
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    // --- HELPER METHODS ---

    private static ActivityPartition createPartition(Activity activity, String name) {
        ActivityPartition partition = FACTORY.createActivityPartition();
        partition.setName(name);
        activity.getGroups().add(partition);
        return partition;
    }

    private static Action createAction(ActivityPartition partition, String name) {
        OpaqueAction action = FACTORY.createOpaqueAction();
        action.setName(name);
        action.setInPartition(partition);
        partition.getActivity().getNodes().add(action);
        return action;
    }

    private static DecisionNode createDecisionNode(ActivityPartition partition, String name) {
        DecisionNode decision = FACTORY.createDecisionNode();
        decision.setName(name);
        decision.setInPartition(partition);
        partition.getActivity().getNodes().add(decision);
        return decision;
    }
    
    // Helper to create flows, optionally setting dashed style for clarity (though UML only defines 'ControlFlow')
    private static ControlFlow createFlow(ActivityNode source, ActivityNode target, String guard, boolean dashed) {
        ControlFlow flow = FACTORY.createControlFlow();
        flow.setSource(source);
        flow.setTarget(target);
        
        if (guard != null && !guard.isEmpty()) {
            OpaqueExpression guardExpression = FACTORY.createOpaqueExpression();
            guardExpression.getBodies().add(guard);
            flow.setGuard(guardExpression);
        }
        
        // Note: UML2 does not have a native 'dashed' property on ControlFlow. 
        // We add a comment/tag for tools like Papyrus to potentially interpret.
        if (dashed) {
            flow.createOwnedComment().setBody("Style: dashed");
        }
        
        source.getActivity().getEdges().add(flow);
        return flow;
    }
    
    private static ControlFlow createFlow(ActivityNode source, ActivityNode target) {
        return createFlow(source, target, null, false);
    }
    
    private static ControlFlow createFlow(ActivityNode source, ActivityNode target, String guard) {
        return createFlow(source, target, guard, false);
    }

    public static void main(String[] args) {
        // Replace with your desired path
        URI fileURI = URI.createFileURI("C:/UML_Projects/UserActivityDiagram.uml"); 
        createAndSaveActivityModel(fileURI);
    }
}