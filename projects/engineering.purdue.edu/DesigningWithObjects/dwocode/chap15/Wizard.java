import java.util.*;

public class Wizard implements MyPlaces, Command {
    private String wizardName;
    private Place currentlyLocatedAt;
    private boolean hasInvisibilityCloak = false;
    private boolean canApparate = false;
    private boolean canCastDisillusionmentCharm = false;
    private boolean hasMembershipInOrderOfPhoenix = false;	
    private Wizard whomToProtect;

    public Wizard( String wizardName ) {       
        this.wizardName = wizardName;
    }
    public String toString() { return wizardName; }

    public void setCurrentlyLocatedAt( Place place ) {
        currentlyLocatedAt = place;
    }
    public Place getCurrentlyLocatedAt() {
        return currentlyLocatedAt;
    }
    public void setMembershipInOrderOfPhoenix( boolean truOrFalse ) {
        hasMembershipInOrderOfPhoenix =  truOrFalse;
    }
    public boolean getMembershipInOrderOfPhoenix() {
        return hasMembershipInOrderOfPhoenix;
    }
    public void setCanApparate( boolean yesOrNo ) {
        canApparate = yesOrNo;
    }
    public boolean getCanApparate( ) {
        return canApparate;
    }
    public void aparateTo( Place destination ) {
        System.out.println( "Apparating to "  + destination );
    }
    public void aparateFrom( Place destination ) {
        System.out.println( "Apparating from "  + destination );
    }
    public void setHasInvisibityCloak( boolean yesOrNo ) {
        hasInvisibilityCloak = yesOrNo;    	
    }
    public boolean getHasInvisibilityCloak( ) {
        return hasInvisibilityCloak;    	
    }
    public void followHarryPotter() 
                   throws UnableToProtectHarryPotterException {
        if (!hasInvisibilityCloak) {
            throw new UnableToProtectHarryPotterException();
        } else {
            System.out.println( "Following Harry Potter while staying "
                              + "under an invisibility cloak" );
        }
    }
    public void setCanCastDisillusionmentCharm( boolean yesOrNo ) {
        canCastDisillusionmentCharm = true;
    }
    public boolean getCanCastDisillusionmentCharm() {
        return canCastDisillusionmentCharm;
    }
    public void castDisillusionmentCharm() {
        if (canCastDisillusionmentCharm) {
            System.out.println( wizardName 
                   + " casting Disillusionment Charm on Harry Potter"
                   + " to make him difficult to see" );
        }
    }
    public void setWhomToProtect(Wizard ward) {
        whomToProtect = ward;
    }
    public void execute() throws UnableToProtectHarryPotterException {
        if ( getCurrentlyLocatedAt()  != 
                             whomToProtect.getCurrentlyLocatedAt() ) {
            throw new UnableToProtectHarryPotterException( this
                      + " unable to protect Harry Potter! "
                          + " Harry is at a different location.I");
        }
        if ( getHasInvisibilityCloak() ) {
            followHarryPotter();
        }
    }
}
