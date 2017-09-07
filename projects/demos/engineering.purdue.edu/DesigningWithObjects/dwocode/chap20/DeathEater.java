import java.io.*;

public class DeathEater extends Thread implements Observer {
	
    private DataInputStream in;
    private DataOutputStream out_used_by_volde;
    private Observable voldemort;
    private boolean loyalty_to_dark_lord;
    private boolean registered_with_observable;
    private long startTime = System.currentTimeMillis();
    private int loyaltyDurationTimePeriod = 
                                     2000 + (int) (Math.random()*500);
    private String name;
     
    public DeathEater( String name, Observable observable, OutputStream ostr, 
                                                  InputStream istr ) {
        this.name = name;
        voldemort = observable;
        out_used_by_volde = new DataOutputStream( ostr );
        in = new DataInputStream( istr );
    }
    public DataOutputStream outputStreamToBeUsedByObservable() {
        return out_used_by_volde;
    }
    public String toString()	{
        return name;
    }
    public void run() {
        int j = 0;
        //while (j < 400) {
        while (true) {
            System.out.println( "\n        " + this 
                                            + " starting run " + j++);
            long currentTime = System.currentTimeMillis();  
            long diffTime = currentTime - startTime;
            int which_interval = 
                           (int) diffTime / loyaltyDurationTimePeriod;
            if( which_interval % 2 == 1) {
                loyalty_to_dark_lord = false;
                System.out.println( "        " + this 
                                + " is no longer loyal to Dark Lord");
            } else {
                loyalty_to_dark_lord = true;
                System.out.println( "        " + this 
                                  + " declares loyalty to Dark Lord");
            }
            if (loyalty_to_dark_lord) {
                if (!registered_with_observable) {
                    registered_with_observable = true;
                    voldemort.registerWithObservable( this );
                }
            } else {
      	        if (registered_with_observable) {
                    registered_with_observable = false;
                    voldemort.unRegisterWithObservable( this );
                }
            }
            getMessageFromObservable(loyaltyDurationTimePeriod);
        }
    }
    public void getMessageFromObservable( int howLong ) {
        int quarter = howLong / 4;
        for (int i=0;i<4;i++){
            if (i%2 == 0) {
                if (registered_with_observable) {
                    long curr = System.currentTimeMillis();
                    while (System.currentTimeMillis()  <  
                                                     curr + quarter) {
                        try {
                            BufferedInputStream buffin = 
                                          new BufferedInputStream(in);
                            if (buffin.available() > 0) {
                                String messageReceived = in.readUTF();
                                System.out.println( "        " + this 
                                         + " received message from " 
                                         + "Dark Lord: " 
                                         + messageReceived );
                            }
                        } catch( IOException e ) {
                            System.out.println(
                              "Error at receiving end of pipe: " + e);
                        }
                    }
                } else {
                    long timeAtTheMoment = System.currentTimeMillis();
                    while ( (System.currentTimeMillis() 
                                       - timeAtTheMoment) < quarter  )
                        ;
                    }
                } else {
                    try {
                        sleep(quarter);
                } catch( InterruptedException e ){}
            }
        }
    }
    public void getMessageFromObservable2( int howLong ) {
        int quarter = howLong / 4;
        for (int i=0;i<4;i++){
            if (i%2 == 0) {
                if (registered_with_observable) {
                    long curr = System.currentTimeMillis();
                    while (System.currentTimeMillis()  
                                                  <  curr + quarter) {
                        try {
                            String messageReceived = in.readUTF();
                            System.out.println( "        " + this 
                                + " received message from Dark Lord: "
                                + messageReceived );
                        } catch( IOException e ) {
                            System.out.println(
                              "Error at receiving end of pipe: " + e);
                        }
                    }
                } else {
                    long timeAtTheMoment = System.currentTimeMillis();
                    while ( (System.currentTimeMillis() 
                                    - timeAtTheMoment) < quarter  )
                        ;
                }
            } else {
                try {
                    sleep(quarter);
                } catch( InterruptedException e ){}
            }
        }
    }
}
