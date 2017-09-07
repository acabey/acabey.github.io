public abstract class Facade {
    
    private static boolean builtinNetworkInitialized = false;
	
    public void initializeBuiltinNetwork() {
        if (builtinNetworkInitialized) return;
        builtinNetworkInitialized = true;
        Network.initializeBuiltInNetwork();
    }
    public void displayBuiltinFlooNetwork() {
        initializeBuiltinNetwork();
        Network.displayNetwork();
        System.out.println( "\nDisplaying direct connection "
                          + "neighborhoods in the network:\n");
        Network.displayNeighborhoods();
    }
    public boolean doesDestinationExistInBuiltinNetwork(
                                                 String destination) {
        initializeBuiltinNetwork();
        return Network.isLocationInNetwork( new Node(destination) );
    }
    public Path travelByBuiltinFlooNetwork( String startLocation, 
                                                String endLocation ) {
        initializeBuiltinNetwork();
        Path bestPath = null;
        try {
	    bestPath = Network.findShortestPath( startLocation, 
                                                 endLocation, false );
        } catch(Exception e) {
            e.printStackTrace();
            System.exit(1);
        }
        return bestPath;
    }
    public abstract Network constructNewFlooNetwork(
                                String[] placeNames) throws Exception;
    public abstract boolean checkForLocationOnShortestPath( 
                      String start, String destination, String place ) 
                                                     throws Exception;
    public abstract boolean doesGivenPathPassThroughLocation( 
                                          Path path, String location ) 
                                                     throws Exception;
}
