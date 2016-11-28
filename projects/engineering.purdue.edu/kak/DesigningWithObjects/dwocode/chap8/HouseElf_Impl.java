import java.util.*;

public class HouseElf_Impl extends Humanoid_Impl {

    public HouseElf_Impl( String name, int age) {
        super( name, age);		
    }
    {
        setBehavior( "House Elf", new ArrayList<String>( 
                                      Arrays.asList( "obedient", 
                                                     "pliant", 
                                                     "loyal" 
                                                   ) ) );
        setAppearance( "House Elf", new ArrayList<String>( 
                                      Arrays.asList( "small", 
                                                     "spindly arms", 
                                                     "large head" 
                                                   ) ) );
    }
    public int howManyRegistered() {
        int n = 0;
        for (Map.Entry<String, String>  entry:  
                                registeredHumanoids.entrySet()) {
            if ( "House Elf".equals( entry.getValue() ) ) n++;
        }
        return n;
    }
}
