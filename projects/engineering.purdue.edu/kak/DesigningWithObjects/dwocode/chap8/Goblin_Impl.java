import java.util.*;

public class Goblin_Impl extends Humanoid_Impl {
	
    public Goblin_Impl( String name, int age ) {
        super( name, age );
    }
    {
        setBehavior( "Goblin", new ArrayList<String>( 
                                    Arrays.asList( "no wands", 
                                                   "goblin magic only", 
                                                   "banking" 
                                                 ) ) );
        setAppearance( "Goblin", new ArrayList<String>( 
                                    Arrays.asList( "long thin fingers", 
                                                   "large domed heads", 
                                                   "large black eyes" 
                                                 ) ) );
    }
    public int howManyRegistered() {
        int n = 0;
        for (Map.Entry<String, String>  entry:  
                                  registeredHumanoids.entrySet()) {
            if ( "Goblin".equals( entry.getValue() ) ) n++;
        }
        return n;
    }
}
