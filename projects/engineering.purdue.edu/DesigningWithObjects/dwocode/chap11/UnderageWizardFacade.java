public class UnderageWizardFacade extends Facade {

    public Network constructNewFlooNetwork( String[] placeNames ) 
                                                 throws Exception{
        throw new Exception( "An underage wizard is not allowed to "
                           + "construct a new network"); 
    }
    public boolean checkForLocationOnShortestPath( String start, 
             String destination, String place ) throws Exception {
        throw new Exception( "An underage wizard is not allowed to "
                           + "query the network in this manner");
    }
    public boolean doesGivenPathPassThroughLocation( Path path, 
                              String location ) throws Exception {
        throw new Exception( "An underage wizard is not allowed to "
                           + "query the network in this manner");
    }
}
