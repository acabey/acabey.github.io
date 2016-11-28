import java.util.*;

public class Invoker {
    static private List<Command> invokerCommandList = 
                                           new ArrayList<Command>();
    static public void addToCommandList( Command command ) { 
        invokerCommandList.add( command ); 
    } 

    static public void invokeExecute(){ 
        ListIterator<Command> iter = invokerCommandList.listIterator();
        while ( iter.hasNext() ) { 
            System.out.println();   
            try {
                iter.next().execute();
            } catch(UnableToProtectHarryPotterException e) {
                e.printStackTrace();
            }
        } 
        invokerCommandList = new ArrayList<Command>(); 
    }                 
}
