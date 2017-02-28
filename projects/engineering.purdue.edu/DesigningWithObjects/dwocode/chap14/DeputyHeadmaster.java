import java.util.*;

public class DeputyHeadmaster extends Adjudicator {
	
    private static DeputyHeadmaster  unique;

    private final static List<Integer> violationsResolved = 
            new ArrayList<Integer>( Arrays.asList( BroomTampering ) );
		
    private DeputyHeadmaster( String name, Adjudicator successor ) {
        super( name, successor );
    }
    // Enforce the condition that there can only 
    // be one Assistant Headmaster:
    public static DeputyHeadmaster makeInstanceOfDeputyHeadmaster(
                                  String name, Adjudicator successor){
        if ( unique == null ) 
            unique = new DeputyHeadmaster( name, successor );
        return unique;
    }
    public DeputyHeadmaster(String name,List<Adjudicator> successors){
        super(name, successors);
    }
    public boolean resolveViolation( int vio ) {
        System.out.println( "    Violation handed over to " + this );
        if ( violationsResolved.contains( new Integer(vio) ) ) {
            System.out.println( "    Violation " 
                + printViolation[vio] + " resolved by the " + this 
                                       + " " + "Professor " + name );
            return true;
        } else {
            return super.resolveViolation(vio);
        }
    }
}
