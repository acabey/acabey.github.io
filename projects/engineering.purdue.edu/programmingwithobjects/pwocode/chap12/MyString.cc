// This code example is from the following source:
//
// Book Title:  Programming with Objects, A Comparative Presentation
//              of Object-Oriented Programming with C++ and Java
//
// Book Author:   Avinash Kak
//
// Chapter:     Chapter 12  Overloading Operators In C++
//
// Section:     Section 12.6  A Case Study In Operator Overloading
//



//MyString.cc

#include <cstring>  
#include <vector>   
#include <iostream>      
using namespace std;

class MyString;
typedef vector<MyString>::iterator Iter;
int split( Iter, int low, int high );
void quicksort( Iter, int low, int high );

class MyString {
    char* charArr;
    int length;
    class Err {};
public:
    MyString() {charArr = 0; length = 0;}

    MyString( const char* ch ) {
        length = strlen( ch );
        charArr = new char[ length + 1]; 
        strcpy( charArr, ch ); 
    }  

    MyString( const char ch ) {
        length = 1;
        charArr = new char[2];
        *charArr = ch;
        *(charArr + 1) = '\0';
    }

    ~MyString() { delete[] charArr; }

    MyString( const MyString& str ) {
        length=str.length; 
        charArr = new char[length+1]; 
        strcpy( charArr, str.charArr );
    }

    MyString& operator=( const MyString& str ) { 
        if (str.charArr == 0) {
            delete[] charArr; 
            charArr = 0; 
            length = 0; 
            return *this;
        } 
        if (this != &str) { 
            delete[] charArr; 
            charArr = new char[str.length + 1]; 
            strcpy(charArr, str.charArr ); 
            length = str.length;
        } 
        return *this; 
    }

    bool check( int i ) const { 
        return ( i >= 0 && i <= length ) ? true : false; 
    }  

    char operator[]( int i ) const { 
        if (check(i)) 
            return charArr[ i ]; 
        else throw Err(); 
    }

    void write( int k, char ch ) { 
        if (check(k)) 
            charArr[k] = ch; 
        else throw Err(); 
    }

    MyString operator+( const MyString str ) const {
        int temp = length + str.length + 1; 
        char* ptr = new char[temp]; 
        strcpy( ptr, charArr); 
        strcat(ptr, str.charArr); 
        MyString s( ptr ); 
        delete[] ptr; 
        return s; 
    }

    MyString& operator+=( const MyString str ) { 
        *this = *this + str;
        return *this;
    }

    MyString& operator+=( const char ch ) {
        *this = *this + MyString( ch );
        return *this;
    }

    bool operator==( const MyString str ) const { 
        return strcmp( charArr, str.charArr ) == 0; 
    }

    bool operator!=( const MyString str ) const { 
        return !( *this == str );
    }

    bool operator>( const MyString str ) const { 
        return strcmp( charArr, str.charArr ) > 0; 
    }

    bool operator<( const MyString str ) const { 
        return strcmp( charArr, str.charArr ) < 0; 
    }

    bool operator<=( const MyString str ) const {
        return strcmp( charArr, str.charArr ) <= 0; 
    }  

    bool operator>=( const MyString str ) const {
        return strcmp( charArr, str.charArr ) >= 0; 
    }  

    int getSize() const { return length; }

    int size() const { return length; }

    char* getCharArray() const { return charArr; }

    char* c_str() { return charArr; }

    int find( char* substring ) {
        char* p = strstr( charArr, substring );
        return p - charArr;
    }

    int compare( const MyString& str ) {
        char* p = getCharArray();
        char* q = str.getCharArray();
        if( p == 0 && q == 0 ) return 0;
        else if( p != 0 && q == 0 ) return 1;
        else if( p == 0 && q != 0 ) return -1;
        return strcmp( p, q );
    }

    friend ostream& operator<<( ostream&, const MyString& );
    friend istream& operator>>( istream&, MyString& );
};

ostream& operator<< ( ostream& os, const MyString& str ) {
    os << str.charArr;
    return os;
}

istream& operator>> ( istream& is, MyString& str ) {
    char* ptr = new char[100];
    is >> ptr;
    str = MyString( ptr );
    delete ptr;
    return is;
}

void sort( Iter first, Iter last ) {
    quicksort( first, 0, last - first -1 );
}

void quicksort( Iter first, int low, int high ) {
    int middle;
    if ( low >= high ) return;
    middle = split( first, low, high );
  
    quicksort( first, low, middle - 1 );
    quicksort( first, middle + 1, high );
}  

int split( Iter first, int low, int high ) {
    MyString partition_str = *( first + low );

    for(;;) {
        while ( low < high  &&  partition_str <= *( first + high ) )
          high--;
        if ( low >= high ) break;
        *( first + low++ ) = *( first + high );
    
        while ( low < high  &&  *( first + low ) <= partition_str )
            low++;
            if ( low >= high ) break;
        *( first + high-- ) = *( first + low );        
    }

    *(first + high ) = partition_str;
    return high;
}

int main()
{
    MyString s0;
    MyString s1( "hello" );
    cout << s1.getSize() << endl;            // 5
    cout <<  s1 << endl;                     // hello
    MyString s2 = s1;  
    cout << s2.getSize() << endl;            // 5
    cout <<  s2 << endl;                     // hello
    s1.write(0, 'j');
    cout << s1 << endl;                      // jello
    MyString s3 = s1 + s2;
    cout << s3 << endl;                      // jellohello
    s3 += s3;
    cout <<  s3 << endl;                     // jellohellojellohello      

    if ( s2.compare( s1 ) < 0 )
        cout << "s2 is \"less than\" s1" 
             << endl;                        // s2 is "less than" s1

    MyString s4 = "jello";
    if (s1 == s4) 
        cout << "the operator == works" << endl;
    if (s3 > s1) 
        cout << "the operator > works" << endl;

    MyString s5("yellow");
    s1 = s2 = s5;
    cout << s1 << endl;                      // yellow
    cout << s2 << endl;                      // yellow
    MyString s6;
    s1 = s6;
    cout << s1 << endl;                      // null

    MyString str[] = { "jello", "green", "jolly", "trolley", "abba" };    
    int size = sizeof(str)/sizeof(str[0]);
    vector<MyString> vec(str, &str[size]);
    cout << "Initial list:   ";
    for (Iter p = vec.begin(); p != vec.end(); p++ )
        cout << *p << " ";
                                    // jello green jolly trolly abba
    cout << endl;

    sort( vec.begin(), vec.end() );

    cout << "Sorted list:   ";  
    for ( Iter p = vec.begin(); p != vec.end(); p++ )
        cout << *p << " ";
                                    // abba green jello jolly trolly
    cout << endl << endl;
 
    return 0;
}
