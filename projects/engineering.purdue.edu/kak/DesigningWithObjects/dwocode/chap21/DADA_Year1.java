import java.util.*;

public class DADA_Year1 implements DADA_State {

    private String teacher = "Quirinus Quirrell";
    
    public String getState() {
        return "Year1";
    }
    public String getTeacher() {
        return teacher;
    }
    public String teacherPersonalityTraits(){
        return "jittery and nervous; wore a turban to hide "
             + "Voldemort's visage at the back of his head";
    }
    public List<String> terminationConditions() {
        List<String> list =  
             new ArrayList<String>(Arrays.asList(
                    "Possessed by Voldemort",
                    "Fought Harry Potter in the dungeons", 
                    "Died as Voldemort flees his body at the end"));
        return list;
    }
    public String teacherBackground() {
        return "Was previously a muggles studies instructor";
    }
    public DADA_State changeState() {
        return new DADA_Year2();
    }
}
