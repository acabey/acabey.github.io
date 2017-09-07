import java.util.*;

public class ProtectHarryPotter implements MyPlaces, Command {
	
    private Wizard wizardGuard = null;
    private Squib squibGuard = null;
    private List<Wizard> guards = new ArrayList<Wizard>();
    private String whenProtectionNeeded = null;
	
    private static Wizard harry = new Wizard( "Harry Potter" );
	
    {
        harry.setCurrentlyLocatedAt( Place.Privet_Drive );
    }

    public ProtectHarryPotter( Wizard guard ) {
        wizardGuard = guard;
    }
    public ProtectHarryPotter( Squib guard ) {
        squibGuard = guard;
    }
    public ProtectHarryPotter( List<Wizard>  guards, 
                                     String whenProtectoinNeeded ) {
        this.guards = guards;
        this.whenProtectionNeeded = whenProtectoinNeeded;
    }
    public void execute() throws UnableToProtectHarryPotterException {
        if ( (squibGuard != null)  || (wizardGuard != null) ){
            if (squibGuard != null) {
                squibGuard.setWhomToProtect( harry );
                squibGuard.execute();
            }
            if (wizardGuard != null) {
                wizardGuard.setWhomToProtect( harry );
                wizardGuard.execute();
            } 
        }
        if ( (guards.size() != 0) & (whenProtectionNeeded != null) ) { 
            if (whenProtectionNeeded != 
                          "take Harry Potter to 12 Grimmauld Place") {
                throw new UnableToProtectHarryPotterException(
                          "The activity during which Harry is to be " 
                        + "protected not recognized");
            }
            ListIterator<Wizard> it = guards.listIterator();
            while (it.hasNext()) {
                Wizard wiz = it.next();
                if( wiz.getCanCastDisillusionmentCharm() ) {
                    wiz.castDisillusionmentCharm();
                    break;
                }
            }
            it = guards.listIterator();
            while (it.hasNext()) {
                Wizard wiz = it.next();
                if( !wiz.getMembershipInOrderOfPhoenix() ) {
                    throw new UnableToProtectHarryPotterException(
                              "At least one member of the guards is " 
                            + "a traitor to the cause!");
                }
                System.out.println( wiz 
                   + " will fly in formation and deliver Harry Potter"
                   + " to Number 12, Grimmauld Place");
            }
        }
    }
}
