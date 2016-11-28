public class Client  {
    public static void main(String[] args) throws Exception {
		
        Obliviator obl = new Obliviator( "Blasted", "Brainsucker" );
        obl.setHouseAssigned( "Gryffindor" );
	   	
        Auror auror = new Auror( "Bootsie", "Slickbottom" );
        auror.setHouseAssigned( "Slytherin" );
 
        DepartmentHead deptHead = new DepartmentHead( "Amelia", 
                                 "Bones", "MargicalLawEnforcement");

        MinisterForMagic minister = 
           MinisterForMagic.makeInstanceofMinisterForMagic("Cornelius",
                                                         "Fudge");
        minister.appointWizardAsObliviator( obl );
        minister.appointWizardAsAuror( auror );
        minister.appointDepartmentHead( deptHead );
    	
        System.out.print("\nListing employees at the ministry:   ");
        minister.listEmployeesWorkingAtMinistry();
		
        System.out.println("\n\nOutput from 'Print Wizard Names' "  
                      + "Visitor from the MinisterForMagic instance:");
        minister.accept( new VisitorForPrintingWizardNames() );
    	
        System.out.println("\n\nOutput from 'Print House Names' " 
                      + "Visitor from the MinisterForMagic instance:");
        minister.accept( new VisitorForPrintingHouseNames());
    	
        System.out.print("\n\nOutput from 'Print Wizard Names' "
                       + "Visitor from the Obliviator instance:    ");
        obl.accept( new VisitorForPrintingWizardNames() );
    }
}
