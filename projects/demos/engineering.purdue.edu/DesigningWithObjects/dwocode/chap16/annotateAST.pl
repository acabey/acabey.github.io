#!/usr/bin/perl -w

### annotateAST.pl

#  This Perl script inserts additional code into the 
#  Java class files for the leaf nodes of the AST for
#  the purpose of annotating the parse tree and for
#  helping out with the pretty-printing of the AST.

#  IMPORTANT: The inserted code is right before the ending 
#  right curly brace of the class definition.

use strict;

my @files = qw/ 
               ASTNoun.java
               ASTPreposition.java
               ASTVerb.java
               ASTDeterminer.java
               ASTAdjective.java
               ASTPronoun.java
             /;

my $insert  = << 'END';

  // Here is the code that was inserted by the script annotateAST.pl:

  //--------------------------------------------------------------

  // Manually added portion follows:
  String lexem = "";

  public void setLexem( String lex ) { lexem = lex; }
  public String getLexem() { return lexem; }

  // Override superclass handling:
  public String toString() { return super.toString()+ " : " + lexem; }

  //--------------------------------------------------------------
END


foreach my $file (@files) {
    @ARGV = ($file);
    my @all_of_it =  <>;
    my $new_content_for_file = join "", @all_of_it;
    my $regex = '}[^}]+$';
    $new_content_for_file =~ s/($regex)/$insert\n$1/;
    open FILEOUT, ">$file";
    print FILEOUT "$new_content_for_file";
    close FILEOUT;
}
