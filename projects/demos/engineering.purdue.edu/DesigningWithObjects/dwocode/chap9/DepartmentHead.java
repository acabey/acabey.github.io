import java.util.*;

public class DepartmentHead extends Wizard {
	
    private String nameOfDepartment;
    private Set<String> officesInChargeOf = new HashSet<String>();
	
    public DepartmentHead(String firstname, String lastname, 
                                                     String deptName){
        super( firstname, lastname );
        nameOfDepartment = deptName;
    }
    public String getDepartmentInChargeOf() 
                      throws UnauthorizedAccessException {
        return nameOfDepartment;
    }
    public void assignOfficesToDepartmentHead( List<String> offices ) 
                                  throws UnauthorizedAccessException {
        officesInChargeOf.addAll( offices );
    }
    public List<String> listOfficesInChargeOf() 
                     throws UnauthorizedAccessException {
        return new ArrayList<String>( officesInChargeOf );
    }
    public void reassignDepartment( String newDept ) 
                        throws UnauthorizedAccessException {
        nameOfDepartment = newDept;
    }
}
