public class DepartmentHead extends Wizard {

    private String nameOfDepartment;

    public DepartmentHead( String firstname, String lastname, 
                                                  String deptName  ) {
        super( firstname, lastname );
        nameOfDepartment = deptName;
    }
    public String getDepartment() { return nameOfDepartment; }
    public void accept(Visitor visitor) {
        visitor.visit(this);
    }
}
