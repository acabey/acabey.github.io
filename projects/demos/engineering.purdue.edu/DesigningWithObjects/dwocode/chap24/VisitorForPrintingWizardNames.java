public class VisitorForPrintingWizardNames implements Visitor {
	
    public void visit(Auror element) {
        System.out.println(element);
    }
    public void visit(Obliviator element) {
        System.out.println(element);
    }
    public void visit(DepartmentHead element) {
        System.out.println(element);
    }
    public void visit(MinisterForMagic element) {
        System.out.println("      Ministor for Magic: " + element);
    }
}
