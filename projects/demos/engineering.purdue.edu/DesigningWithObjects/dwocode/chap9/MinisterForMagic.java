import java.util.*;

public class MinisterForMagic extends Wizard {
	
    private Set<Obliviator> obliviators = new HashSet<Obliviator>();
    private Set<Auror> aurors = new HashSet<Auror>();
    private Set<DepartmentHead> deptHeads = 
                                        new HashSet<DepartmentHead>();
	
    // This will hold the reference to the only one minister that 
    // is allowed to be constructed from this class:
    private static MinisterForMagic theMinister;
	
    //NOTE: This constructor is private because we want to make sure
    //      it is not possible to construct more than one Minister
    //      of magic
    private MinisterForMagic( String firstname, String lastname ) {
        super( firstname, lastname );
    }
	
    public static MinisterForMagic makeInstanceofMinisterForMagic( 
                                       String fname, String lname ) {
        if ( theMinister == null )
            theMinister = new MinisterForMagic( fname, lname );
        return theMinister;
    }
	
    public void appointWizardAsObliviator(Wizard w) 
                         throws UnauthorizedAccessException {
        obliviators.add( (Obliviator) w);
    }
    public void appointWizardAsAuror(Wizard w) 
                         throws UnauthorizedAccessException {
        aurors.add( (Auror) w );
    }
    public void appointDepartmentHead(Wizard w) 
                         throws UnauthorizedAccessException {
        deptHeads.add( (DepartmentHead) w );
    }
    public void listEmployeesWorkingAtMinistry() 
                         throws UnauthorizedAccessException {
        Iterator<Obliviator> it1 = obliviators.iterator();
        Iterator<Auror> it2 = aurors.iterator();
        Iterator<DepartmentHead> it3 = deptHeads.iterator();
        while (it1.hasNext()) System.out.print( it1.next() + "   ");
        while (it2.hasNext()) System.out.print( it2.next() + "   ");
        while (it3.hasNext()) System.out.print( it3.next() + "   ");
    }
}
