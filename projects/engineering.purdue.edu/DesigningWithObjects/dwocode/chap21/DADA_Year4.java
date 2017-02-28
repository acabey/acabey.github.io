import java.util.*;

public class DADA_Year4 implements DADA_State {

    private String teacher = 
                  "Alastor Moody -- impersonated by Barty Crouch Jr.";

    public String getState() {
        return "Year4";
    }
    public String teacherPersonalityTraits(){
        return "Bartemius Crouch Jr. used the polyjuice potion to " 
             + "impersonate Alastor Moody so effectively that no one " 
             + "could tell the difference until the very end of the "
             + "year when other circumstances gave the former away; " 
             + "Moody was a retired gruff wizard who had a wooden "
             + "leg, had an erie looking magical eye that could see " 
             + "in all directions, and who in his younger days was "
             + "known to have been a ferocious pursuer of the "
             + "wizards who had gone over to the dark side. "
             + "Crouch Jr.'s impersonation did not belie any of "
             + "these personality traits of Moody";
    }
    public String getTeacher() {
        return teacher;
    }
    public List<String> terminationConditions() {
        List<String> list =  new ArrayList<String>(Arrays.asList(
                    "At the end of the year, Barty Crouch, Jr. was " 
                  + "administered the truth serum since his "
                  + "behavior was inconsistent with what was "
                  + "expected of Moody", 
                    "His true identity revealed, he was administered "
                  + "the Dementor's kiss and hauled away to Azkabahn",
                    "Moody was freed; he went back to retirement" ));
        return list;
    }
    public String teacherBackground() {
        return null;
    }
    public DADA_State changeState() {
        return new DADA_Year5();
    }
}
