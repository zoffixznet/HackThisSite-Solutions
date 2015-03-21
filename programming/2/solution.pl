#!/usr/bin/env perl

use 5.020;
use strict;
use warnings;
use Acme::Dump::And::Dumper;
use Text::Morse;
use GD;

my $pic = GD::Image->new('PNG.png')
    or die;

my @pixels;
for my $y ( 0..29 ) {
    push @pixels, $pic->getPixel($_, $y)
        for 0..99;
}

my $word;
my $offset = 0;
for ( 0 .. $#pixels ) {
    if ( $pixels[$_] ) {
        $word .= chr $offset;
        $offset = 0;
    }
    $offset++;
}

say $word;
say Text::Morse->new->Decode( $word );