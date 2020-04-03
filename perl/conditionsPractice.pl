#!/usr/bin/perl

use strict;
use warnings;

use feature 'say';


my $age = 80;

my $is_not_intoxicated = 1 ;  # 1 means True 

my $age_last_exam = 16;

if ($age < 16 ){
    say " you can't Drive";
} elsif (!$is_not_intoxicated) {
    say "You can't Drive as you are Intoxicated";
} else {
    say "You can Drive";
}

if (($age >= 1)  && ($age < 16 )){
    say "You can't drive as you are still child  ";
} elsif (!$is_not_intoxicated) {
    say "You can't drive as you are intoxicated  ";
} elsif (($age >= 80 ) && (($age > 100 ) || (($age-$age_last_exam) > 5))) {
    say "You can't Drive ";
} else {
    say "You can Drive ";
}

#---------------------------------------------#
# Checking Conditions with Strings in Perl 
#----------------------------------------------#
# eq - equals to
# ne - not equals to
# lt - less than
# le - less than or equal to
# gt - greater than
# ge - greater than or equal to
#---------------------------------------------#

if ('a' eq 'b'){
    say "a equals b";

} else {
    say "a is not equal to b";
}

# Unless is the Opposite of If 
unless (!$is_not_intoxicated){
    say "Get Sober";
}

# If age > 18 ,it prints Can Vote otherwise prints Cant Vote 
say (($age > 18 ) ?  "Can Vote" : "Can't Vote");

 