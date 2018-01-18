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

package Sort;

use strict;
use warnings;
use diagnostics;

use OpenFile;

sub sort {
    my $fmt_file = "fmt";
    
     my @sorted = sort {(split(/\:\d+/, $a))[0] 
			    cmp (split(/\:\d+/, $b))[0]}OpenFile::openFile();

     open(my $fh, ">", $fmt_file) or die "Can't Open File : $_";   

     foreach my $line (@sorted) {
	 print $fh $line;
     }
}

1;
