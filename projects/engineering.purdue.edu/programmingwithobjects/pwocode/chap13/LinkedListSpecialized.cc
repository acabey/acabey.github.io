// This code example is from the following source:
//
// Book Title:  Programming with Objects, A Comparative Presentation
//              of Object-Oriented Programming with C++ and Java
//
// Book Author:   Avinash Kak
//
// Chapter:     Chapter 13  Generics And Templates
//
// Section:     Section 13.1.3 Template Specialization
//



//LinkedListSpecialized.cc

#include<iostream>
#include "LinkedListGeneric.h"   // This is the same as the program
                                 // LinkedListGeneric.cc but without
                                 // its main()
using namespace std;

template<> class LinkedList<char*> {                               //(A)      

    struct Node {
        Node* pre;
        Node* next;
        char* item;
        Node( Node* p, Node* n, char* c ) 
                 : pre(p), next(n), item(c) {}
    };
    Node* head;
public:
    LinkedList() : head( 0 ) {}
    LinkedList( char* t )  : head( new Node(0, 0, t)) {}
    ~LinkedList() {
        Node* p = head;
        while ( p != 0 ) {
            Node* temp = p;
            p = p->next;
            delete temp;
        }
    }
    void printAll() {
        for (Node* p = head; p; p = p->next ) 
            cout << p->item << ' '; 
    }
    void addToList( char* );
    void removeFromList( char* );
};


void LinkedList<char*>::addToList( char* item ) {                  //(B)
    Node* newNode = new Node(0, head, item);
    head = newNode;
    newNode->next->pre = head;  
}    
void LinkedList<char*>::removeFromList( char* item ) {  
    Node* p = head;
    for (; 0 != strcmp(p->item, item); p = p->next)
        if (p->next == 0) return;        // string not in list
    if (p == head) {                     // string in the first node
        head = head->next;
        head->pre = 0;
        delete p;
        return;
    }
    p->pre->next = p->next;
    if (p->next != 0) p->next->pre = p->pre;
    delete p;
} 

int main() {
    // use the template class from LinkedListGeneric.h for storing ints 
    int i = 1;
    LinkedList<int>* numlist = new LinkedList<int>(i);
    numlist->addToList( 5 );
    numlist->addToList( 6 );
    numlist->printAll();                            // 1 5 6
    cout << endl;
    numlist->removeFromList( 6 );
    numlist->printAll();                            // 1 5
    cout << endl;
  
    // use the specialized template class defined here
    // for a list of C-style strings
    char* cstr = "high";
    LinkedList<char*>* cstringList = new LinkedList<char*>( cstr );
    cstringList->addToList( "sierras" );
    cstringList->addToList( "green" );
    cstringList->addToList( "tiaras" );
    cstringList->printAll();            // tiaras green sierras high
    cout << endl;
    cstringList->removeFromList( "high" );
    cstringList->printAll();                 // tiaras green sierras
    cout << endl;
    return 0;
} 
