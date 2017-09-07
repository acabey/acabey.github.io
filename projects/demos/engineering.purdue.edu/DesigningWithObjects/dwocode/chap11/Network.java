import java.util.*;

public class Network {

    //Static variables that store information on the built-in network:
    private static List<String> networkAddressesBuiltIn = 
              new ArrayList<String>( Arrays.asList( 
                                        "Diagon Alley", 
                                        "Knockturn Alley",
                                        "Gryffindor Commons",
                                        "DADA Professor's Office",
                                        "Dolores Umbridge's Office",
                                        "The Burrow",
                                        "Ministry of Magic Atrium",
                                        "12 Grimmauld Place"
                                   ) );
    private static List<Node> networkLocationsBuiltIn = 
                                                new ArrayList<Node>();
    private static Map<Node, ArrayList<Node>> neighborhoodsBuiltIn =
                                 new HashMap<Node, ArrayList<Node>>();
    private static List<Link> networkArcsBuiltIn = 
                                                new ArrayList<Link>();

	
    // Instance variables for extensions to the floo network:
    private List<String> networkAddresses = new ArrayList<String>(); 
    private List<Node> networkLocations = new ArrayList<Node>();
    private Map<String,Node> networkNodesHash = 
                                           new HashMap<String,Node>();
    private Map<Node, ArrayList<Node>> neighborhoods = 
                                 new HashMap<Node, ArrayList<Node>>();
    private List<Link> networkLinks = new ArrayList<Link>();	
	

    // Static methods for services from the built-in floo network:
    private static void initializeBuiltInNetworkNodes() {
        Iterator<String> lit = 
                               networkAddressesBuiltIn.listIterator();
        while (lit.hasNext()) {
            networkLocationsBuiltIn.add( new Node( lit.next()) );
        }
        System.out.println( 
                   "Total number of nodes in the network: " 
                             + networkLocationsBuiltIn.size() + "\n");
    }
    public static void initializeBuiltInNetwork(){
        initializeBuiltInNetworkNodes();
        double p = 0.6;
        Object[]  arr =  networkLocationsBuiltIn.toArray();
        for(int i=0; i < arr.length; i++){
            for(int j=i; j < arr.length; j++){
                if ( (j != i) &&  (Math.random() < p) ) {
                    Node nn1 = (Node) arr[i];
                    Node nn2 = (Node) arr[j];
                    networkArcsBuiltIn.add( 
                       new Link(nn1, nn2,  (int)(100*Math.random())));   
                    List<Node> neighborhood = 
                                      neighborhoodsBuiltIn.get( nn1 );
                    if (neighborhood == null) {
                        neighborhoodsBuiltIn.put(  
                         nn1,new ArrayList<Node>(Arrays.asList(nn2)));
                    }else {
                        neighborhood.add( nn2 );
                    }
                    neighborhood = neighborhoodsBuiltIn.get( nn2 );
                    if (neighborhood == null) {
                        neighborhoodsBuiltIn.put(  
                         nn2,new ArrayList<Node>(Arrays.asList(nn1)));
                    }else {
                        neighborhood.add( nn1 );
                    }
                }
            }
        }
    }
    public static void displayNetwork() {
        System.out.println( "Displaying the network:\n" );
        int s = networkArcsBuiltIn.size();
        System.out.println( 
           "Number of direct connections in the network: " + s + "\n" );
        Iterator<Link> lit = networkArcsBuiltIn.listIterator();
        while (lit.hasNext()) {
            System.out.println( lit.next() );
        }
    }
    public static void displayNeighborhoods() {
        System.out.println("    Displaying neighborhoods constructed:\n");
        for ( Object key: neighborhoodsBuiltIn.keySet() ) {
            System.out.println( "    " + key + ": " 
                                    + neighborhoodsBuiltIn.get(key) );
        }
    }
    public static int getDirectConnectionDistanceBetweenTwoNodes( 
                                                Node nn1, Node nn2 ) {
        Link dc = null;
        dc = new Link( nn1, nn2 );
        for (Link conn: networkArcsBuiltIn) {
            if (dc.equals(conn)) {
                return conn.getDirectDistance();
            }
        }
        return -1;
    }

    //Shortest path calculations based on Dijkstra's algorithm:
    public static Path findShortestPath( String place1, 
                    String place2, boolean debug )  throws Exception { 
        Node start = new Node(place1);
        Node destination = new Node(place2);
        if ( !Network.isLocationInNetwork( start ) ||  
                      !Network.isLocationInNetwork( destination ) )
            throw new Exception( 
                  "Either the start or the destination node does not " 
                + "exist in the shortest path calculation");
        Set<Node> keyset = neighborhoodsBuiltIn.keySet();
        boolean keymatch = false;
        for (Node key: keyset) {
            if (start.equals(key) ) keymatch = true;
        }
        if (!keymatch) throw new Exception(
                       "Start node is disconnected from the network");       
        List<Path> pathsToDestExplored = new ArrayList<Path>();
        Collection<Node> visitedNodes = new HashSet<Node>();
        List<Path> listOfPaths = new ArrayList<Path>();
        Path initialPath = new Path( start );
        if (debug) System.out.println( "The initial path is: " 
                                                      + initialPath );
        listOfPaths.add( initialPath );
        int i = 0;
        boolean somePathExtended = false;
        while (visitedNodes.size() < 
                                (networkLocationsBuiltIn.size() -1)) {  
            somePathExtended = false;
            if (listOfPaths.size() == 0) break;
            i++;
            Path pathArray[] = new Path[ listOfPaths.size() ];
            listOfPaths.toArray( pathArray );
            Arrays.sort( pathArray );
            listOfPaths.clear();
            for (Path pa: pathArray ) {
                listOfPaths.add(pa);
            }
            List<Path> newListOfPaths = new ArrayList<Path>();
            for (Path pa: listOfPaths ) {
                if (pa.getLastNode().equals(destination)) {
                    pathsToDestExplored.add(pa);
                } else {
                    newListOfPaths.add(pa);
                }
            }
            listOfPaths = newListOfPaths;
            if (listOfPaths.size() == 0) break;
            Path path = listOfPaths.get(0);
            Node nn = path.getLastNode();
            boolean nodeAlreadyExpanded = false;
            for (Node seen: visitedNodes) {
                if (nn.equals(seen)) {
                    nodeAlreadyExpanded = true;
                    break;
                }
            }
            if (nodeAlreadyExpanded) {
                listOfPaths.remove(0);
                if (listOfPaths.size() == 0) break;
                continue;
            }
            visitedNodes.add(nn);
            List<Node> neighbors = null;
            boolean hasNeighbors = false;
            for ( Object key: neighborhoodsBuiltIn.keySet() ) {
                if (nn.equals( (Node) key )) {
                    neighbors = neighborhoodsBuiltIn.get( key );
                    if (neighbors != null) hasNeighbors = true;
                }
            }
            if (!hasNeighbors) continue;
            for (Node nei: neighbors ) {
                Path newpath = new Path( path );
                newpath.extendPath( nei );
                listOfPaths.add( newpath );
                somePathExtended = true;
            }
            listOfPaths.remove(0);
            if (!somePathExtended) break;
        }    
        if (pathsToDestExplored.size() == 0) 
            throw new Exception( "There exists no path between " 
                      + start + " and " + destination );
        Path pathsToDestExploredArray[] = 
                                 new Path[pathsToDestExplored.size()];
        pathsToDestExplored.toArray( pathsToDestExploredArray );
        Arrays.sort( pathsToDestExploredArray );
        return pathsToDestExploredArray[0];
    }
    public static boolean isLocationInNetwork( Node location ) {
        for ( Node ele: networkLocationsBuiltIn ) {
            if (location.equals( ele )) return true;
        }
        return false;
    }

    // Instance methods for services from extensions to floo net:
    public void setNetworkAddressesAndLocations( String[] places ) {
        for (String place: places) {
            networkAddresses.add( place );
            Node nn = new Node(place);
            networkLocations.add(nn);
            networkNodesHash.put(place, nn);
        } 
    }
    public void setNetworkLink( String place1, String place2, 
                                     int distance ) throws Exception {
        if (!networkAddresses.contains(place1) ||  
                           !networkAddresses.contains(place2))
            throw new Exception(
                             "Incorrect name entered for place name");
        Link newlink = new Link(networkNodesHash.get(place1),
                                networkNodesHash.get(place2), distance);
        for (Link ln: networkLinks) {
            if (ln.equals(newlink)) {
                throw new 
                   Exception("Link created previously --- not allowed");
            }
        } 
        networkLinks.add( newlink );
    }
    public void createNeighborhoods() throws Exception {
        if (networkLocations.size() == 0 || networkLinks.size() == 0) 
            throw new Exception( "Either the nodes or the arcs have "
                               + "not yet been initialized in the "
                               + "network");
        for (Node node: networkLocations) {
            for (Link dc: networkLinks) {
                if ( node.equals( dc.getStartNode() ) ) {
                    List<Node> neighborhood = neighborhoods.get(node);
                    if (neighborhood == null) {
                        neighborhoods.put(  node, 
                            new ArrayList<Node>( 
                             Arrays.asList(dc.getDestinationNode())));
                    }else {
                        neighborhood.add( dc.getDestinationNode());
                    }
                }
                if ( node.equals( dc.getDestinationNode() ) ) {
                    List<Node> neighborhood = neighborhoods.get(node);
                    if (neighborhood == null) {
                        neighborhoods.put( node, new ArrayList<Node>(
                                   Arrays.asList(dc.getStartNode())));
                    }else {
                        neighborhood.add( dc.getStartNode());
                    }
                }
            }
        }
    }

    // When you define a network instant with one neighborhood at a time,
    // you have got to make sure that the direct distances between the
    // nodes are consistent from one neighborhood definition to another.
    public void defineOneNeighborhood( String place, 
               String[] neighbors, int[] distances) throws Exception {
        if (networkLocations.size() == 0) 
            throw new Exception("The nodes have not yet been "
                              + "initialized in the network");
        if (neighbors.length != distances.length) 
            throw new Exception( "The number of neighbors and "
                               + "the numbers of distances must "
                               + "be the same");
        ArrayList<Node> newneighbors = new ArrayList<Node>();
        Node start = null;
        for (Node nd: networkLocations) {
            if (place == nd.toString()) {
                start = nd;
            } 
        }
        if (start == null) {
            start = new Node(place);
        }
        List<Link> newNetworkLinks = new ArrayList<Link>();	
        for (int i=0;i<neighbors.length;i++) {
            boolean link_previously_created = false;
            Node destination = new Node(neighbors[i]);
            Link newlink = new Link(start, destination, distances[i]);
            for (Link ln: networkLinks) {
                if ( ln.equals(newlink) ) {
                    if (ln.getDirectDistance() != newlink.getDirectDistance()) {
                            throw new Exception("Link created previously with a " +
                          "different distance--- not allowed in undirected graphs");
                    } else {
                        link_previously_created = true;
                        break;
                    }
                }
            }
            if (!link_previously_created) {
                newNetworkLinks.add( newlink );
                link_previously_created = false;
            }
            newneighbors.add( destination );
        }
        networkLinks.addAll(newNetworkLinks);
        neighborhoods.put(  start, newneighbors );
    }
    public void displayNetwork2() {
        System.out.println( "Displaying the network:\n" );
        Iterator<Link> lit = networkLinks.listIterator();
        while (lit.hasNext()) {
            System.out.println( lit.next() );
        }
    }
    public void displayNeighborhoods2() {
        System.out.println("\n    Displaying neighborhoods constructed:\n");
        for ( Object key: neighborhoods.keySet() ) {
            System.out.println( "    " + key + ": " + neighborhoods.get(key) );
        }
    }	
    public  int getDirectConnectionDistanceBetweenTwoNodes2( Node nn1, 
                                                          Node nn2 ) {
        Link dc = new Link( nn1, nn2 );
        for (Link conn: networkLinks) {
            if (dc.equals(conn)) {
                return conn.getDirectDistance();
            }
        }
        return -1;
    }
    // The implementation shown below for the per-instance method for 
    // shortest path calculation is basically the same as in the static method 
    // presented earlier.  This is for the covenience of the reader who wishes 
    // to create a best-path calculator as suggested in Section 11.12. Modify
    // the code shown below for best-path calculations in newly conjured up
    // extensions to the built-in Floo network.
    public Path findShortestPath2( String place1, String place2, 
                                  boolean debug ) throws Exception {
        Node start = new Node(place1);
        Node destination = new Node(place2);
         if ( !isLocationInNetwork2( start ) ||  
                       !isLocationInNetwork2( destination ) )
             throw new Exception( "Either the start or the "
                                + "destination node does not exist " 
                                + "for shortest path calculation");
        Set<Node> keyset = neighborhoods.keySet();
        boolean keymatch = false;
        for (Node key: keyset) {
            if (start.equals(key) ) keymatch = true;
        }
        if (!keymatch) throw new Exception(
                  "Start node is disconnected from the network");
        List<Path> pathsToDestExplored = new ArrayList<Path>();
        Collection<Node> visitedNodes = new HashSet<Node>();
        List<Path> listOfPaths = new ArrayList<Path>();
        Path initialPath = new Path( start, this );
        if (debug) System.out.println( "The initial path is: " 
                                                      + initialPath );
        listOfPaths.add( initialPath );
        int i = 0;
        boolean somePathExtended = false;
        while (visitedNodes.size() < (networkLocations.size() -1)) {
            somePathExtended = false;
            if (listOfPaths.size() == 0) break;
            i++;
            Path pathArray[] = new Path[ listOfPaths.size() ];
            listOfPaths.toArray( pathArray );
            Arrays.sort( pathArray );
            listOfPaths.clear();
            for (Path pa: pathArray ) {
                listOfPaths.add(pa);
            }
            List<Path> newListOfPaths = new ArrayList<Path>();
            for (Path pa: listOfPaths ) {
                if (pa.getLastNode().equals(destination)) {
                    pathsToDestExplored.add(pa);
                } else {
                    newListOfPaths.add(pa);
                }
            }
            listOfPaths = newListOfPaths;
            if (listOfPaths.size() == 0) break;
            Path path = listOfPaths.get(0);
            Node nn = path.getLastNode();
            boolean nodeAlreadyExpanded = false;
            for (Node seen: visitedNodes) {
                if (nn.equals(seen)) {
                    nodeAlreadyExpanded = true;
                    break;
                }
            }
            if (nodeAlreadyExpanded) {
                listOfPaths.remove(0);
                continue;
            }
            visitedNodes.add(nn);
            List<Node> neighbors = null;
            boolean hasNeighbors = false;
            for ( Object key: neighborhoods.keySet() ) {
                if (nn.equals( (Node) key )) {
                    neighbors = neighborhoods.get( key );
                    if (neighbors != null) hasNeighbors = true;
                }
            }
            if (!hasNeighbors) continue;
            for (Node nei: neighbors ) {
                Path newpath = new Path( path, this );
                newpath.extendPath2( nei, this );
                listOfPaths.add( newpath );
                somePathExtended = true;
            }
            listOfPaths.remove(0);
            if (!somePathExtended) break;
        }
        if (pathsToDestExplored.size() == 0) 
                throw new Exception("There exists no path between " 
                                         + place1 + " and " + place2);
        Path pathsToDestExploredArray[] = 
                               new Path[ pathsToDestExplored.size() ]; 
        pathsToDestExplored.toArray( pathsToDestExploredArray );
        Arrays.sort( pathsToDestExploredArray );
        return pathsToDestExploredArray[0];
    }	
    public boolean isLocationInNetwork2( Node location ) {
        for ( Node ele: networkLocations ) {
            if (location.equals( ele )) return true;
        }
        return false;
    }
}
