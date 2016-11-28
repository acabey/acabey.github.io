import java.util.*;

public class DADA_Year7 implements DADA_State {
	
    private String teacher = "Amycus Carrow";
	   
    public String getState() {
        return "Year7";
    }
    public String teacherPersonalityTraits(){
        return "A Death Eather; Fought on the side of Voldemort; "
             + "Tortured students for punishment; ";
    }
    public String getTeacher() {
        return teacher;
    }
    public List<String> terminationConditions() {
        List<String> list =  new ArrayList<String>(Arrays.asList(
                                 "Arrested after Voldemort's fall", 
                                 "Presumably sent to Azkaban" ));
        return list;
    }
    public String teacherBackground() {
        return null;
    }
    public DADA_State changeState() {
        return null;
    }	
}
