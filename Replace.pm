#!/usr/bin/perl

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

# You should have received a copy of the GNU General Public License
# along with Nome-Programma.  If not, see <http://www.gnu.org/licenses/>.
#
# Copyright 2018 Ivan Guerreschi

package Replace;

use strict;
use warnings;
use diagnostics;

use OpenFile;

sub replace {
    my $old = shift;
    my $new = shift;
    my $fmt_file = "fmt";

    my @lines = OpenFile::openFile();

    open(my $fh, ">", $fmt_file) or die "Can't Open File : $_";
    
    foreach my $line (@lines) {
	$line =~ s/$old/$new/g;
	print $fh $line;

    }
	close $fh or die "Couldn't Close File : $_";        
}  

1;
