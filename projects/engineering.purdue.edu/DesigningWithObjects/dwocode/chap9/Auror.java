import java.util.*;

public class Auror extends Wizard {
	
    private List<Wizard> deathEatersAssigned = new ArrayList<Wizard>();
    private boolean hasPreviousExperienceInDealingWithDeathEaters 
                                                               = false;
	
    public Auror( String firstname, String lastname ) {
        super( firstname, lastname );
    }
	
    public boolean isAurorInGoodStanding() 
                    throws UnauthorizedAccessException {
        if (!this.getWizardryLevel().equals(
                   WizardTraits.WizardryLevel.Master)) {
            System.out.println( 
              "This wizard is not qualified to capture a Death Eater");
            return false;
        }
        if (!this.getWizardryStrength().equals( 
                   WizardTraits.WizardryStrength.DADA ) ) {
            System.out.println( 
              "This wizard is not qualified to capture a Death Eater");
            return false;
        }
        for (SchoolGraduatedFrom school : SchoolGraduatedFrom.values()){
            if ( school.equals( this.getSchoolGraduatedFrom() ) ) {
                return true;
            }
        }
        System.out.println( 
              "This wizard is not qualified to capture a Death Eater");
        return false;
    }	

    public boolean acceptOrderToCaptureDeathEater(Wizard deathEater)
                                   throws UnauthorizedAccessException {
        if ( !hasPreviousExperienceInDealingWithDeathEaters ) {
            if ( isAurorInGoodStanding() ) {
                deathEatersAssigned.add( deathEater );
                hasPreviousExperienceInDealingWithDeathEaters = true;
                System.out.println( 
                     "Order to capture " + deathEater + " accepted" );
                return true;
            }
        } else if (deathEatersAssigned.size()  < 5) {
            deathEatersAssigned.add( deathEater );
                System.out.println( 
                   "Order to capture " + deathEater + " accepted" );
            return true;
        }
        System.out.println( 
             "Order to capture " + deathEater + " was not accepted" );
        return false;
    }
}
