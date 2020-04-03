#!/usr/bin/perl

# Variable is created using the dollar($) symbol
# To use the escpe sequences we use the double quotes 

# To have double quotes around 5 and render escape sequences

$my_var= "5 is different from \"five\"\n";

print $my_var;

#Using two Escape Sequences \a and \n
print "Do you hear the bells?\a\n";

# Using Horizontal escape sequence 
print "Do you see the ga\t\tp?\n";

# Using \u to make one character Upper Case
print "The odd \uone out\n";

# Lower Case Escape Sequence
print "the next \lCASE\n";

# Capital U Escape Sequence 