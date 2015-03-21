#!perl

use strict;
use warnings;
use 5.020;

my @scrambled = qw/
    odrcoalo
    mnataon
    caparkd
    hteizn
    rferee
    benadr
    ndaaac
    stwameeb
    kexleen
    a1ahpl
/;

open my $fh, '<', 'wordlist.txt' or die $!;
my %key;
for ( <$fh> ) {
    chomp;
    # s/\W//g;
    say;
    $key{ join '', sort split // } = $_;
}

use Data::Dumper;
die Dumper \%key;

my @answers;
for ( @scrambled ) {
    push @answers, $key{ join '', sort split // };
}

say join ',', @answers;