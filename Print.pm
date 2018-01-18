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

package Print;

use strict;
use warnings;
use diagnostics;

use feature "say";

use OpenFile;

sub print {          
    foreach my $line (OpenFile::openFile()) { 
	my ($date, $number, $title) = split /:/, $line;
	say "Date: $date
            Number: $number
            Title: $title";
    }    
}

1;
