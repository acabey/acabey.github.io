import java.util.*;

public class Test {
    public static void main( String args[] ) throws Exception {
 
        Obliviator obl = new Obliviator( "Moomy", "Memsucker" );
        obl.setSchoolGraduatedFrom(
                            WizardTraits.SchoolGraduatedFrom.Hogwarts);
        obl.setWizardryStrength(WizardTraits.WizardryStrength.Charms);
        obl.alterMuggleMemory( "Aunt Marge" );                       //(A)
    	
        Auror auror = new Auror( "Bootsie", "Bangerbolt" );
        auror.setSchoolGraduatedFrom( 
                         WizardTraits.SchoolGraduatedFrom.Beauxbatons);
        auror.setWizardryLevel( WizardTraits.WizardryLevel.Master );
        auror.setWizardryStrength( WizardTraits.WizardryStrength.DADA );
        auror.acceptOrderToCaptureDeathEater( 
                     new Wizard( "Peter",  "Pettigrew" ) );          //(B)
    	
        DepartmentHead deptHead = 
             new DepartmentHead("Amelia", "Bones",
                                               "MaginalLawEnforcement");
        deptHead.assignOfficesToDepartmentHead( 
          new ArrayList<String>( 
                           Arrays.asList("Auror Office","Wizengamot")));
        System.out.println( deptHead.listOfficesInChargeOf() );      //(C)
        deptHead.assignOfficesToDepartmentHead( new ArrayList<String>( 
             Arrays.asList("Wizengamot","Misuse Of Muggle Artifacts")));
        System.out.println( deptHead.listOfficesInChargeOf() );      //(D)
    	
        MinisterForMagic minister = 
           MinisterForMagic.makeInstanceofMinisterForMagic("Cornelius",
                                                               "Fudge");
        minister.appointWizardAsObliviator( obl );
        minister.appointWizardAsAuror( auror );
        minister.appointDepartmentHead( deptHead );
        minister.listEmployeesWorkingAtMinistry();                   //(E)
    }
}
