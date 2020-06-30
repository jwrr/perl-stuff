#!/usr/bin/perl 
use strict;
use warnings;
use POSIX;


  my ($numvalues, $bitwidth, $val_per_line) = @ARGV;

  die("format: $0 numvalues [bitwidth=16] [val_per_line=16]") if not defined $numvalues; # 1280 * 1024;
  $bitwidth = 16 if not defined $bitwidth;
  my $num_hex_digits = ceil($bitwidth / 4);
  my $hex_format = "0x%0" . $num_hex_digits . "X";
  print ("format=".$hex_format."\n");
  my $max = 2**$bitwidth;
  $val_per_line = 16 if not defined $val_per_line;

  my $val_on_line = 0;
  for (my $i=0; $i < $numvalues; $i++) {
    my $val = $i % $max;
    my $hex = sprintf($hex_format, $val);
    print( $hex . ' ');
    $val_on_line++;
    if ($val_on_line >= $val_per_line) {
      $val_on_line = 0;
      print("\n");
    }
  }












