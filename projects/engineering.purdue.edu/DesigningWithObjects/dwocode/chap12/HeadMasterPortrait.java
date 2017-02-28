import javax.swing.*;
import javax.swing.border.*;

public class HeadMasterPortrait  {
	
    private String headMasterName;
    private ImageIcon image;
    private Border borderRequested;
	
    public HeadMasterPortrait( String name, ImageIcon picture, 
                                                 Border border ) {
        headMasterName =name; 
        image = picture;
        borderRequested = border;
    }
	
    public void displayPortrait() throws Exception {
        ImageManager.displaySingleImage( headMasterName, 
                                           image, borderRequested );
    }
}
