import java.util.*;

public class Referee extends Adjudicator {

    private final static List<Integer> violationsResolved = 
        new ArrayList<Integer>( Arrays.asList( Blatching, Cobbing, 
                 QuafflePocking, Haversacking, Flacking, Stooging, 
                                               Blurting, Bumphing ) );
    public Referee( String name, Adjudicator successor ) {
        super( name, successor );
    }
    public Referee( String name, List<Adjudicator> successors ) {
        super( name, successors);
    }
    public boolean resolveViolation( int vio ) {
        System.out.println( "    Violation handed over to " + this );
        if ( violationsResolved.contains( new Integer(vio) ) ) {
            System.out.println( "   Violation " + printViolation[vio] 
                          + " resolved by the " + this + " " + name );
            return true;
        } else {
            return super.resolveViolation(vio);
        }
    }
}
