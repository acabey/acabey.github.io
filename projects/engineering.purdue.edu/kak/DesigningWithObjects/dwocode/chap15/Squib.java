public class Squib implements MyPlaces, Command {
    private String squibName;
    private Place currentlyLocatedAt;
    private boolean ownsCat = false;
    private Wizard whomToProtect;
	
    public Squib( String squibName ) {       
        this.squibName = squibName;
    }
    public String toString() { return squibName; }

    public void setCurrentlyLocatedAt( Place place ) {
        currentlyLocatedAt = place;
    }
    public Place getCurrentlyLocatedAt() {
        return currentlyLocatedAt;
    }
    public void setOwnsCat( boolean yesOrNo ) {
        ownsCat = yesOrNo;
    }
    public boolean getOwnsCat( ) {
        return ownsCat;
    }
    public void useCatAsLookout( Wizard target ) {
        System.out.println( "Cat owned by " + squibName 
                          + " keeping an eye on " + (Wizard) target );
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
        if ( getOwnsCat() ) {
            useCatAsLookout( whomToProtect ); 
        }
    }
}
