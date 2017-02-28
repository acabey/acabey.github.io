import java.util.*;

public class DADA_Year2 implements DADA_State {
	
    private String teacher = "Gilderoy Lockhart";
    
    public String getState() {
        return "Year2";
    }
    public String getTeacher() {
        return teacher;
    }
    public String teacherPersonalityTraits(){
        return "Boastful, narcisstic, superficial ";
    }
    public List<String> terminationConditions() {
        List<String> list =  
                new ArrayList<String>(Arrays.asList(
                   "Accidently put a charm on himself", 
                   "Lost his memory at the end", 
                   "Ended up in St. Mungo's Hospital " +
                      "for Magical Maladies")); 
        return list;
    }
    public String teacherBackground() {
        return "Authored several books on magic";
    }
    public DADA_State changeState() {
        return new DADA_Year3();
    }
}
