import java.io.*;

public class DarkLord extends Wizard implements DarkWizardTraits {
	
    private static DarkLord unique = null;

    private DarkLord(String name){
        super(name);
        setCanCastUnforgivableCurses(true);
        setCanBrewDarkPotions(true);
        setCanAnimateInferi(true);
    }
    public static DarkLord makeInstanceOfDarkLord(String darkLordName){
        if (unique == null) unique = new DarkLord(darkLordName);
        return unique;
    }
    public void goal(String g, DarkWizard proxy ) {
        proxy.assignedTask( g );
    }

    /////////////////   Inner class TalkToDarkWizard   ///////////////  
    public class TalkToDarkWizard extends Thread {
        private DataOutputStream out;   
        private String outgoingMessage = null;
        public TalkToDarkWizard( OutputStream outsm ) {   
            out = new DataOutputStream( outsm );        
        }
        public void setOutgoingMessage(String msg) {
            outgoingMessage = msg + "\n";
        }
        public void run() {                                          
            for (;;) {
                try {
                    while (outgoingMessage  == null) {		
                        sleep(100 * (long) Math.random() );
                    }
                    out.writeChars( outgoingMessage );
                    out.flush();  
                    outgoingMessage = null;
                    sleep( 100 * (long) Math.random() );
                } catch( Exception e ) { 
                    System.out.println( "Error: " + e ); 
                }
            }
        }
    }

    ////////////////   Inner class LinkFromDarkWizard   //////////////
    public class LinkFromDarkWizard extends Thread {
        private BufferedReader in;
        private TalkToDarkWizard talkdownlink;
        public LinkFromDarkWizard( InputStream istr, 
                               TalkToDarkWizard talkdownlink ) {  
            this.talkdownlink = talkdownlink;
            try { 
                in = new  BufferedReader( 
                              new InputStreamReader(istr, "UTF-16" ));
            } catch(Exception e){}
        }
        public void run() {
            for (;;) {
                try {
                    // readLine() blocks until it sees a sequence 
                    // of chars that end a newline character
                    String msgReceived = in.readLine();
                    if (msgReceived.contains( "I can't")) {
                        talkdownlink.setOutgoingMessage("KILL HIM!");
                    } else if (msgReceived.contains( 
                                        "What does this mirror do")) {
                        talkdownlink.setOutgoingMessage(
                                 "Use the boy.....Use the boy...");
                    } else if (msgReceived.contains( 
                                      "the boy is not cooperating")) {
                        talkdownlink.setOutgoingMessage(
                                                      "SIEZE HIM!!!");
                    } else if (msgReceived.contains(  
                                            "Is this your command")) {
                        talkdownlink.setOutgoingMessage(
                                            "Yes, that is correct!");
                    }      
                    sleep( 100 );
                } catch(InterruptedException e){ 
                    System.out.println( "InterruptedException: " + e );
                } catch( IOException e ) {
                    System.out.println( "Error: " + e );
                }
            }
        }
    }

    /////////////////   The rest of the DarkLord code   ////////////// 
    public void setCanCastUnforgivableCurses(boolean yesOrNo) {
        canCastUnforgivableCurses = yesOrNo;
    }
    public void setCanBrewDarkPotions(boolean yesOrNo){
        canBrewDarkPotions = yesOrNo;
    }
    public void  setCanAnimateInferi(boolean yesOrNo){
        canAnimateInferi = yesOrNo;
    }
}
