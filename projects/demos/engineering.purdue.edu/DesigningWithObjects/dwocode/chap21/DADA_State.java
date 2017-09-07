import java.util.List;

public interface DADA_State {
    public String getState();
    public String getTeacher();
    public String teacherPersonalityTraits();
    public List<String> terminationConditions();
    public String teacherBackground();
    public DADA_State changeState();
}
