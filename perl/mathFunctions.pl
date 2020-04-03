#!/usr/bin/perl

use strict;
use warnings;

use feature 'say';


say "5 + 4 = " , 5 + 4;
say "5 - 4 = ", 5 - 4;
say "5 * 4 = ", 5 * 4;
say "5 / 5 = " ,5 / 5;
say "5 % 4 = " ,5 % 4;
say "5 ** 4 = ", 5 ** 4;


say "EXP 1 = ", exp 1;
say "HEX 10 = ", hex 10;
say "OCT 10 = ", oct 10;
say "INT 6.45 = " ,int(6.45);
say "LOG 2 = ", log 2;
say "Random between 0 - 10 = ", int(rand 11);
say "SQRT 16 = ", sqrt 16;

######################################################
# Increemental and Decremental -------------#
#############################################

my $rand_number = 5;
$rand_number+=1;

say "6++ = ", $rand_number++;
say "++6 = ",++$rand_number;
say "6-- = " ,$rand_number--;
say "--6 = ", --$rand_number;

# Order of operation is BODMAS and same as other Language 

say "3 + 2 *5 = " ,3 + 2 *5;
say "(3+2)*5 = " , (3 + 2) *5;