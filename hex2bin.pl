#!/usr/bin/perl 
use strict;
use warnings;
use POSIX;


open(my $BINFILE, '>:raw', 'dat.bin') or die "Error: failed to open binay output file: $!";

foreach my $line (<>) {
  chomp $line;
  my @words = split / +/, $line;
  foreach my $word (@words) {
    my $ii = hex($word);
#    print $BINFILE pack('s<', $ii);
    print $BINFILE pack('s>', $ii);
    # Sprint "word=$word , $ii\n";
  }
}

close($BINFILE);



