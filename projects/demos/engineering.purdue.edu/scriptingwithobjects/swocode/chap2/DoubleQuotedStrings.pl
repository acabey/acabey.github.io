#!/usr/bin/perl -w

### DoubleQuotedStrings.pl

# A double-quoted string:
$str = "hello";                                                    #(A)
print $str, "\n";                     # hello   

# No need to escape an interior single quote:
$str = "Trillian's puppy";                                         #(B)
print $str, "\n";                     # Trillian's puppy            

# Now the backslashes must be escaped by backslashes:
$str = "C:\\My Files\\Cats\\Temp";                                 #(C)
print $str, "\n";                     # C:\My Files\Cats\Temp   

# This does NOT give us two backslashes 
# together between 'C:' and 'M':
$str = "C:\\\My Files\\Cats\\Temp";   # WARNING                    #(D)
print $str, "\n";                     # C:\My Files\Cats\Temp   

# But this does:
$str = "C:\\\\My Files\\Cats\\Temp";                               #(E)
print $str, "\n";                     # C:\\My Files\Cats\Temp   

# A backslash that come just before a double quote, 
# if needed as a character, must be escaped:
$str = "C:\\My Files\\Cats\\Temp\\";                               #(F)
print $str, "\n";                     # C:\My Files\Cats\Temp\  

# The symbol '$' inside a string now has 
# special meaning unless backslashed:
$how_much = 200;                      
$str = "Price: \$$how_much";                                       #(G)
print $str, "\n";                     # Price: $200           

# The symbol '@' inside a string now has 
# special meaning:
@nospam = ("ham", "yam", "bam");
$str = "mailto: me@nospam.com";                                    #(H)
print $str, "\n";                     # mailto: meham yam bam.com

# '\n' now stands for newline:
$str = "hello\nthere\nhow are you!";                               #(I)
print $str, "\n";                     # hello
                                      # there
                                      # how are you! 
# '\t' will now introduce horizontal tabs:
$str = "name\tage\tweight";                                        #(J)
print $str, "\n";                     # name    age     weight


# The operators '\U', '\u', etc. now 
# carry special meanings:
$str = "\Uname\E\t\uage\t\LweIght\E";                              #(K)
print $str, "\n";                     # NAME    Age     weight


# Double quotes inside a string must be 
# backslashed; single quotes ok as they are:
$str = "Names: \"peter\", 'paul', 'mary'";                         #(L)
print $str, "\n";                     # Names: "peter", 'paul', 'mary'

# Numeric escapes work:
$str = "\x68\x65\x6c\x6c\157";                                     #(M)
print $str, "\n";                     # hello

# You can create multiline strings with 
# double quotes:
$str = "This is a successful attempt at
        creating a multi-line string with 
        double quotes";                                            #(N)

