import org.eclipse.emf.ecore.resource.Resource;
import org.eclipse.emf.ecore.resource.ResourceSet;
import org.eclipse.emf.ecore.resource.impl.ResourceSetImpl;
import org.eclipse.emf.common.util.URI;
import org.eclipse.uml2.uml.*;
import java.io.IOException;
import java.util.Collections;

public class MapMealComponentCreator {

    // UML Factory instance
    private static final UMLFactory FACTORY = UMLFactory.eINSTANCE;

    public static void createAndSaveComponentModel(URI fileURI) {
        // 1. Setup Resource Set
        ResourceSet resourceSet = new ResourceSetImpl();
        Resource.Factory.Registry.INSTANCE.getExtensionToFactoryMap()
            .put("uml", new org.eclipse.uml2.uml.resource.UMLResource.Factory.Impl());

        // 2. Create the Model (Root Package)
        Model mapMealModel = FACTORY.createModel();
        mapMealModel.setName("MapMealSystem");
        Package componentPackage = mapMealModel.createNestedPackage("Components");

        // --- 3. Define Interfaces (Provided/Required Connectors) ---

        Interface authService = createInterface(componentPackage, "IAuthService");
        Interface bookingService = createInterface(componentPackage, "IBooking");
        Interface recommendService = createInterface(componentPackage, "IRecommend");
        Interface managementService = createInterface(componentPackage, "IManagement");
        // Internal Interface for Database access (using JDBC/SQL as concept)
        Interface jdbcSql = createInterface(componentPackage, "JDBC_SQL"); 
        // Interface for Notification publisher (e.g., Notification Hub)
        Interface notificationPub = createInterface(componentPackage, "INotificationPublisher"); 

        // --- 4. Define Components (Internal) ---
        
        // Component 1: Client App (Main System)
        Component clientApp = createComponent(componentPackage, "MapMeal Client App", "Mobile / Web");
        
        // Component 2-6: Backend Modules
        Component authModule = createComponent(componentPackage, "Authentication Module", "HashPass, OTP Gen");
        Component reservationManager = createComponent(componentPackage, "Reservation Manager", "Booking, Status Update");
        Component recommendEngine = createComponent(componentPackage, "Recommendation Engine (KB RS)", "Constraint Solver");
        Component restaurantManagement = createComponent(componentPackage, "Restaurant Management", "Menu, Promos, Info");
        Component notificationService = createComponent(componentPackage, "Notification Service", "Push Notifications");

        // Component 7: Database (Treated as a component for structure)
        Component mySqlDb = createComponent(componentPackage, "MySQL Database", "User Tbl, Reservation Tbl, etc.");
        
        // --- 5. Define External/Other Components (Dashed/Strikethrough in UML) ---
        
        // External Component: Google Maps (Required Interface/Dependency)
        Component googleMapsApi = createComponent(componentPackage, "Google Maps API", "Location Data");
        
        // External Component: SMS/Email Gateway (Required Interface/Dependency)
        Component smsEmailGateway = createComponent(componentPackage, "SMS/Email Gateway", "Send Messages");

        // --- 6. Define Relationships (Provided/Required/Dependencies) ---
        
        // 6.1: Client App (Requiring Interfaces)
        // ClientApp requires IAuthService (Login/Sign Up)
        clientApp.createInterfaceRealization("Client_Auth_Realization", authService); // Use InterfaceRealization for UML modeling
        // ClientApp requires IBooking (Make Reservation)
        clientApp.createInterfaceRealization("Client_Booking_Realization", bookingService);
        // ClientApp requires IRecommend (Constraints/Query)
        clientApp.createInterfaceRealization("Client_Recommend_Realization", recommendService);
        // ClientApp requires IManagement (Update Menu/Info - for Owner Dashboard)
        clientApp.createInterfaceRealization("Client_Management_Realization", managementService);

        // Dependency: Client App -> Google Maps API (<<use>>)
        createDependency(clientApp, googleMapsApi, "<<use>>");

        // 6.2: Internal Modules (Providing/Requiring Interfaces)
        
        // Auth Module provides IAuthService
        authModule.createInterfaceRealization("Auth_Provides_IAuth", authService);
        // Reservation Manager provides IBooking
        reservationManager.createInterfaceRealization("Reservation_Provides_IBooking", bookingService);
        // Recommendation Engine provides IRecommend
        recommendEngine.createInterfaceRealization("Recommend_Provides_IRecommend", recommendService);
        // Restaurant Management provides IManagement
        restaurantManagement.createInterfaceRealization("Mgmt_Provides_IMgmt", managementService);
        
        // 6.3: Database Access (All backend modules require JDBC/SQL)
        
        // Auth Module requires JDBC/SQL
        createUsage(authModule, jdbcSql);
        // Reservation Manager requires JDBC/SQL
        createUsage(reservationManager, jdbcSql);
        // Recommendation Engine requires JDBC/SQL
        createUsage(recommendEngine, jdbcSql);
        // Restaurant Management requires JDBC/SQL
        createUsage(restaurantManagement, jdbcSql);

        // MySQL DB provides JDBC/SQL
        mySqlDb.createInterfaceRealization("DB_Provides_JDBC", jdbcSql);

        // 6.4: Notification Service
        
        // Reservation Manager requires INotificationPublisher
        createUsage(reservationManager, notificationPub);

        // Notification Service provides INotificationPublisher
        notificationService.createInterfaceRealization("Notifier_Provides_IPublisher", notificationPub);

        // Dependency: Notification Service -> SMS/Email Gateway (<<REST API>>)
        createDependency(notificationService, smsEmailGateway, "<<REST API>>");


        // 7. Save the model
        Resource resource = resourceSet.createResource(fileURI);
        resource.getContents().add(mapMealModel);
        try {
            resource.save(Collections.emptyMap());
            System.out.println("UML Component Model saved successfully to: " + fileURI.toFileString());
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    // --- HELPER METHODS ---

    private static Component createComponent(Package pkg, String name, String details) {
        Component component = FACTORY.createComponent();
        component.setName(name);
        // Add a comment to capture the details shown in the diagram
        component.createOwnedComment().setBody(details); 
        pkg.getPackagedElements().add(component);
        return component;
    }

    private static Interface createInterface(Package pkg, String name) {
        Interface iface = FACTORY.createInterface();
        iface.setName(name);
        pkg.getPackagedElements().add(iface);
        return iface;
    }

    private static Dependency createDependency(Component client, Component supplier, String stereotype) {
        Dependency dep = client.createDependency(supplier);
        dep.setName(client.getName() + "_Uses_" + supplier.getName());
        // For custom stereotypes like <<use>> or <<REST API>>, you would apply them here.
        // Simplified: using the stereotype string in the name or a comment.
        dep.createOwnedComment().setBody("Stereotype: " + stereotype); 
        return dep;
    }
    
    // Represents a Usage (Requirement) relationship in UML
    private static Usage createUsage(Component client, Interface usedInterface) {
        Usage usage = (Usage) client.createUsage(usedInterface);
        usage.setName(client.getName() + "_Requires_" + usedInterface.getName());
        return usage;
    }

    public static void main(String[] args) {
        // Replace with your desired path, e.g., "file:/C:/path/to/my/model.uml"
        URI fileURI = URI.createFileURI("C:/UML_Projects/MapMealComponentDiagram.uml"); 
        createAndSaveComponentModel(fileURI);
    }
}