// This code example is from the following source:
//
// Book Title:  Programming with Objects, A Comparative Presentation
//              of Object-Oriented Programming with C++ and Java
//
// Book Author:   Avinash Kak
//
// Chapter:     Chapter 18  Multithreaded Object-Oriented Programming
//
// Section:     Section 18.1  Creating And Executing Simple Threads In Java
//



//ThreadsBasicWithJoin.java

class HelloThread extends Thread { 
    String message;

    HelloThread( String message ) { this.message = message; }

    public void run() {
        //int sleeptime = (int) ( Math.random() * 3000 );
        //try {                                 
        //    sleep( sleeptime );
        //  } catch( InterruptedException e ){}   
        System.out.print( message );
    }

    public static void main(String[] args) throws InterruptedException
    {
        HelloThread ht1 = new HelloThread( "Good" );
        HelloThread ht2 = new HelloThread( " morning" ); 
        HelloThread ht3 = new HelloThread( " to" );

        ht1.start();
        ht2.start();
        ht3.start();

        ht1.join();                                               //(H) 
        ht2.join();                                               //(I)
        ht3.join();                                               //(J)

        System.out.println( " you!" );
    }
}