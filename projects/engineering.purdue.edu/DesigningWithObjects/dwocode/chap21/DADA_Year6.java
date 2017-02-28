import java.util.*;

public class DADA_Year6 implements DADA_State {

    private String teacher = "Severus Snape";
	   
    public String getState() {
        return "Year6";
    }
    public String teacherPersonalityTraits(){
        return "Wanted to be a DADA teacher, but mostly taught "
             + "potions, until the sixth year when he got his wish; "
             + "An expert potions make; An oppressive teacher;  "
             + "Was always rough on Harry Potter";
    }
    public String getTeacher() {
        return teacher;
    }
    public List<String> terminationConditions() {
        List<String> list =  new ArrayList<String>(Arrays.asList(
             "Used his magical powers to make Voldemort believe in "
           + "his loyalty to the Dark Lord", 
             "At the end, Voldemort puts him to death believing that "
           + "by doing so he would gain possession of the ElderWand", 
             "Passes on his memories to Harry Potter as he is dying", 
             "His loyalty to the good side, often in doubt, "
           + "is finally restored by Harry Potter"));
        return list;
    }
    public String teacherBackground() {
        return "His being in love with Lily Potter and his hating "
             + "James Potter had much to do with his emotions "
             + "vis-a-vis Harry";
    }
    public DADA_State changeState() {
        return new DADA_Year7();
    }	
}
