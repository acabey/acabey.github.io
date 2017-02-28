import java.util.*;

public class Dragon implements Cloneable {
	
    private String whatType;
    private String nativeRange = "Unknown";
    private List<String> likesToEat = 
                 new ArrayList<String>( Arrays.asList( "Unknown" ) );
    private int length;                              // in feet
	
    private final static Set<String> allTypes = 
                                  new HashSet<String>(Arrays.asList(
           "Chinese Fireball", 
           "Hungarian Horntail",
           "Common Welsh Green",
           "Norwegian Ridgeback",
           "Hebridean Black",
           "Peruvian Vipertooth",
           "Romanian Longhorn",
           "Swedish Short-Snout") );

    private Dragon(String whatType) throws UnknownDragonException {
        try {
            if ( allTypes.contains( (Object) whatType ) ) { 
                this.whatType = whatType;
                if ( whatType.equals( "Chinese Fireball" ) ) {
                    nativeRange = "China";
                    likesToEat  =  
                        new ArrayList<String>( 
                                    Arrays.asList("pigs","humans"));
                    length = 25;
                } else if ( whatType.equals("Hungarian Horntail")) {
                    nativeRange = "Hungary";
                    likesToEat  =  
                       new ArrayList<String>( 
                                   Arrays.asList("goats","humans"));
                    length = 50;
                } else if ( whatType.equals("Common Welsh Green")) {
                    nativeRange = "Wales";
                    likesToEat  =  
                       new ArrayList<String>(Arrays.asList("sheep")); 
                    length = 18;
                } else if ( whatType.equals("Norwegian Ridgeback")){
                    nativeRange = "Norway";
                    likesToEat  =  
                         new ArrayList<String>( 
                               Arrays.asList("large land mammals"));
                    length = 35;
                } else if ( whatType.equals("Hebridean Black")) {
                    nativeRange = "Scotland";
                    likesToEat  =  
                       new ArrayList<String>( 
                            Arrays.asList("deer", "dogs", "cattle"));
                    length = 30;
                } else if (whatType.equals("Peruvian Vipertooth")) {
                    nativeRange = "Peru";
                    likesToEat  =  
                           new ArrayList<String>( 
                             Arrays.asList("goats","cows","humans"));
                    length = 15;
                } else if (whatType.equals("Romanian Longhorn")) {
                    nativeRange = "Romania";
                    length = 40;
                } else if (whatType.equals("Swedish Short-Snout")) {
                    nativeRange = "Sweden";
                    likesToEat  =  
                        new ArrayList<String>( 
                                   Arrays.asList("dogs", "humans"));
                    length = 22;
                } 
            } else {
                throw new UnknownDragonException( 
                    "Dragons of type " + whatType + " do not exist");
            }
        } catch( ClassCastException e ) {
            e.printStackTrace();
            System.exit(1);
        }
    }
    public static Dragon makeNewDragonInstance( String whatType ) 
                                 throws UnknownDragonException {
        // This is where you can place additional code for
        // authenticating access to the makeNewDragonInstance() 
        // method.
        return new Dragon( whatType );
    }
    public String getAttributes() {
        return whatType + " is native to " 
                        + nativeRange + ", likes to eat " 
                        + likesToEat 
                        + ", and is generally of length " 
                        + length;
    }
    public void setHabitat( String range ) {
        nativeRange = range;
    }
    public void addThingsToEat( String newItem ) {
        likesToEat.add( newItem );
    }
    public Object clone() throws CloneNotSupportedException {
        Dragon d = (Dragon) super.clone();
        d.likesToEat = new ArrayList<String>( likesToEat );
        return d;
    }
    public String toString() {
        return this.getClass().getName() + " of kind " + whatType;
    }
}
