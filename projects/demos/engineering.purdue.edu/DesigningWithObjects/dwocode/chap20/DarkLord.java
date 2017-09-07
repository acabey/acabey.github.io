import java.util.*;
import java.io.*;

public class DarkLord  extends Thread implements Observable  {
	
    private static ArrayList<Observer> observers = 
                                            new ArrayList<Observer>();
    private static DarkLord voldemort;
    private DataOutputStream out;
    private ArrayList<DataOutputStream> out_arr;
    private String messageForDeathEaters = 
                       "Bring me Harry Potter --- dead or alive";
    private static int messageID = 0;

    private DarkLord(){
        super();
    }
    public static synchronized DarkLord makeInstanceOfDarkLord() {
        if (voldemort == null) {
            voldemort = new DarkLord();
        }
        return voldemort;
    }
    public synchronized void registerWithObservable( Observer observer ) {
        observers.add( observer );
        System.out.println( "        The loyal " + observer 
                          + " has registered with the Observable");
        int howMany = observers.size();
        System.out.println( "        Now the Dark Lord has  " 
                                       + howMany + " followers\n");
    }
    public synchronized void unRegisterWithObservable(Observer observer) {
        observers.remove( observer );
        System.out.println( "        The disloyal " + observer 
                          + " has unregistered with the Observable");
        int howMany = observers.size();
        System.out.println( "        Now dark lord has  " + howMany 
                          + " followers\n");
    }
    private synchronized void notifyObservers() {
        int this_mesg_id = messageID++;		
        Iterator<Observer> it = observers.iterator();
        while (it.hasNext()) {
            Observer observer = it.next();
            try {
                DataOutputStream out = 
                              observer.outputStreamToBeUsedByObservable();
                System.out.println("       Dark Lord sending message " 
                      + this_mesg_id + " to Death Eater " + observer);
                out.writeUTF( messageForDeathEaters + " <mesg_id: " 
                                                + this_mesg_id + ">");
                out.flush();
            } catch( IOException e ) {
                System.out.println( 
                               "Error at sending end of pipe: " + e );
            }
        }
    }
    public void run() {
        int i = 0;
        while (true) {
            int howMany = observers.size();
            System.out.println( "\n\nRun " + i++ + " of the Observable " 
                                  + "with " + howMany + " observers");
            notifyObservers();
            try {
                Thread.sleep(3000);  
            } catch(InterruptedException e) {}
        }
    }
}
