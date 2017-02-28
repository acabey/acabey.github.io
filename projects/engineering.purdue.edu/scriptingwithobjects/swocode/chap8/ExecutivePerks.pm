#--------   class ExecutivePerks in file ExecutivePerks.pm  -------------
package ExecutivePerks;                                             #(X1)

my $_bonus = 0;                                                     #(X2)

sub get_bonus { $_bonus; }                                          #(X3)
 
sub set_bonus {                                                     #(X4)
    my ($class, $bonus) = @_;                                       #(X5)
    $_bonus = $bonus;                                               #(X6)
}
1
