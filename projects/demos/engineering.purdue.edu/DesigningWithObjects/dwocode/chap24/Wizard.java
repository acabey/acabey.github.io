public abstract class Wizard implements Element {

    private String firstName;
    private String lastName;
    private String houseAssigned = "Unknown";
	
    public Wizard( String fname, String lname ) {
        firstName = fname; lastName = lname;
    }

    public String toString() { return firstName + " " + lastName; }
	
    public String getHouseAssigned() { return houseAssigned; }
    public void setHouseAssigned( String house ) {
        houseAssigned = house;
    }
	
    public void appointWizardAsObliviator(Wizard w) 
                             throws UnauthorizedAccessException {
        throw new UnauthorizedAccessException( "Only the minister "
                    + "of magic can appoint a wizard as obliviator" );
    }
    public void appointWizardAsAuror(Wizard w) 
                             throws UnauthorizedAccessException {
        throw new UnauthorizedAccessException( "Only the minister "
                         + "of magic can appoint a wizard as auror" );
    }
    public void appointDepartmentHead(Wizard w) 
                             throws UnauthorizedAccessException {
        throw new UnauthorizedAccessException( "Only the minister "
                               + "of magic can appoint a dept head" );
    }
    public void listEmployeesWorkingAtMinistry() 
                            throws UnauthorizedAccessException {
       throw new UnauthorizedAccessException( "This method can only "
                               + "be called on a minister of magic" );
    }
}
