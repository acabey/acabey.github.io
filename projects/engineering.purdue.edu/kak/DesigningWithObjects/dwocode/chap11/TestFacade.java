public class TestFacade {
    public static void main( String[] args ) {
		
        // Test the facade for underage wizards:
        UnderageWizardFacade facade1 = new UnderageWizardFacade();
        System.out.println( 
                     "Displaying the Built-In Floo Network:\n\n");
        facade1.displayBuiltinFlooNetwork();	  
        System.out.println("\n\nTESTING UnderageWizardFacade:\n");
        try {
            Path path = facade1.travelByBuiltinFlooNetwork(
                              "The Burrow", "Gryffindor Commons");
            System.out.println( "    The path found: " + path );
        } catch(Exception e)   {
            System.out.println( e.getMessage() );
        }
		
        System.out.println( "\n    Make a direct check on whether a "
                       + "place will be on the shortest path between " 
                       + "two spcified places in the network:\n");
        try {
            boolean answer = facade1.checkForLocationOnShortestPath(
              "The Burrow", "Gryffindor Commons", "Knockturn Alley" );
            System.out.println( "        The answer to whether "
                  + "Knockturn Alley is on the best path: " + answer);
        } catch(Exception e)   {
            System.out.println( "        " + e.getMessage() );
        }		
		
        // Test the facade for grownup wizards:
        System.out.println("\nTESTING WizardFacade:");
        WizardFacade facade2 = new WizardFacade();
        System.out.println( "\n    Make a direct check on whether a " 
                          + "place will be on the shortest path "  
                          + "between two spcified places in the "
                          + "network:\n");
        try {
            boolean answer = facade2.checkForLocationOnShortestPath(
              "The Burrow", "Gryffindor Commons", "Knockturn Alley" );
            System.out.println( "        The answer to whether  " 
                  + "Knockturn Alley is on the best path: " + answer);
        } catch(Exception e)   {
            System.out.println( "        " + e.getMessage() );
        }
        System.out.println( "\n    First get the path you will "
                        + "travel through the network and then " 
                        + "and then try to find out if a certain "
                        + "location will be on the path");
        try {
            Path path = facade2.travelByBuiltinFlooNetwork(
                                  "The Burrow", "Gryffindor Commons");
            System.out.println( "        The path found: " + path );
            boolean answer = facade2.doesGivenPathPassThroughLocation( 
                                            path, "Knockturn Alley" );
            System.out.println( "        The answer to whether "
                  + "Knockturn Alley is on the best path: " + answer);
        } catch(Exception e)   {
            System.out.println( "        " + e.getMessage() );
        }
		
        // Test the facade for warlocks:
        System.out.println("\nTESTING WarlockFacade:");
        WarlockFacade facade3 = new WarlockFacade();
        System.out.println( "\n    Make a direct check on whether a " 
                      + "place will be on the shortest path between "  
                      + "two spcified places in the network:\n");
        try {
            boolean answer = facade3.checkForLocationOnShortestPath(
                                   "The Burrow", "Gryffindor Commons", 
                                                  "Knockturn Alley" );
            System.out.println( "        The answer to whether "
                  + "Knockturn Alley is on the best path: " + answer);
        } catch(Exception e)   {
            System.out.println( "        " + e.getMessage() );
        }
        System.out.println( "\n    First get the path you will "
                + "travel through the network and then and then " 
                + "try to find out if a certain location will be "
                + "on the path");
        try {
            Path path = facade3.travelByBuiltinFlooNetwork(
                                  "The Burrow", "Gryffindor Commons");
            System.out.println( "        The path found: " + path );
            boolean answer = facade3.doesGivenPathPassThroughLocation( 
                                            path, "Knockturn Alley" );
            System.out.println( "        The answer to whether  " 
                  + "Knockturn Alley is on the best path: " + answer);
        } catch(Exception e)   {
            System.out.println( "        " + e.getMessage() );
        }	
        System.out.println("\n    Try constructing a new network "
                          + "by specifying the arcs individually:");
        try {
            Network newnet = facade3.constructNewFlooNetwork( 
                           new String[]{"nn1", "nn2", "nn3", "nn4"} );
            facade3.setNetworkLink( newnet, "nn1", "nn2", 100 );
            facade3.setNetworkLink( newnet, "nn1", "nn3", 50 );
            facade3.setNetworkLink( newnet, "nn2", "nn4", 80 );
            facade3.setNetworkLink( newnet, "nn3", "nn4", 80 );
            facade3.setNetworkLink( newnet, "nn1", "nn4", 180 );
            facade3.setNeighborhoodsAndDisplayNetworkCreated(newnet);
            Path bestPath = facade3.findShortestPathInNewNetwork( 
                                               newnet, "nn1", "nn4" );
            System.out.println( "        The solution path: " 
                                                         + bestPath );
        } catch (Exception e) {
            System.out.println( "        " + e.getMessage() );
        }
        System.out.println("\n    Try constructing a new network by "
                      + "specifying the neighborhoods individually:");
        WarlockFacade facade3_new = new WarlockFacade();
        try {
            Network newnet = 
              facade3_new.constructNewFlooNetworkUsingNeighborhoods( 
               new String[]{"nn11", "nn12", "nn13", "nn14", "nn15" } );
            facade3_new.setOneNeighborhood( newnet, 
                         "nn11",  new String[]{"nn12", "nn14", "nn15"}, 
                                             new int[]{100, 50, 180});
            facade3_new.setOneNeighborhood( newnet, 
                         "nn12",  new String[]{"nn11","nn13", "nn15"} , 
                                               new int[]{100,75, 50});
            facade3_new.setOneNeighborhood( newnet, "nn13", 
		    new String[]{"nn12","nn15"} , new int[]{75,80});
            facade3_new.setOneNeighborhood( newnet, "nn14", 
    		    new String[]{"nn11","nn15"} , new int[]{50,80});
            facade3_new.displayNetwork(newnet);
            Path bestPath = facade3_new.findShortestPathInNewNetwork( 
                                             newnet, "nn11", "nn15" );
            System.out.println( "\n    The solution path: " 
                                                         + bestPath );
        } catch (Exception e) {
            System.out.println( "        " + e.getMessage() );
        }
    }
}
