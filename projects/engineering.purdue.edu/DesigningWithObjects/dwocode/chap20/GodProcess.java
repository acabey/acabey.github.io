import java.io.*;
import java.util.*;

public class GodProcess extends Thread {
    static Observable voldemort = DarkLord.makeInstanceOfDarkLord();
    static ArrayList<Observer> observers = new ArrayList<Observer>();
	
    static void addNewObserver( String name, Observable observable ) {
        try {
            PipedOutputStream pout = new PipedOutputStream();
            PipedInputStream pin      = new PipedInputStream(pout);
            observers.add( new DeathEater( name, observable, pout, pin ));
        } catch(IOException e){ 
            System.out.println( "Error in creating a pipe: " + e);
        }
    }

    public static void main( String[] args ) {
        addNewObserver( "Malfoy", voldemort );
        addNewObserver( "Wormtail", voldemort );
		 
        ((Thread) voldemort).start();
		
        Iterator<Observer> it = observers.iterator();
        while (it.hasNext()){
            ((Thread) it.next()).start();
        }
    }
}
