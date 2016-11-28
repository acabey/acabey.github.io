import java.util.Hashtable; 
import java.util.StringTokenizer; 
import javax.swing.*;
import javax.swing.border.*;
import java.awt.*;             //for Graphics, Color, Dimension, etc.
import java.awt.event.*;
import java.io.*;                // for File

public class ImageManager {
	
    public static int nextPhotoDisplayIndex = 0;

    public static Hashtable<String,ImageIcon> loadImages() {
        File fileobj = new File( "." ); 
        FilenameFilter jpegOnly = new FilenameFilter() { 
            public boolean accept( File dir, String name ) { 
                return name.endsWith( ".jpg" ); 
            }
        }; 
        String[] allImageFiles = fileobj.list( jpegOnly );  
        int numImages = allImageFiles.length;
        Hashtable<String,ImageIcon> hash = 
                                    new Hashtable<String,ImageIcon>();
        String name = "";
        for (int i=0; i < numImages; i++) {
            int index = allImageFiles[i].lastIndexOf(".");
            String restOfFileName = 
                                  allImageFiles[i].substring(0,index);
            StringTokenizer st = 
                           new StringTokenizer( restOfFileName, "_" );
            while (st.hasMoreTokens() ) {
                name += " " + st.nextToken();            
            }
            // Get rid of extra space at the beginning:
            name = name.substring(1); 
            hash.put( name, new ImageIcon( allImageFiles[i] ) );
            name = "";
        }                   
        return hash;
    }

    public static void displaySingleImage( Hashtable<String,
                      ImageIcon> hash, String name) throws Exception {
        if ( ! hash.containsKey( name ) ) {
            throw new Exception("Database does not contain the image "
                              + "named");
        }
        nextPhotoDisplayIndex++;
        JFrame f = new JFrame( "Single Image Display" );
        f.addWindowListener(new WindowAdapter() {
            public void windowClosing(WindowEvent e) {
                System.exit(0);
            }
        });
        Container cPane = f.getContentPane();       
        int width = 600;
        int height = 500;
        int displayWidth = 
             width - cPane.getInsets().left - cPane.getInsets().right;
        int displayHeight = 
            height - cPane.getInsets().top - cPane.getInsets().bottom;
        JLabel label = 
        new JLabel( name, (ImageIcon) hash.get(name), JLabel.CENTER );
        label.setVerticalTextPosition(JLabel.BOTTOM);
        label.setHorizontalTextPosition(JLabel.CENTER);
        Border border = 
          BorderFactory.createMatteBorder(20, 20, 20, 20, Color.red );
        label.setBorder( border );
        JScrollPane scrollableImage = new JScrollPane( label );
        scrollableImage.setPreferredSize( new Dimension( displayWidth,
                                                    displayHeight-8));
        if ( scrollableImage != null ) {
            cPane.add( scrollableImage );
        }
        f.pack();
        f.setSize( 600, 600 );
        f.setLocation( 100*nextPhotoDisplayIndex, 
                                           100*nextPhotoDisplayIndex);
        f.setVisible( true );
    }
    
    public static void displaySingleImage( String name, 
                    ImageIcon image, Border border) throws Exception {
        nextPhotoDisplayIndex++;
        JFrame f = new JFrame( "Single Image Display" );
        f.addWindowListener(new WindowAdapter() {
            public void windowClosing(WindowEvent e) {
                System.exit(0);
            }
        });
        Container cPane = f.getContentPane();       
        int width = 600;
        int height = 500;
        int displayWidth = 
             width - cPane.getInsets().left - cPane.getInsets().right;  
        int displayHeight = 
            height - cPane.getInsets().top - cPane.getInsets().bottom;
        JLabel label = new JLabel( name,  image, JLabel.CENTER );
        label.setVerticalTextPosition(JLabel.BOTTOM);
        label.setHorizontalTextPosition(JLabel.CENTER);
        label.setBorder( border );
        JScrollPane scrollableImage = new JScrollPane( label );
        scrollableImage.setPreferredSize(new Dimension( displayWidth,
                                                    displayHeight-8));
        if ( scrollableImage != null ) {
            cPane.add( scrollableImage );
        }
        f.pack();
        f.setSize( 600, 600 );
        f.setLocation( 100*nextPhotoDisplayIndex, 
                                           100*nextPhotoDisplayIndex);
        f.setVisible( true );
    }

    public static void slideshow() {
        ImageManager.SlideShowDisplay slideshow = 
                                  new ImageManager.SlideShowDisplay();
        slideshow.slideshow();
    }

    private static class SlideShowDisplay extends JRootPane {
        Timer timer;
        int frameIndex = -1;       //the current frame number
        int numImages;             //number of images to display
        int width;                 //width of the frame's content pane
        int height;                //height of the frame's content pane
        int displayWidth;
        int displayHeight;
        JComponent contentPane;     //the content pane
        ImageIcon images[];         //the images
        String imageNames[];
        boolean finishedLoading = false;
        JScrollPane scrollableImage;
        boolean newFrameAvailable = false;
    
        private SlideShowDisplay() {
            int pause = 1000;
            numImages = 3;
            width = 600;
            height = 500;
    
            displayWidth = width - getInsets().left - 
                                                    getInsets().right;
            displayHeight = height - getInsets().top - 
                                                    getInsets().bottom;
    
            contentPane = new JPanel() {
                public void paintComponent( Graphics g ) {
                    super.paintComponent( g );
                    if ( finishedLoading && newFrameAvailable ) {
                        JLabel label = new JLabel( 
                                               imageNames[frameIndex],
                                                 images[ frameIndex ], 
                                                      JLabel.CENTER );
                        label.setVerticalTextPosition(JLabel.BOTTOM);
                        label.setHorizontalTextPosition(JLabel.CENTER);
                        Border border = 
                          BorderFactory.createMatteBorder(20,20,20,20, 
                                                          Color.red );
                        label.setBorder( border );
                        scrollableImage = new JScrollPane( label );
                        scrollableImage.setPreferredSize( 
                          new Dimension( displayWidth, 
                                                displayHeight - 8 ) );
                    }
                    if ( scrollableImage != null ) {
                        this.removeAll();
                        this.add( scrollableImage, BorderLayout.NORTH );
                    }
                    this.revalidate();
                    //                    this.setVisible( true );
                    newFrameAvailable = false;
                }
            };
            contentPane.setBackground(Color.white);
            setContentPane(contentPane);
    
            timer = new Timer( pause, new ActionListener() {
                    public void actionPerformed( ActionEvent evt ) {
                        frameIndex++;
                        if ( frameIndex == numImages )
                            frameIndex = 0;
                        newFrameAvailable = true;
                        contentPane.repaint();
                    }
            });
            timer.setInitialDelay( 0 );
            timer.setCoalesce(false);        
    
            new Thread() {
                    public void run() {
                        loadImages();
                    }
            }.start();
        }
        private void loadImages() {
            File fileobj = new File( "." ); 
            FilenameFilter jpegOnly = new FilenameFilter() { 
                    public boolean accept( File dir, String name ) { 
                        return name.endsWith( ".jpg" ); 
                    }
                }; 
            String[] allImageFiles = fileobj.list( jpegOnly );  
            numImages = allImageFiles.length;
            System.out.println( "Number of images found "+numImages );
            imageNames = new String[numImages];
            for (int i=0; i < numImages; i++) {
                imageNames[i] = allImageFiles[i];                  
                System.out.println( allImageFiles[i] );
            }                   
            images = new ImageIcon[numImages];
            for ( int i = 0; i < numImages; i++ ) {
                images[i] = new ImageIcon( allImageFiles[i] );
            }        
            finishedLoading = true;
            timer.start();
        }
        private void slideshow() {
            JFrame f = new JFrame( "slide show" );
            f.addWindowListener(new WindowAdapter() {
                public void windowClosing(WindowEvent e) {
                    System.exit(0);
                }
            });
            Container cPane = f.getContentPane();       
            cPane.add( this, BorderLayout.CENTER );
            f.pack();
            f.setSize( 600, 550 );
            f.setVisible( true );
        }
    }
}
