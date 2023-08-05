# Comics.pm
#
# Copyright 2018-2023 Ivan Guerreschi
#
# This file is part of ComicsPerl.
#
# ComicsPerl is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.
#
# ComicsPerl is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with Nome-Programma.  If not, see <http://www.gnu.org/licenses/>.

package Comics;

use strict;
use warnings;
use feature "say";
use File::Glob ':bsd_glob';

my $home_path = bsd_glob( "~"); 
my $file_name = $home_path . "/.comics";   

sub openFile {
    open(my $fh, "<", $file_name) or die "Can't Open File : $_";

    my @file_lines = <$fh>;

    close $fh or die "Couldn't Close File : $_";

    return @file_lines;
}

sub delete { 
    my $number = ":".shift;

    my @file_lines = openFile(); 

    open(my $write_fh, ">", $file_name) or die "Can't Open File : $_";

    foreach my $line (@file_lines) { 
        print $write_fh $line unless ($line =~ /$number/);
    }   

    close $write_fh or die "Couldn't Close File : $_"; 
}

sub insert {
    my $date = shift;
    my $number = shift;
    my $title = shift;

    open my $fh, '>>', $file_name or die "Can't Open File : $_";

    print $fh $date, ":", $number, ":", $title;

    close $fh or die "Couldn't Close File : $_";
}

sub print {          
    foreach my $line (openFile()) { 
	my ($date, $number, $title) = split /:/, $line;
	say "Date: $date
            Number: $number
            Title: $title";
    }    
}

sub remove {
    my @file_lines = openFile();

    open(my $write_fh, ">", $file_name) or die "Can't Open File : $_";

    foreach my $line (@file_lines) {
	$line =~ s/\n+/\n/g;
	print $write_fh $line if length($line);
    }

    close $write_fh or die "Couldn't Close File : $_";
}

sub replace {
    my $old = shift;
    my $new = shift;
    my @lines = openFile();

    open(my $fh, ">", $file_name) or die "Can't Open File : $_";

    foreach my $line (@lines) {
	$line =~ s/$old/$new/g;
	print $fh $line;
    }
	close $fh or die "Couldn't Close File : $_";        
}  

sub search {
    my $search = shift;

    foreach my $line (openFile()) { 
	if ($line =~ /\b$search\b/) {
	    my ($date, $number, $title) = split /:/, $line;
	    say "Date: $date
            Number: $number
            Title: $title";	
	}
    }    
}

sub sort {
    my @sorted = sort {(split(/\:\d+/, $a))[0] 
        cmp (split(/\:\d+/, $b))[0]} openFile();

     open(my $fh, ">", $file_name) or die "Can't Open File : $_";   

     foreach my $line (@sorted) {
	 print $fh $line;
     }
}

1;
