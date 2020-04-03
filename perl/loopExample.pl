#!/usr/bin/perl

use strict;
use warnings;

use feature 'say';


# For Loop

for (my $i = 0; $i < 10; $i++){
    say $i; 
}

# While Loop

my $y = 1;


# Printing Odd Numbers using While Loop
print ("#---------------------------------#");
say ("While Loop ");
say ("#-----------------------------------#");

while ($y < 10){
    if ($y % 2 == 0){
        $y++;
        next; # if y is even it increment y and go to next number 
    }

    if ($y  == 7){last;}

    say $y;
    $y++;
}

# Do while loop is used when we must loop once 
print ("#---------------------------------#");
say ("Do While Loop ");
say ("#-----------------------------------#");

my $lucky_num = 7;
my $guess;

do {
    say "Guess a Number between 1 and 10";
    $guess = <STDIN> # Getting a standard Input from the Console

} while $guess != $lucky_num;

say "You Guessed 7";


