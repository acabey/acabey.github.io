import java.util.*;
import javax.swing.ImageIcon;

public class FlyweightImageStore {
	
    private static Hashtable<String,ImageIcon> imageDatabase = 
                                            ImageManager.loadImages(); 
    private static Hashtable<String,ImageIcon> portraitImages = 
                                    new Hashtable<String,ImageIcon>();
    private static int numberImagesOrderedFromArchive = 0;
	
    public static ImageIcon getImage( String name ) 
                                throws ImageNotAvailableException {
        if (portraitImages.containsKey( name ) ) {
            return portraitImages.get( name );
        }
        if ( !imageDatabase.containsKey(name) ) {
        	throw new ImageNotAvailableException();
        }
        ImageIcon newImage = imageDatabase.get( name );
        numberImagesOrderedFromArchive++;
        portraitImages.put(name, newImage);
        return newImage; 
    }

    public static int getPortraitImageStoreSize() { 
        return portraitImages.size(); 
    }

    public static int howManyImagesOrderedFromImageArchive() {
        return numberImagesOrderedFromArchive;
    }
}
