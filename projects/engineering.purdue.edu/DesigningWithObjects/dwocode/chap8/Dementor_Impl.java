import java.util.*;

public class Dementor_Impl extends Humanoid_Impl {
	
    public Dementor_Impl( String occupation ) {
        super( occupation );
    }

    {
        setBehavior( "Dementor", new ArrayList<String>( 
                                      Arrays.asList( "soulless", 
                                                     "prison guard duty", 
                                                     "immortal" 
                                                    ) ) );
        setAppearance( "Dementor", new ArrayList<String>( 
                                      Arrays.asList( "10 feet tall", 
                                                     "no eyes", 
                                                     "hole for mouth" 
                                                   ) ) );
    }

    public int howManyRegistered() {
        int n = 0;
        for (Map.Entry<String, String>  
                      entry: registeredHumanoids.entrySet()) {
            if ( "Dementor".equals( entry.getValue() ) ) n++;
        }
        return n;
    }
}
