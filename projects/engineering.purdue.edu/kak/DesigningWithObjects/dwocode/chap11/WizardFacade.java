import java.util.*;

public class WizardFacade extends Facade {
    public Network constructNewFlooNetwork( String[] placeNames ) 
                                                   throws Exception{ 
        throw new Exception("Only a warlock can construct a new "
                          + "floo network");
    }
    public boolean checkForLocationOnShortestPath( String start, 
               String destination, String place ) throws Exception {
        initializeBuiltinNetwork();
        Path path = Network.findShortestPath( start, destination, 
                                                             false );
        Iterator<Node> it = path.iterator();
        Node node = new Node(place);
        boolean answer = false;
        while (it.hasNext()) {
            if (node.equals( it.next() )) {
                answer = true;
                break;
            }
        }
        return answer;
    }
    public boolean doesGivenPathPassThroughLocation( Path path, 
                                   String place ) throws Exception {
        initializeBuiltinNetwork();
        Iterator<Node> it = path.iterator();
        Node node = new Node(place);
        boolean answer = false;
        while (it.hasNext()) {
            if (node.equals( it.next() )) {
                answer = true;
                break;
            }
        }
        return answer;
    }
}
