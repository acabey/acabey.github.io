import java.io.*;

public class DarkWizard extends Wizard implements DarkWizardTraits {
	
    private TalkToDarkLord uplink;
    private LinkFromDarkLord downlink;

    private static DarkLord youKnowWho = 
                      DarkLord.makeInstanceOfDarkLord( "Voldemort" );

    public DarkWizard(String name){
        super(name);
    }

    //////////////////   Inner class TalkToDarkLord   ////////////////  
    public class TalkToDarkLord extends Thread {
        private DataOutputStream out; 
        private String nameOfSender;
        private String outgoingMessage = null;
        public TalkToDarkLord(OutputStream outsm, String nameOfSender){
            this.nameOfSender = nameOfSender;
            out = new DataOutputStream( outsm );        
        }
        public void sendMessageToDarkLord(String msg) {
            outgoingMessage = msg + "\n";
        }
        public void run() {                                          
            for (;;) {
                try {
                    while (outgoingMessage == null) {
                        sleep(100 + 100 * (long) Math.random() );
                    }
                    System.out.println( nameOfSender + ":  " 
                                                  + outgoingMessage );
                    out.writeChars( outgoingMessage );
                    out.flush();   
                    outgoingMessage = null;
                    sleep( 500 +  1000 * (long) Math.random() );
                } catch( Exception e ) { 
                    System.out.println( "Error: " + e ); 
                }
            }
        }
    }

    ////////////////   Inner class LinkFromDarkLord   ////////////////   
    public class LinkFromDarkLord extends Thread {
        private BufferedReader in;
        public boolean answerReceived = false;
        public LinkFromDarkLord( InputStream istr ) {   
            try { 
                in = new  BufferedReader( 
                              new InputStreamReader(istr, "UTF-16" ));
            } catch(Exception e){ System.out.println( "Error: " + e);}
        }
        public void run() {
            for (;;) {
                try {
                    String answer = in.readLine();
                    System.out.println( youKnowWho.getName() + ": " 
                                                   + answer + "\n\n");
                    answerReceived = true;
                    sleep( 100 + 100 * (long) Math.random() );
                } catch(InterruptedException e){ 
                    System.out.println( "InterruptedException: " + e );
                } catch( IOException e ) {
                    System.out.println( "Error: " + e );
                }
            }
        }	
    }

    /////////////////   The rest of the DarkWizard code   ////////////
    public void establishCommunicationLinkWithDarkLord() {
        try {
            // for incoming messages:
            PipedOutputStream pout2 = new PipedOutputStream();  
            PipedInputStream pin2 = new PipedInputStream( pout2 ); 
            DarkLord.TalkToDarkWizard  downlink_origin =  
                             youKnowWho.new TalkToDarkWizard( pout2 ); 
            downlink = new LinkFromDarkLord( pin2 );			
            // for outgoing messages:
            PipedOutputStream pout = new PipedOutputStream();  
            PipedInputStream pin = new PipedInputStream( pout ); 
            uplink = new TalkToDarkLord( pout, name ); 
            DarkLord.LinkFromDarkWizard uplink_endpoint = 
               youKnowWho.new LinkFromDarkWizard(pin,downlink_origin); 
            uplink.start();
            uplink_endpoint.start();
            downlink_origin.start();
            downlink.start();
        } catch( IOException e ){
            System.out.println( 
                 "ERROR in establishing communication link up: " + e);
        }    
    }
	
    public void assignedTask( String goal ){
        establishCommunicationLinkWithDarkLord();
        try {
            uplink.sendMessageToDarkLord( "My Master, Is this your "
                                    + "command that I " + goal + "?");
            while (!downlink.answerReceived) {
                Thread.sleep(100 + 100 * (long) Math.random() );
        }
        downlink.answerReceived = false;
            uplink.sendMessageToDarkLord( "What does this mirror do? "
                              + "How does it work? Help me, Master!");
            while (!downlink.answerReceived) {
                Thread.sleep(100 + 100 * (long) Math.random() );
            }
            downlink.answerReceived = false;
            uplink.sendMessageToDarkLord( "Master, the boy is not "
                                                    + "cooperating!");
            while (!downlink.answerReceived) {
                Thread.sleep(100 + 100 * (long) Math.random() );
            }
            downlink.answerReceived = false;
            uplink.sendMessageToDarkLord( "Master, I can't. "
                                   + "My hands!!  My hands!!!");
            while (!downlink.answerReceived) {
                Thread.sleep(100 + 100 * (long) Math.random() );
            }
            downlink.answerReceived = false;
        } catch(InterruptedException e){}
    }

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
