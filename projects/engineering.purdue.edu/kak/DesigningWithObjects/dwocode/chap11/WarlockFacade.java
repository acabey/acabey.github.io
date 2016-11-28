import java.util.Iterator;

public class WarlockFacade extends Facade {
    private boolean networkAddressesAndNodesInitialized = false;
    private boolean networkLinksInitialized = false;
    private boolean networkInitialized = false;

    public Network constructNewFlooNetwork(String[] places) 
                                                     throws Exception{
        Network newnet = new Network();
        newnet.setNetworkAddressesAndLocations( places );
        networkAddressesAndNodesInitialized = true;
        return newnet;
    }
    public void setNetworkLink( Network net, String place1, 
                      String place2, int distance ) throws Exception {
        if (!networkAddressesAndNodesInitialized) 
            throw new Exception("Network nodes not yet initialized");
        net.setNetworkLink( place1, place2, distance );
        networkLinksInitialized = true;
    }
    public Network constructNewFlooNetworkUsingNeighborhoods(
                                   String[] places) throws Exception {
        Network newnet = new Network();
        newnet.setNetworkAddressesAndLocations( places );
        networkAddressesAndNodesInitialized = true;
        return newnet;
    }
    public void setOneNeighborhood( Network newnet, String place, 
              String[] neighbors, int[] distances ) throws Exception {
        if (!networkAddressesAndNodesInitialized) 
            throw new Exception("Network nodes not yet initialized");
        newnet.defineOneNeighborhood( place, neighbors , distances);
        networkInitialized = true;
    }
    public void setNeighborhoodsAndDisplayNetworkCreated( 
                                   Network newnet ) throws Exception {
        if (! networkLinksInitialized ) 
            throw new Exception( "Network nodes and arcs not "
                               + "initialized");
        newnet.createNeighborhoods();
        networkInitialized = true;
        newnet.displayNetwork2();
        newnet.displayNeighborhoods2();
    }
    public void displayNetwork( Network newnet ) throws Exception {
        if (!networkInitialized) 
            throw new Exception( "Network neighborhoods not yet "
                               + "initialized");
        newnet.displayNetwork2();
        newnet.displayNeighborhoods2();
    }
    public Path findShortestPathInNewNetwork( Network newnet, 
                     String place1, String place2 ) throws Exception {
        if (!networkInitialized) 
            throw new Exception( "Network has not yet been "
                               + "initialized");
        Path bestPath = 
                    newnet.findShortestPath2( place1, place2, false );
        return bestPath;
    }
    public boolean checkForLocationOnShortestPath( String start, 
                 String destination, String place ) throws Exception {
        initializeBuiltinNetwork();
        Path path = Network.findShortestPath(start,destination,false );
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
