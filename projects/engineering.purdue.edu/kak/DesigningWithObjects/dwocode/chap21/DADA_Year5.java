import java.util.*;

public class DADA_Year5 implements DADA_State {
	
    private String teacher = "Dolores Umbridge";
	   
    public String getState() {
        return "Year5";
    }
    public String teacherPersonalityTraits(){
        return "Not conversant with the practical side of DADA;  "
             + "made students learn by just reading the book; " 
             + "an agent of the Minister of Magic, sent to Hogwarts "
             + "by the ministry to deal with Harry Potter's "
             + "assertion (which was supported by Dumbledore) that "
             + "Voldemort had returned to power; imposed harsh "
             + "punishment on Harry Potter to get him to disavow "
             + "his belief in Voldemort's return ; hated by most "
             + "students and staff" ;
    }
    public String getTeacher() {
        return teacher;
    }
    public List<String> terminationConditions() {
        List<String> list =  new ArrayList<String>(Arrays.asList(
             "Removed from Hogwarts after the Ministry of Magic "
           + "admitted to the fact that Voldemort had returned to "
           + "power", 
             "Was hauled away to the forbidden forest in an "
           + "injured state", 
             "Eventually returned to the Minstry of Magic"));
        return list;
    }
    public String teacherBackground() {
        return null;
    }
    public DADA_State changeState() {
        return new DADA_Year6();
    }	
}
