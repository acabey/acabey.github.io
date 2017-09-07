import java.util.*;

public class Headmaster extends Adjudicator {

    private static Headmaster unique;
    private final static List<Integer> violationsResolved = 
        new ArrayList<Integer>( 
                       Arrays.asList( UsingWandToEnchantDuringPlay )); 
    private Headmaster( String name ) {
        super( name ); 
    }
    // Enforce the condition that there can only be one Headmaster:
    public static Headmaster makeInstanceOfHeadmaster( String name ) {
        if ( unique == null ) unique = new Headmaster( name );
        return unique;
    }
    public boolean resolveViolation( int vio ) {
        System.out.println( "    Violation handed over to " + this );
        if ( violationsResolved.contains( new Integer(vio) ) ) {
            System.out.println( "    Violation " 
               + printViolation[vio] + " resolved by the " 
                     + this + " " + "Professor " + name );
            return true;
        }
        return false;
    }
}
