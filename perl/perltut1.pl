#!/usr/bin/perl

use strict;
use warnings;

use feature 'say';


print "Hello World \n";

my $name = 'Nitendra';
 
 # Assign Multiple Variable in Perl 
my ($age,$street) =(30 ,'Dallas');

# Use Ecape Sequence
my $my_info = "$name lives on \"$street\"\n";

print "$my_info";

# Without Escaping Double Quotes
$my_info = qq{$name lives on "$street"\n};

print $my_info;


# Store Strings over multiple Lines 

my $extra_info =<<"END";
This is string on 
multiple lines
END

say $extra_info;

my $big_int=184467785445486154889269;


# Format Strings with printf
# %c : Character
# %s : String
# %d : Decimal
# %u : Unsigned Integer
# %f : Floating Point (Decimal Notation)
# %e : Floating Points (Scientific Notation)



printf(" Adding 1 to Big Int %u \n" , $big_int +1);


my $big_float = .1000000000000000000000000;

printf(" Adding Big Decimal Number to Float %.16f \n" ,$big_float + .10000000000000000001);


my $first = 1;
my $second = 2;

# Switching Values in Perl 

($first ,$second) = ($second ,$first);

print("First Value is " ,$first);
print("\n Second Value ",$second);


say " \n $first $second";