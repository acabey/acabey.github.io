// This code example is from the following source:
//
// Book Title:  Programming with Objects, A Comparative Presentation
//              of Object-Oriented Programming with C++ and Java
//
// Book Author:  Avinash Kak
//
// Chapter:     Chapter 17  OO For Graphical User Interfaces, A Tour Of Three Toolkits
//
// Section:     Section 17.5  Minimalist GUI Programs In AWT/Swing
//




//FirstWindow.java

import javax.swing.*;
 
class FirstWindow {
    public static void main(String[] args)  {
        JFrame f = new JFrame( "FirstWindow" );             
        f.setSize( 300, 200 );               
        f.setLocation( 200, 300 );             
        f.setVisible( true );                            
    }
}
