// This code example is from the following source:
//
// Book Title:  Programming with Objects, A Comparative Presentation
//              of Object-Oriented Programming with C++ and Java
//
// Book Author:   Avinash Kak
//
// Chapter:     Chapter 12  Overloading Operations In C++
//
// Section:     Section 12.9 User Defined Conversions
//



//UserConvExplicit.cc

#include <iostream>
using namespace std;

class Point3D;

class Point2D {
    int x;
    int y;
public:
    Point2D( int p, int q ) : x(p), y(q) {}
    friend class Point3D;
};

class Point3D {
    int x;
    int y;
    int z;
public:
    Point3D( int p, int q, int r ) : x(p), y(q), z(r) {}
    explicit Point3D( Point2D point2D )                           //(F)   
              : x( point2D.x ), y( point2D.y ), z( 0 ) {}    
    friend ostream& operator<<( ostream& os, const Point3D& point );
};

ostream& operator<<( ostream& os, const Point3D& point ) {
    os << "(" << point.x <<", " << point.y << ", " << point.z << ")";
    return os;
}

int main()
{
    Point2D point2D( 3, 4 );
    //  cout << point2D << endl;    // will not work now

    // note explicit cast:
    cout << static_cast<Point3D>( point2D );                      //(G)
  
    return 0;
}
