// This code example is from the following source:
//
// Book Title:  Programming with Objects, A Comparative Presentation
//              of Object-Oriented Programming with C++ and Java
//
// Book Author:  Avinash Kak
//
// Chapter:     Chapter 5 ----  Using the Container Classes
//
// Section:     Section 5.1.7 ----  Map
//



//MapHist.cc

#include <iostream>                  // for cout
#include <string>
#include <map>                                                    //(A)
#include <fstream>
using namespace std;

int main()
{
    map<string, int> hist;                                        //(B)

    ifstream in( "inFile" );                                      //(C)

    string word;                                
    while ( in >> word )                                          //(D)
        hist[ word ]++;                                           //(E)

    in.close();                                                   //(F)

    typedef map<string, int>::const_iterator CI;                  //(G)
    for ( CI iter = hist.begin(); iter != hist.end(); ++iter )    //(H)
        cout << iter->first << '\t' << iter->second << endl;      //(I)

    return 0;
}
