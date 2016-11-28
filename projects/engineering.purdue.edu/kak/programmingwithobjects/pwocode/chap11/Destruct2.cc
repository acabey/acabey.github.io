// This code example is from the following source:
//
// Book Title:  Programming with Objects, A Comparative Presentation
//              of Object-Oriented Programming with C++ and Java
//
// Book Author:   Avinash Kak
//
// Chapter:     Chapter 11  Classes, The Rest Of The Story
//
// Section:     Section 11.8  Destructors In C++
//



//Destruct2.cc

#include <iostream>
using namespace std;

class GameScore {
    int homeTeamScore;
    int otherTeamScore;
public:      
    //constructor:
    GameScore( int score1, int score2 ) {
        homeTeamScore = score1;
        otherTeamScore = score2;
    }
    //destructor:
    ~GameScore() { 
        cout << "GameScore Object destroyed "
             <<  homeTeamScore << " vs. "
             <<  otherTeamScore << endl; 
    }
};

int main()
{
    GameScore gs1( 28, 3 );
    GameScore gs2( 35, 7 );
    GameScore* p = new GameScore( 29, 0 );                        //(A)
    return 0;
}
