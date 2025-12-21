import org.eclipse.emf.ecore.resource.Resource;
import org.eclipse.emf.ecore.resource.ResourceSet;
import org.eclipse.emf.ecore.resource.impl.ResourceSetImpl;
import org.eclipse.emf.common.util.URI;
import org.eclipse.uml2.uml.*;
import java.io.IOException;
import java.util.Collections;

public class MapMealUseCaseCreator {

    private static final UMLFactory FACTORY = UMLFactory.eINSTANCE;

    public static void createAndSaveUseCaseModel(URI fileURI) {
        // 1. Setup Resource Set
        ResourceSet resourceSet = new ResourceSetImpl();
        Resource.Factory.Registry.INSTANCE.getExtensionToFactoryMap()
            .put("uml", new org.eclipse.uml2.uml.resource.UMLResource.Factory.Impl());

        // 2. Create the Model
        Model model = FACTORY.createModel();
        model.setName("MapMealUseCases");

        // 3. Create the System Boundary (Package)
        Package systemBoundary = model.createNestedPackage("Smart Restaurant Management System - MapMeal");

        // --- 4. Define Actors ---
        Actor user = createActor(model, "User (Customer)");
        Actor owner = createActor(model, "Owner (Manager)");
        Actor kbRsLogic = createActor(model, "KB RS Logic");

        // --- 5. Define Use Cases ---
        
        // Authentication UCs
        UseCase signUp = createUseCase(systemBoundary, "Sign Up");
        UseCase logInOut = createUseCase(systemBoundary, "Log In / Log Out");
        UseCase authenticateOtp = createUseCase(systemBoundary, "Authenticate User (OTP)");
        UseCase hashPassword = createUseCase(systemBoundary, "Hash Password");
        
        // Customer UCs
        UseCase search = createUseCase(systemBoundary, "Search Restaurants (Location, Criteria)");
        UseCase viewDetails = createUseCase(systemBoundary, "View Restaurant Details (Menu, Location, Ratings)");
        UseCase makeReservation = createUseCase(systemBoundary, "Make Reservation (Date, Day, Guests, Notes)");
        UseCase submitReview = createUseCase(systemBoundary, "Submit Review & Rating");
        UseCase viewStatus = createUseCase(systemBoundary, "View Reservation Status (Confirmed, Pending, Cancelled)");
        UseCase manageFavorites = createUseCase(systemBoundary, "Manage Favorites");
        UseCase viewPromotions = createUseCase(systemBoundary, "View Promotions");
        UseCase viewCustomerDashboard = createUseCase(systemBoundary, "View Customer Dashboard (Counts)");

        // Owner UCs
        UseCase viewOwnerDashboard = createUseCase(systemBoundary, "View Owner Dashboard");
        UseCase manageInfo = createUseCase(systemBoundary, "Manage Restaurant Info");
        UseCase processReservation = createUseCase(systemBoundary, "Process Reservation Request (Change Status)");
        UseCase manageMenu = createUseCase(systemBoundary, "Manage Menu");
        UseCase managePromotions = createUseCase(systemBoundary, "Manage Promotions");
        
        // --- 6. Define Relationships ---

        // Include Relationships
        createInclude(signUp, authenticateOtp, "Sign Up -> Authenticate User (OTP)");
        createInclude(logInOut, authenticateOtp, "Log In / Log Out -> Authenticate User (OTP)");
        createInclude(signUp, hashPassword, "Sign Up -> Hash Password");
        
        // Actor Associations (User)
        createAssociation(user, signUp);
        createAssociation(user, logInOut);
        createAssociation(user, search);
        createAssociation(user, viewDetails);
        createAssociation(user, makeReservation);
        createAssociation(user, submitReview);
        createAssociation(user, viewStatus);
        createAssociation(user, manageFavorites);
        createAssociation(user, viewPromotions);
        createAssociation(user, viewCustomerDashboard);
        
        // Actor Associations (Owner)
        createAssociation(owner, logInOut);
        createAssociation(owner, search);
        createAssociation(owner, viewStatus);
        createAssociation(owner, manageFavorites);
        createAssociation(owner, viewPromotions);
        createAssociation(owner, viewOwnerDashboard);
        createAssociation(owner, manageInfo);
        createAssociation(owner, processReservation);
        createAssociation(owner, manageMenu);
        createAssociation(owner, managePromotions);
        
        // Actor Associations (KB RS Logic)
        createAssociation(kbRsLogic, search, "Recommendation Request");

        // 7. Save the model
        Resource resource = resourceSet.createResource(fileURI);
        resource.getContents().add(model);
        try {
            resource.save(Collections.emptyMap());
            System.out.println("UML Use Case Model saved successfully to: " + fileURI.toFileString());
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    // --- HELPER METHODS ---

    private static Actor createActor(Model model, String name) {
        Actor actor = FACTORY.createActor();
        actor.setName(name);
        model.getPackagedElements().add(actor);
        return actor;
    }

    private static UseCase createUseCase(Package pkg, String name) {
        UseCase uc = FACTORY.createUseCase();
        uc.setName(name);
        pkg.getPackagedElements().add(uc);
        return uc;
    }

    private static Association createAssociation(NamedElement end1, NamedElement end2, String... roleName) {
        Association assoc = FACTORY.createAssociation();
        assoc.setName(end1.getName() + "-" + end2.getName() + " Association");
        
        // Create end properties
        Property prop1 = FACTORY.createProperty();
        prop1.setName(end1.getName().toLowerCase().replaceAll("\\W+", ""));
        prop1.setType((Type) end1);
        assoc.getOwnedEnds().add(prop1);

        Property prop2 = FACTORY.createProperty();
        prop2.setName(end2.getName().toLowerCase().replaceAll("\\W+", ""));
        prop2.setType((Type) end2);
        assoc.getOwnedEnds().add(prop2);

        // Add to nearest package
        Package pkg = (Package) end1.getOwner();
        if (pkg == null) {
            pkg = (Package) end2.getOwner();
        }
        if (pkg != null) {
            pkg.getOwnedMembers().add(assoc);
        }
        
        // Add label/comment for the association (e.g., "Recommendation Request")
        if (roleName.length > 0) {
            assoc.createOwnedComment().setBody(roleName[0]);
        }
        return assoc;
    }
    
    private static Include createInclude(UseCase includingCase, UseCase includedCase, String comment) {
        Include include = includingCase.createInclude(includedCase);
        include.setName(includingCase.getName() + " Includes " + includedCase.getName());
        include.createOwnedComment().setBody(comment);
        return include;
    }

    public static void main(String[] args) {
        // Replace with your desired path
        URI fileURI = URI.createFileURI("C:/UML_Projects/MapMealUseCaseDiagram.uml"); 
        createAndSaveUseCaseModel(fileURI);
    }
}