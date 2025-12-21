import org.eclipse.emf.ecore.resource.Resource;
import org.eclipse.emf.ecore.resource.ResourceSet;
import org.eclipse.emf.ecore.resource.impl.ResourceSetImpl;
import org.eclipse.emf.common.util.URI;
import org.eclipse.uml2.uml.*;
import java.io.IOException;
import java.util.Collections;

public class ReservationTimingDiagramCreator {

    private static final UMLFactory FACTORY = UMLFactory.eINSTANCE;

    public static void createAndSaveTimingModel(URI fileURI) {
        // 1. Setup Resource Set
        ResourceSet resourceSet = new ResourceSetImpl();
        Resource.Factory.Registry.INSTANCE.getExtensionToFactoryMap()
            .put("uml", new org.eclipse.uml2.uml.resource.UMLResource.Factory.Impl());

        // 2. Create the Model and Interaction (Timing Diagram is a specialized Interaction)
        Model model = FACTORY.createModel();
        model.setName("ReservationTimingModel");
        Interaction timingDiagram = FACTORY.createInteraction();
        timingDiagram.setName("ReservationProcessTiming");
        model.getPackagedElements().add(timingDiagram);

        // --- 3. Define Lifelines (Components/Roles) ---
        
        // Note: In UML2, a Lifeline represents a specific object instance.
        Lifeline user = createLifeline(timingDiagram, "User");
        Lifeline system = createLifeline(timingDiagram, "System");
        Lifeline reservation = createLifeline(timingDiagram, "Reservation");
        Lifeline owner = createLifeline(timingDiagram, "Owner");

        // --- 4. Define Times (Time Observation/Points) ---
        
        TimeObservation t0 = createTimeObservation(timingDiagram, "t0 (Start)");
        TimeObservation t1 = createTimeObservation(timingDiagram, "t1 (Search Click)");
        TimeObservation t2 = createTimeObservation(timingDiagram, "t2 (Booking Submit)");
        TimeObservation t3 = createTimeObservation(timingDiagram, "t3 (Owner Notified)");
        TimeObservation t4 = createTimeObservation(timingDiagram, "t4 (Confirmed)");

        // --- 5. Define States/Value Lifeline (Representing the value/state change over time) ---
        
        // State Lifeline (UML does not have a distinct 'State Lifeline' element, 
        // we use StateInvariant to define the state over intervals)
        
        // 5.1 User Lifeline States
        createStateInvariant(user, "Idle", t0, t1);
        createStateInvariant(user, "Browsing", t1, t2);
        createStateInvariant(user, "Waiting", t2, t4);
        createStateInvariant(user, "Idle", t4, null);

        // 5.2 System Lifeline States
        createStateInvariant(system, "Idle", t0, t1);
        createStateInvariant(system, "Processing", t1, t2); // KB RS Logic
        createStateInvariant(system, "Idle", t2, t2); // Short idle after Booking Submit (before Notification)
        createStateInvariant(system, "Processing", t2, t3); // Notification / Initial Save
        createStateInvariant(system, "Idle", t3, null); // Waiting for Owner action (simplified)
        createStateInvariant(system, "Processing", t4, null); // Processing Confirmation

        // 5.3 Reservation Lifeline States
        createStateInvariant(reservation, "Null", t0, t2);
        createStateInvariant(reservation, "Pending", t2, t4);
        createStateInvariant(reservation, "Confirmed", t4, null);
        
        // 5.4 Owner Lifeline States
        createStateInvariant(owner, "Idle", t0, t3);
        createStateInvariant(owner, "Reviewing", t3, t4);
        createStateInvariant(owner, "Idle", t4, null);

        // --- 6. Define Constraints (Timing/Duration) ---

        // {Search < 2s} - Constraint on the duration of System's Processing state (t1 to t2)
        createDurationConstraint(timingDiagram, system, "SearchDuration", "duration < 2s", t1, t2);
        
        // {Session Timeout: 15m} - Constraint on the duration of User's Browsing/Waiting state (t1 to t2/t4)
        createDurationConstraint(timingDiagram, user, "SessionTimeout", "duration < 15m", t1, t2);

        // {Must confirm within 30 min} - Constraint on the duration of Owner's Reviewing state (t3 to t4)
        createDurationConstraint(timingDiagram, owner, "OwnerConfirmationTime", "duration < 30m", t3, t4);


        // 7. Save the model
        Resource resource = resourceSet.createResource(fileURI);
        resource.getContents().add(model);
        try {
            resource.save(Collections.emptyMap());
            System.out.println("UML Timing Model saved successfully to: " + fileURI.toFileString());
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    // --- HELPER METHODS ---

    private static Lifeline createLifeline(Interaction interaction, String name) {
        Classifier participant = FACTORY.createClass();
        participant.setName(name);
        interaction.getNearestPackage().getPackagedElements().add(participant);

        Lifeline lifeline = interaction.createLifeline(name);
        lifeline.setRepresents(interaction.createPartDecomposition(name, participant));
        return lifeline;
    }
    
    private static TimeObservation createTimeObservation(Interaction interaction, String name) {
        TimeObservation obs = FACTORY.createTimeObservation();
        obs.setName(name);
        interaction.getNearestPackage().getPackagedElements().add(obs);
        // Note: In UML, an OccurrenceSpecification marks a specific time point on a lifeline. 
        // We skip detailed occurrence specs for simplicity in this representation.
        return obs;
    }
    
    // Simplifies the creation of a State Invariant (Conceptual state over an interval)
    private static void createStateInvariant(Lifeline lifeline, String stateName, TimeObservation start, TimeObservation end) {
        // In a real UML tool, StateInvariant is defined on a Lifeline. 
        // We use a simple constraint with the state name for conceptual mapping.
        
        Comment stateComment = lifeline.createOwnedComment();
        stateComment.setBody(String.format("State: %s (Start: %s, End: %s)", 
            stateName, 
            start != null ? start.getName() : "Start", 
            end != null ? end.getName() : "End"));
    }
    
    // Simplifies the creation of a Duration Constraint
    private static void createDurationConstraint(Interaction interaction, Lifeline constrainedElement, String name, String specification, TimeObservation start, TimeObservation end) {
        DurationConstraint constraint = FACTORY.createDurationConstraint();
        constraint.setName(name);
        
        OpaqueExpression spec = FACTORY.createOpaqueExpression();
        spec.getBodies().add(specification);
        constraint.setSpecification(spec);
        
        constraint.getConstrainedElements().add(constrainedElement.getRepresents().getType());
        
        // Time points (Duration Interval)
        DurationInterval interval = FACTORY.createDurationInterval();
        
        // This is highly simplified. In full UML, DurationObservation/Constraint 
        // relies on precise time points (OccurrenceSpecification) on the lifeline.
        
        Comment constraintComment = interaction.createOwnedComment();
        constraintComment.setBody(String.format("Constraint on %s: %s, between %s and %s", 
            constrainedElement.getName(), 
            specification, 
            start != null ? start.getName() : "N/A", 
            end != null ? end.getName() : "N/A"));
    }

    public static void main(String[] args) {
        // Replace with your desired path
        URI fileURI = URI.createFileURI("C:/UML_Projects/ReservationTimingDiagram.uml"); 
        createAndSaveTimingModel(fileURI);
    }
}