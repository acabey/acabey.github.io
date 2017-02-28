#!/usr/bin/perl -w

# SingleQuotedStrings.pl

#A single-quoted string:
$str = 'hello';                                                    #(A)
print $str, "\n";                     # hello   

#A single-quoted string with a 
#single quote mark inside:
$str = 'Trillian\'s puppy';                                        #(B)
print $str, "\n";                     # Trillian's puppy            

#Backslashes unless followed by 
#a single quote are no problem:
$str = 'C:\My Files\Cats\Temp';                                    #(C)
print $str, "\n";                     # C:\My Files\Cats\Temp   

#This does NOT give us two 
#backslashes together:
$str = 'C:\\My Files\Cats\Temp';                                   #(D)
print $str, "\n";                     # C:\My Files\Cats\Temp   

#But this does:
$str = 'C:\\\My Files\Cats\Temp';                                  #(E)
print $str, "\n";                     # C:\\My Files\Cats\Temp   


#A backslash that come just 
#before a single quote, if 
#needed as a character, must
#be escaped:
#$str = 'C:\My Files\Cats\Temp\';     # WRONG                      #(F)
$str = 'C:\My Files\Cats\Temp\\';                                  #(G)
print $str, "\n";                     # C:\My Files\Cats\Temp\  

#The symbol '$' inside a string 
#has ordinary meaning:
$how_much = 200;                      
$str = 'Price: $how_much';                                         #(H)
print $str, "\n";                     # Price: $200           

#The symbol '@' inside a string 
#has ordinary meaning:
@nospam = ("ham", "yam", "bam");
$str = 'mailto: me@nospam.com';                                    #(I)
print $str, "\n";                     # mailto: me@nospam.com     

#Even the '\n' loses its special 
#meaning:
$str = 'hello\nthere\nhow are you!';                               #(J)
print $str, "\n";                     # hello\nthere\nhow are you! 

#The tab character '\t' also loses 
#its special meaning:
$str = 'name\tage\tweight';                                        #(K)
print $str, "\n";                     # name\tage\tweight  

#The operators '\U', '\u', etc. also 
#lose their special meanings:
$str = '\Uname\t\uage\t\Lweight';                                  #(L)
print $str, "\n";                     # \Uname\t\uage\t\Lweight    

#You can even have double quotes 
#inside a single-quoted string:
$str = 'Names: "peter", "paul", "mary"';                           #(M)
print $str, "\n";                     # Names: "peter", "paul", "mary"

#Numeric escapes do NOT work 
#in single-quoted strings:
$str = '\x68\x65\x6c\x6c\157';                                     #(N)
print $str, "\n";                     # \x68\x65\x6c\x6c\157

#You can create multiline 
#strings with single quotes:
$str = 'This is a successful attempt at
        creating a multi-line string with 
        single quotes';                                            #(O)
