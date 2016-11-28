import java.util.*;

public class Wizard implements WizardTraits {
	
    private String firstName;
    private String lastName;
    private SchoolGraduatedFrom schoolGraduatedFrom = 
                                    SchoolGraduatedFrom.Unknown;
    private WizardryLevel wizardryLevel = WizardryLevel.Unknown;
    private WizardryStrength strongAt = WizardryStrength.Unknown;
    private HogwartsHouse houseAssigned = HogwartsHouse.Unknown;
	
    public Wizard( String fname, String lname ) {
        firstName = fname; lastName = lname;
    }
    public String toString() { return firstName + " " + lastName; }

    // getter and setter methods for the optional instance variables:
    public WizardryLevel getWizardryLevel() { return wizardryLevel; }
    public void setWizardryLevel( WizardryLevel wl ) {
        wizardryLevel = wl;
    }
    public SchoolGraduatedFrom getSchoolGraduatedFrom() { 
        return schoolGraduatedFrom; 
    }
    public void setSchoolGraduatedFrom( SchoolGraduatedFrom sch ) {
        schoolGraduatedFrom = sch;
    }
    public HogwartsHouse getHouseAssigned() { return houseAssigned; }
    public void setHouseAssigned( HogwartsHouse house ) {
        houseAssigned = house;
    }
    public WizardryStrength getWizardryStrength() { return strongAt; }
    public void setWizardryStrength( WizardryStrength strength ) {
        strongAt = strength;
    }
	
    // Functionality to be overridden in the Obliviagor 
    public boolean isAllowedToPerformMemoryCharm() 
                           throws UnauthorizedAccessException {
        throw new UnauthorizedAccessException( 
                   "Only oblivators allowed to perform Memory Charm" );
    }
    public void alterMuggleMemory( String muggleName ) 
                           throws UnauthorizedAccessException {
        throw new UnauthorizedAccessException( 
                   "Only oblivators allowed to perform Memory Charm" );
    }
	
    // Functionality to be overriden in the Auror class:
    public boolean isAurorInGoodStanding() 
                           throws UnauthorizedAccessException {
        throw new UnauthorizedAccessException( 
                       "This question can only be asked of an auror" );
    }
    public boolean acceptOrderToCaptureDeathEater( Wizard wiz )
                           throws UnauthorizedAccessException {
        throw new UnauthorizedAccessException( 
                           "Only an auror can accept such an orderr" );
    }
	
    // Functionality to be overridden in the DepartmentHead class:
    public String getDepartmentInChargeOf() 
                           throws UnauthorizedAccessException {
        throw new UnauthorizedAccessException( 
                       "Only a dept head can be asked for this info" );
    }
    public void assignOfficesToDepartmentHead( List<String> offices )
                           throws UnauthorizedAccessException {
        throw new UnauthorizedAccessException( 
                          "Only a dept head can be assigned offices" );
    }
    public void reassignDepartment( String newDept ) 
                           throws UnauthorizedAccessException {
        throw new UnauthorizedAccessException( 
                 "Only a dept head can be assigned a new department" );
    }
    public List<String> listOfficesInChargeOf() 
                           throws UnauthorizedAccessException {
        throw new UnauthorizedAccessException(
                 "Offices  can only be listed for a department head" );
    }
	
    // Functionality to be overridden in the MinisterForMagic class:
    public void issueOrderToCaptureDeathEater() 
                          throws UnauthorizedAccessException {
        throw new UnauthorizedAccessException( 
                "Only the minister for magic can issue such an order" );
    }
    public void appointWizardAsObliviator(Wizard w) 
                          throws UnauthorizedAccessException {
        throw new UnauthorizedAccessException(
            "Only the minister for magic can appoint " 
                                          + "a wizard as obliviator" );
    }
    public void appointWizardAsAuror(Wizard w) 
                          throws UnauthorizedAccessException {
        throw new UnauthorizedAccessException( 
          "Only the minister for magic can appoint a wizard as auror" );
    }
    public void appointDepartmentHead(Wizard w) 
                          throws UnauthorizedAccessException {
        throw new UnauthorizedAccessException( 
                "Only the minister for magic can appoint a dept head" );
    }
    public void listEmployeesWorkingAtMinistry() 
                          throws UnauthorizedAccessException {
        throw new UnauthorizedAccessException(
             "This method can only be called on a minister for magic" ); 
    }
}
