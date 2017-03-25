#!/usr/bin/env perl

use strict;
use warnings;
use open qw(:std :utf8);
use utf8;

my @lines;
my @links;

while (<STDIN>) {
    chomp($_);
    push @lines, $_;
    if ($_ =~ /^ *([0-9]+)\. (.*)/) {
        $links[$1] = $2;
    }
}

my $link_len = 80;
for my $line (@lines) {
    last if ($line eq "References");
    print $line;
    my $first = 1;

    while ($line =~ /\[([0-9]+)\]/g) {
        my $url = $links[$1];
        my $idx = $1;
        my @chunks = ( $url =~ m/(.{$link_len}|.*)/g );

        if ($first == 1) {
            print " " x (80 - length($line));
            $first = 0;
        } else {
            print "\n" . " " x 80;
        }
        printf "[%+3s] │%-${link_len}s│", $idx, $chunks[0];
        foreach my $chunk (@chunks[1..$#chunks - 1]) {
            print "\n" . " " x 80;
            printf "      │%-${link_len}s│", $chunk;
        }
    }

    printf "\n"
}
