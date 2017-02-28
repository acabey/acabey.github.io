import java.util.*;

public abstract class Humanoid_Impl {
	
    private String name;
    private int age;
    private String servingAs;
	
    // In the <key,value> pairs shown below,  the key is the name of
    // the humanoid and the value the name of the species.  Of the 
    // three static variables defined below, behavior and appearance 
    // are initialized in the the child classes of the 
    // Humanoid_Impl class.
    protected static Map<String, String> registeredHumanoids 
                                      = new HashMap<String,String>();
    protected static Map< String, List<String>> behavior 
                                = new HashMap<String,List<String>>();
    protected static Map< String, List<String>> appearance 
                                = new HashMap<String,List<String>>();  
	
    public Humanoid_Impl( String name, int age ) {
        this.name = name;
        this.age = age;
    }
    public Humanoid_Impl( String occupation ) {
        this.servingAs = occupation;
    }

    public String getName() { return name; }
    public int getAge() { return age; }
    public String getServingAs() { return servingAs; }
	
    public void registerWithMinistryOfMagic( String category ) {
        registeredHumanoids.put( name,  category  );
    }
    public void unRegisterWithMinistryOfMagic( String category ) {
        if ( registeredHumanoids.containsKey( name ) ) {
            if (registeredHumanoids.get( name ).equals(category)) {
                registeredHumanoids.remove( name );
            }
        }
    }
    public abstract int howManyRegistered();

    // The set methods shown below are used in the individual Impl 
    // subclasses for the initialization of the static variables 
    // defined earlier in this class definition:
    public static void setAppearance(String category, List<String> list){
        appearance.put( category, list );
    }
    public static void setBehavior(String category, List<String> list) {
        behavior.put( category, list );
    }
	
    // The get methods defined below are called in the root class 
    // Humanoid to retrieve information in the databases stored in 
    // the static variables defined earlier for this class:
    public  List<String> getAppearance( String category ) {
        return appearance.get( category );
    }
    public  List<String> getBehavior( String category ) {
        return behavior.get( category );
    }
}
