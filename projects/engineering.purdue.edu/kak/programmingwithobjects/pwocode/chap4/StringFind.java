// This code example is from the following source:
//
// Book Title:  Programming with Objects, A Comparative Presentation
//              of Object Oriented Programming with C++ and Java
//
// Book Author:  Avinash Kak
//
// Chapter:     Chapter 4 ---- Strings
//
// Section:     Section 4.4.5 -- Searching and Replacing
//


//StringFind.java



class StringFind {
    public static void main( String[] args ) {
       StringBuffer strbuf = new StringBuffer(
                    "one hello is like any other hello" );
       String searchString = "hello";
       String replacementString = "armadillo";
       int pos = 0;
       while ( ( pos = (new String(strbuf)).indexOf( 
                                searchString, pos ) )  != -1 ) {
           strbuf.replace( pos, pos + 
                            searchString.length(), replacementString );
           pos++;
       }
       System.out.println( strbuf );
    }
}
