import org.eclipse.emf.ecore.resource.Resource;
import org.eclipse.emf.ecore.resource.ResourceSet;
import org.eclipse.emf.ecore.resource.impl.ResourceSetImpl;
import org.eclipse.emf.common.util.URI;
import org.eclipse.uml2.uml.*;
import java.io.IOException;
import java.util.Collections;

public class MapMealDeploymentCreator {

    // UML Factory instance
    private static final UMLFactory FACTORY = UMLFactory.eINSTANCE;

    public static void createAndSaveDeploymentModel(URI fileURI) {
        // 1. Setup Resource Set
        ResourceSet resourceSet = new ResourceSetImpl();
        Resource.Factory.Registry.INSTANCE.getExtensionToFactoryMap()
            .put("uml", new org.eclipse.uml2.uml.resource.UMLResource.Factory.Impl());

        // 2. Create the Model (Root Package)
        Model deploymentModel = FACTORY.createModel();
        deploymentModel.setName("MapMealDeployment");
        Package deploymentPackage = deploymentModel.createNestedPackage("DeploymentView");

        // --- 3. Define Nodes and Execution Environments ---

        // Node 1: Client Device
        Node clientDevice = createNode(deploymentPackage, "User Smartphone / PC", "<<Device>>");
        ExecutionEnvironment clientEE = createExecutionEnvironment(clientDevice, "Android / iOS / Browser", "<<Execution Env>>");

        // Node 2: Application Server
        Node appServer = createNode(deploymentPackage, "Application Server", "<<Device>>");
        ExecutionEnvironment serverEE = createExecutionEnvironment(appServer, "Web Server (e.g. Tomcat/Node)", "<<Execution Env>>");

        // Node 3: Database Server
        Node dbServer = createNode(deploymentPackage, "Database Server", "<<Device>>");
        ExecutionEnvironment dbmsEE = createExecutionEnvironment(dbServer, "MySQL DBMS", "<<Execution Env>>");
        
        // Node 4 & 5 (External Servers, grouped conceptually by the cloud shape in XML)
        // Grouping concept is modeled by the Nodes themselves in this simplified view.
        Node googleMaps = createNode(deploymentPackage, "Google Maps API", "<<Server>>");
        Node smsGateway = createNode(deploymentPackage, "SMS Gateway", "<<Server>>");
        

        // --- 4. Define Artifacts and Deployment ---

        // Artifacts deployed on Client Device
        Artifact clientApp = createArtifact(clientEE, "MapMeal Client App");
        
        // Artifacts deployed on Application Server
        Artifact backendApi = createArtifact(serverEE, "MapMeal Backend API");
        Artifact recommender = createArtifact(serverEE, "KB Recommender");
        
        // Artifacts deployed on Database Server
        Artifact dbSchema = createArtifact(dbmsEE, "MapMeal Schema");

        // --- 5. Define Communication Paths (Connections) ---

        // 5.1 Client -> App Server (HTTPS / REST / JSON)
        createCommunicationPath(clientDevice, appServer, "HTTPS / REST / JSON");

        // 5.2 App Server -> DB Server (JDBC / TCP:3306)
        createCommunicationPath(appServer, dbServer, "JDBC / TCP:3306");

        // 5.3 App Server -> Google Maps (HTTPS)
        createCommunicationPath(appServer, googleMaps, "HTTPS");

        // 5.4 App Server -> SMS Gateway (HTTPS (REST))
        createCommunicationPath(appServer, smsGateway, "HTTPS (REST)");


        // 6. Save the model
        Resource resource = resourceSet.createResource(fileURI);
        resource.getContents().add(deploymentModel);
        try {
            resource.save(Collections.emptyMap());
            System.out.println("UML Deployment Model saved successfully to: " + fileURI.toFileString());
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    // --- HELPER METHODS ---

    private static Node createNode(Package pkg, String name, String stereotype) {
        Node node = FACTORY.createNode();
        node.setName(name);
        // In Papyrus, stereotypes are applied from profiles. Here we use it for clarity.
        node.createOwnedComment().setBody(stereotype); 
        pkg.getPackagedElements().add(node);
        return node;
    }

    private static ExecutionEnvironment createExecutionEnvironment(Node parentNode, String name, String stereotype) {
        ExecutionEnvironment ee = FACTORY.createExecutionEnvironment();
        ee.setName(name);
        ee.createOwnedComment().setBody(stereotype);
        parentNode.getOwnedMembers().add(ee);
        return ee;
    }

    private static Artifact createArtifact(ExecutionEnvironment parentEE, String name) {
        Artifact artifact = FACTORY.createArtifact();
        artifact.setName(name);
        parentEE.getNestedArtifacts().add(artifact);
        return artifact;
    }

    private static CommunicationPath createCommunicationPath(Node end1, Node end2, String protocol) {
        CommunicationPath path = FACTORY.createCommunicationPath();
        path.setName(protocol);
        
        // Create two association ends for the path
        Property end1Prop = path.createOwnedEnd(end1.getName() + "End", end1);
        Property end2Prop = path.createOwnedEnd(end2.getName() + "End", end2);
        
        // Add path to the package
        if (end1.getNearestPackage() != null) {
            end1.getNearestPackage().getOwnedMembers().add(path);
        } else if (end2.getNearestPackage() != null) {
            end2.getNearestPackage().getOwnedMembers().add(path);
        }
        
        return path;
    }


    public static void main(String[] args) {
        // Replace with your desired path, e.g., "file:/C:/path/to/my/model.uml"
        URI fileURI = URI.createFileURI("C:/UML_Projects/MapMealDeploymentDiagram.uml"); 
        createAndSaveDeploymentModel(fileURI);
    }
}