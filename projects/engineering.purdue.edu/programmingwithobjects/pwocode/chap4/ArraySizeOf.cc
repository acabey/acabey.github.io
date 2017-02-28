// This code example is from the following source:
//
// Book Title:  Programming with Objects, A Comparative Presentation
//              of Object Oriented Programming with C++ and Java
//
// Book Author:  Avinash Kak
//
// Chapter:     Chapter 4 ---- Strings
//
// Section:     Section 4.3.8 -- Size and Capacity
//





//ArraySizeOf.cc

#include <iostream>
using namespace std;

int sum( int [], int );

int main()
{
  int data[100] = {2, 3};
  int m = sizeof( data ) / sizeof ( data[0] );                    //(A)
  cout << sum( data, 100 ) << endl;
  return 0;
}

int sum( int a[], int arr_size ) {
  //the following value of n is not very useful
  int n = sizeof( a ) / sizeof( a[0] );                           // (B)

  int result = 0;
  int* p = a;
  while (p-a<arr_size) result += *p++;
  return result;
}
