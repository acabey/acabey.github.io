import java.util.*;

public class Client implements MyPlaces {

    public static void main(String[] args) {
        Squib battyOldNeighbor = new Squib( "Arabella Figg" );
        battyOldNeighbor.setCurrentlyLocatedAt(Place.Privet_Drive );
        battyOldNeighbor.setOwnsCat( true );
        Command c1 = new ProtectHarryPotter( battyOldNeighbor );
        Invoker.addToCommandList( c1 );
        Invoker.invokeExecute();
        
        Wizard sneakThief = new Wizard( "Mundungus Fletcher");       
        sneakThief.setHasInvisibityCloak( true );
        sneakThief.setCanApparate( true );
        sneakThief.setCurrentlyLocatedAt(Place.Privet_Drive );	
        Command c2 = new ProtectHarryPotter( sneakThief );
        Invoker.addToCommandList( c2 );
        Invoker.invokeExecute();
        
        Wizard guard1 = new Wizard("Mad-Eye Moody");
        Wizard guard2 = new Wizard("Nymphadora Tonks");
        Wizard guard3 = new Wizard("Remus Lupin");
        guard1.setMembershipInOrderOfPhoenix( true );
        guard1.setCanCastDisillusionmentCharm(true);
        guard2.setMembershipInOrderOfPhoenix( true ); 
        guard3.setMembershipInOrderOfPhoenix( true );
        List<Wizard> guards = new ArrayList<Wizard>(
                                Arrays.asList(guard1, guard2,guard3));
        Command c3 = new ProtectHarryPotter( guards, 
                          "take Harry Potter to 12 Grimmauld Place" );
        Invoker.addToCommandList( c3 );
        Invoker.invokeExecute();
    }
}
