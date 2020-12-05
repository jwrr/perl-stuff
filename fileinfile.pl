#!/usr/bin/env perl

# The script tells which files are in a fileist and which files are not.

use strict;
use warnings;

my $filelist_name = shift or die "
Usage:   $0 file_to_search.txt [list_of_file_names]
Example: $0 filelist.txt `find . -type f` |grep found\$
Example: $0 filelist.txt `find . -type f` |grep missing\$
";

open my $infile, '<', $filelist_name or die "Error opening file '$filelist_name'";
my @entire_filelist  = <$infile>; # slurp all lines into array of lines
my $entire_filelist_str = join("", @entire_filelist);
close $infile;

foreach my $filename (@ARGV) {
  if ($entire_filelist_str =~ /$filename/) {
    print "found $filename\n";
  } else {
    print "missing $filename\n";
  }
}


