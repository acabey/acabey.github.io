public class VisitorForPrintingHouseNames implements Visitor {
    public void visit(Auror element) {
        System.out.println( "      House assigned to " + element 
                                + " : " + element.getHouseAssigned() );
    }
    public void visit(Obliviator element) {
        System.out.println( "      House assigned to " + element 
                                + " : " + element.getHouseAssigned() );
    }
    public void visit(DepartmentHead element) {
        System.out.println( "      House assigned to " + element 
                                + " : " + element.getHouseAssigned() );
    }
    public void visit(MinisterForMagic element) {
        System.out.println( "      House assigned to " + element 
                                + " : " + element.getHouseAssigned() );
    }
}
