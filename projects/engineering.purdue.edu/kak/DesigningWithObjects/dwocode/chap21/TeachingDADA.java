import java.util.List;

public class TeachingDADA {
	
    private static DADA_State state;
	
    public TeachingDADA( DADA_State state ) {
        this.state = state;
    }
    public String getState() {
        return state.getState();
    }
    public String getTeacher(){
        return state.getTeacher();
    }
    public String teacherPersonalityTraits() {
        return state.teacherPersonalityTraits();
    }
    public List<String>  terminationConditions() {
        return state.terminationConditions();
    }
    public String teacherBackground() {
        return state.teacherBackground();
    }
}
