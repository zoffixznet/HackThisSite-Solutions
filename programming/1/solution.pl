#!perl

use strict;
use warnings;
use 5.020;

my @scrambled = qw/
wprsoas

edwrda

salroi

liuacbmo

rmiswme

iearnm

tjnius

e31st2t

etters

lpaclemb
/;

open my $fh, '<', 'wordlist.txt' or die $!;
my %key;
for ( <$fh> ) {
    s/\r\n//g;
    $key{ join '', sort split // } = $_;
}

my @answers;
push @answers, $key{ join '', sort split // }
    for @scrambled;

say join ',', @answers;