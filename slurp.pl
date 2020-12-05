#!/usr/bin/env perl

# The script tells which files are in a fileist and which files are not.

use strict;
use warnings;

sub slurp {
  my ($filename) = @_;
  open my $infile, '<', $filename or die "Error opening file '$filename'";
  local $/;
  my $entire_file_str = <$infile>;
  close $infile;
  return $entire_file_str
}


sub slurp_array {
  my ($filename) = @_;
  open my $infile, '<', $filename or die "Error opening file '$filename'";
  my @entire_file  = <$infile>; # slurp all lines into array of lines
  chomp(@entire_file);
  close $infile;
  return @entire_file
}

# ===========================================================================

my $filename = shift or die "
Usage: $0 [list_of_files]
";

foreach my $filename (@ARGV) {
  print "$filename\n";
  print slurp($filename);
  
}

foreach my $filename (@ARGV) {
  print "$filename\n";
  my @line_array = slurp_array($filename);
  my $i = 1;
  foreach my $line (@line_array) {
    print $i++, ": ${line_array[$i]}\n";
  }
}




