import java.awt.*;
import javax.swing.*;
import javax.swing.border.*;

public interface PortraitBorderChoices {
    public static final Border redborder = 
            BorderFactory.createMatteBorder(20,20,20,20, Color.red);
    public static final Border blueborder = 
            BorderFactory.createMatteBorder(20,20,20,20, Color.blue);
    public static final Border magentaborder  = 
            BorderFactory.createMatteBorder(20,20,20,20, Color.magenta);
    public static final Border greenborder  = 
            BorderFactory.createMatteBorder(20,20,20,20, Color.green);
}
