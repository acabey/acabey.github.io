import javax.swing.*;
import javax.swing.border.*;

public class PortraitMakerAssignment implements PortraitBorderChoices {

    String headmastername;
    HeadMasterPortrait portrait;
	
    public PortraitMakerAssignment( String name, Border border ) {
        headmastername = name;
        ImageIcon imageRequested = null;
        try {
            imageRequested = 
                       FlyweightImageStore.getImage( headmastername );
        } catch (ImageNotAvailableException e) {
            System.out.println( "This portrait cannot be made since " 
                              + headmastername + "'s image is not "
                              + "available in the image archive");
        }
        if (imageRequested != null)
            portrait = 
                 new HeadMasterPortrait(name, imageRequested, border);
        }
 
    public static void main( String[] args ) throws Exception {
        PortraitMakerAssignment job1 = 
           new PortraitMakerAssignment("Ambrose Swott", greenborder );
        job1.portrait.displayPortrait();
        
        PortraitMakerAssignment job2 = 
             new PortraitMakerAssignment("Basil Fronsac", redborder );
        job2.portrait.displayPortrait();
        
        PortraitMakerAssignment job3 = 
             new PortraitMakerAssignment("Ambrose Swott", redborder );
        job3.portrait.displayPortrait();
        
        PortraitMakerAssignment job4 = 
            new PortraitMakerAssignment("Phineas Nigellus Black", 
                                                         blueborder );
        job4.portrait.displayPortrait();
        
        System.out.println( "Number of images in the portrait "
                  + "maker's image store: " 
                  + FlyweightImageStore.getPortraitImageStoreSize() );
        System.out.println( "Number of images ordered from the image "
                          + "archive: "
           + FlyweightImageStore.howManyImagesOrderedFromImageArchive());
    }
}
