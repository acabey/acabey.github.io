import java.util.*;

public class Player extends Adjudicator{

    private String role;   // must be one of Chaser,
                           // Beater, Seeker, and Keeper
    public Player( String name, String role, Adjudicator successor ) {
        super(name, successor);
        this.role = role; 
    }
    public Player( String name, String role,  
                                      List<Adjudicator> successors ) {
        super(name, successors);
        this.role = role; 
    }
    public boolean resolveViolation( int vio ) {
        if ( !canResolveViolations() ) {
            System.out.println( "   It is not possible to resolve " 
                              + "this violation" );
            return false;
        } else if ( violationsResolved != null && 
                   violationsResolved.contains( new Integer(vio) ) ) {
            System.out.println( "    Violation " + printViolation[vio] 
                          + " resolved by the " + this + " " + name );
            return true;
        } else {
            if ( super.resolveViolation(vio) )                  // (A)
                return true;
            else { 
                System.out.println( "    The violation " 
                      + printViolation[vio] + " cannot be resolved" );
                return false;
            }
        }
    }
 }
