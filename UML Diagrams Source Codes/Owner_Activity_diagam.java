import org.eclipse.emf.ecore.resource.Resource;
import org.eclipse.emf.ecore.resource.ResourceSet;
import org.eclipse.emf.ecore.resource.impl.ResourceSetImpl;
import org.eclipse.emf.common.util.URI;
import org.eclipse.uml2.uml.*;
import java.io.IOException;
import java.util.Collections;

public class OwnerActivityDiagramCreator {

    // UML Factory instance
    private static final UMLFactory FACTORY = UMLFactory.eINSTANCE;

    public static void createAndSaveActivityModel(URI fileURI) {
        // 1. Setup Resource Set
        ResourceSet resourceSet = new ResourceSetImpl();
        Resource.Factory.Registry.INSTANCE.getExtensionToFactoryMap()
            .put("uml", new org.eclipse.uml2.uml.resource.UMLResource.Factory.Impl());

        // 2. Create the Model (Root Package)
        Model model = FACTORY.createModel();
        model.setName("OwnerManagementWorkflowModel");

        // 3. Create the main Activity Diagram
        Activity ownerActivity = FACTORY.createActivity();
        ownerActivity.setName("OwnerManagementDashboardWorkflow");
        model.getPackagedElements().add(ownerActivity);

        // --- 4. Create Partitions (Swimlanes) ---
        ActivityPartition ownerUI = createPartition(ownerActivity, "Owner (UI)");
        ActivityPartition systemLogic = createPartition(ownerActivity, "System (Backend Logic)");

        // --- 5. Create Nodes (Initial/Final/Actions/Decision) ---

        // Initial Node
        InitialNode initialNode = ownerActivity.createOwnedNode("Start", InitialNode.class);
        initialNode.setInPartition(ownerUI);

        // UI Actions
        Action login = createAction(ownerUI, "Owner Logs In and Accesses Dashboard Tab");
        DecisionNode selectTask = createDecisionNode(ownerUI, "Select Management Task");
        Action editInfo = createAction(ownerUI, "Edit Restaurant Info");
        Action manageMenu = createAction(ownerUI, "Manage Menu");
        Action managePromotions = createAction(ownerUI, "Manage Promotions");
        Action checkReservations = createAction(ownerUI, "Check/Process Reservations");
        Action returnDashboard = createAction(ownerUI, "Return to Owner Dashboard");
        
        // System Actions
        Action validateInfo = createAction(systemLogic, "Validate & Update Restaurant Data");
        Action validateMenu = createAction(systemLogic, "Validate & Update Menu Data");
        Action validatePromos = createAction(systemLogic, "Validate & Update Promotions");
        Action retrieveRequests = createAction(systemLogic, "Retrieve Pending Requests");
        DecisionNode decisionStatus = createDecisionNode(systemLogic, "Decision: New Status?");
        Action updateStatus = createAction(systemLogic, "Update Reservation Status (Confirmed/Cancelled/Pending)");
        Action notifyUser = createAction(systemLogic, "Notify User of Status Change");
        
        // Final Flow (Merge Node for returning to decision point)
        // We use a simple Control Flow path for the merging point in the diagram (the thick black line).
        MergeNode mergeNode = ownerActivity.createOwnedNode("MergeTaskCompletion", MergeNode.class);
        mergeNode.setInPartition(ownerUI);
        
        // --- 6. Create Control Flows (Transitions) ---

        // Start Flow
        createFlow(initialNode, login);
        createFlow(login, selectTask);

        // --- Task Selection Flow (Decision Node) ---
        
        // 1. Edit Info Path
        createFlow(selectTask, editInfo, "Change/Edit Info");
        createFlow(editInfo, validateInfo, "New Data");
        createFlow(validateInfo, mergeNode); 
        
        // 2. Manage Menu Path
        createFlow(selectTask, manageMenu, "Manage Menu");
        createFlow(manageMenu, validateMenu, "Menu Items");
        createFlow(validateMenu, mergeNode); 

        // 3. Manage Promotions Path
        createFlow(selectTask, managePromotions, "Manage Promotions");
        createFlow(managePromotions, validatePromos, "Promo Details");
        createFlow(validatePromos, mergeNode); 

        // 4. Check Reservations Path
        createFlow(selectTask, checkReservations, "Process Reservations");
        
        // Reservation Processing Loop
        createFlow(checkReservations, retrieveRequests, "Request List");
        createFlow(retrieveRequests, checkReservations, "Pending List"); // Loop back to UI/Owner action
        createFlow(checkReservations, decisionStatus, "Status Change");
        
        // Reservation Decision Path
        createFlow(decisionStatus, updateStatus, "Status: Confirmed/Cancelled");
        createFlow(updateStatus, notifyUser);
        createFlow(notifyUser, mergeNode);
        
        // --- Loop Back to Task Selection (Merge Node) ---
        createFlow(mergeNode, selectTask); // This closes the loop for repeated actions

        // Final Return (for visualization purposes, the diagram shows a clear exit path)
        createFlow(mergeNode, returnDashboard); 
        
        // 7. Save the model
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

    private static ControlFlow createFlow(ActivityNode source, ActivityNode target) {
        return createFlow(source, target, null);
    }

    private static ControlFlow createFlow(ActivityNode source, ActivityNode target, String guard) {
        ControlFlow flow = FACTORY.createControlFlow();
        flow.setSource(source);
        flow.setTarget(target);
        if (guard != null && !guard.isEmpty()) {
            OpaqueExpression guardExpression = FACTORY.createOpaqueExpression();
            guardExpression.getBodies().add(guard);
            flow.setGuard(guardExpression);
        }
        source.getActivity().getEdges().add(flow);
        return flow;
    }

    public static void main(String[] args) {
        // Replace with your desired path
        URI fileURI = URI.createFileURI("C:/UML_Projects/OwnerActivityDiagram.uml"); 
        createAndSaveActivityModel(fileURI);
    }
}