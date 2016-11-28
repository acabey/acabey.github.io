import java.util.*;

public class DADA_Year3 implements DADA_State {

    private String teacher = "Remus Lupin";
    
    public String getState() {
        return "Year3";
    }
    public String teacherPersonalityTraits(){
        return "was revealed to be a werewolf by Snape; " 
             + "an excellent teacher; taught Harry the "
             + "Petronous charm; recommended eating chocolate "
             + "to relieve the effects of dementors if "
             + "present nearby ";
    }
    public String getTeacher() {
        return teacher;
    }
    public List<String> terminationConditions() {
        List<String> list =  new ArrayList<String>(Arrays.asList(
                  "Forced to step down after Snape reveals " + 
                                              "Lupin as a werewolf"));
        return list;
    }
    public String teacherBackground() {
        return null;
    }
    public DADA_State changeState() {
        return new DADA_Year4();
    }
}
