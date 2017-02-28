import java.util.*;

public abstract class Adjudicator implements Violations {
	
    protected String name;
    protected List<Adjudicator> successors = 
                                        new ArrayList<Adjudicator> ();
    protected List<Integer>  violationsResolved = 
                                             new ArrayList<Integer>();
    public Adjudicator( String name ) { this.name = name; }
    public Adjudicator( String name, Adjudicator successor ) {
        this.name = name;
        if (successor != null)
            successors.add( successor );
        }
    public Adjudicator( String name, List<Adjudicator> successors ) {
        this.name = name;
        this.successors = successors;
    }
    public void addAdjudicator( Adjudicator adjudicator ) {
        this.getSuccessors().add( adjudicator );		
    }
    public boolean canResolveViolations() {
        if ( violationsResolved.isEmpty() 
                & getSuccessors().isEmpty() ) return false;
        return true;
    }
    public boolean resolveViolation( int vio ) {
        boolean vioResolved = false;
        if ( getSuccessors().isEmpty() ) {
             return false;
        } else {
            ListIterator<Adjudicator> iter =successors.listIterator();
            while ( iter.hasNext() ) {
                vioResolved = false;
                if( iter.next().resolveViolation( vio ) ) {
                    vioResolved = true;
                    break;
                }
            }
        }
        return vioResolved;
    }
    public List<Integer> getViolationsResolved() {
        return violationsResolved;
    }
    public void setSuccessors( List<Adjudicator> successors ) {
        this.successors = successors;
    }
    public List<Adjudicator> getSuccessors() {
        return successors;
    }
    public String toString() {
        if ( this instanceof Player) return "Player";
        if ( this instanceof Referee) return "Referee";
        if ( this instanceof Teacher) return "Teacher";	
        if ( this instanceof  DeputyHeadmaster ) 
            return "Deputy Headmaster";
        if ( this instanceof Headmaster) return "Headmaster";
        return "";
    }
}
