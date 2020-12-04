#!/usr/bin/env perl

# The script tells which files are in a fileist and which files are not.

use strict;
use warnings;

my $filename = shift or die "
Usage:   $0 file_to_search.txt [list_of_file_names]
Example: $0 filelist.txt `find . -type f` |grep found\$
Example: $0 filelist.txt `find . -type f` |grep missing\$
";

open my $infile, '<', $filename or die "Error opening file '$filename'";
my @lines  = <$infile>; # slurp all lines into array of lines
my $line_str = join("", @lines);
close $infile;

foreach my $file (@ARGV) {
  if ($line_str =~ /$file/) {
    print "found $file\n";
  } else {
    print "missing $file\n";
  }
}


