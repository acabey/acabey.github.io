// This code example is from the following source:
//
// Book Title:  Programming with Objects, A Comparative Presentation
//              of Object-Oriented Programming with C++ and Java
//
// Book Author:  Avinash Kak
//
// Chapter:     Chapter 5 ---- Using the Container Classes
//
// Section:     Section 5.2.3 ---- Map
//





//MapHist.java

import java.io.*;
import java.util.*;

class WordHistogram {

    public static void main (String args[]) throws IOException 
    {
        Map histogram = new TreeMap();                            //(A)

        String allChars = getAllChars( args[0] );                 //(B)
        StringTokenizer st = new StringTokenizer( allChars );     //(C)
        while ( st.hasMoreTokens() ) {                            //(D)
            String word = st.nextToken();                         //(E)
            Integer count = (Integer) histogram.get( word );      //(F)
            histogram.put( word, ( count==null ? new Integer(1) 
                   : new Integer( count.intValue() + 1 ) ) );     //(G)
        }
        System.out.println( "Total number of DISTINCT words: " 
                                 + histogram.size() );            //(H)
        System.out.println( histogram );                          //(I)
    }

    static String getAllChars( String filename ) throws IOException {
        String str = "";
        int ch;
        Reader input = new FileReader( filename );
        while ( ( ch = input.read() ) != -1 )
            str += (char) ch;
            input.close();
            return str;
    }    
}
