import java.util.*;

public class Teacher extends Adjudicator  {

    private final static List<Integer> violationsResolved = 
        new ArrayList<Integer>( Arrays.asList( 
                                       FailureToReturnAfterTimeout )); 
	
    public Teacher( String name, Adjudicator successor ) {
        super( name, successor );
    }
    public Teacher( String name, List<Adjudicator> successors ) {
        super( name, successors );
    }
    public boolean resolveViolation( int vio ) {
        System.out.println( "    Violation handed over to " + this );
        if ( violationsResolved.contains( new Integer(vio) ) ) {
            System.out.println( "    Violation " 
                           + printViolation[vio] + " resolved by the "
                                 + this + " " + "Professor " + name );
            return true;
        } else {
            return super.resolveViolation(vio);
        }
    }
}
