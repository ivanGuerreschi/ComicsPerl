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

use strict;
use warnings;
use diagnostics;

use feature "say";

use Print;
use Insert;
use Delete;
use RemoveBL;
use Search;
use Replace;
use Sort;

my $menu = <<"END";
[p] List of comics
[i] Enter comic book
[e] Delete comic
[s] Search 
[r] Replace
[o] Sort
[q] Quit
END

my $input_opt; 

do {
   say $menu;
   chomp($input_opt = <>);
   
   if (lc($input_opt) eq 'p') {
       Print::print();
   } elsif (lc($input_opt) eq 'i') {
       say "Enter date the comic";
       chomp(my $date = <>);
       say "Enter comic number";
       chomp(my $number = <>);
       say "Enter comic book title";
       chomp(my $title = <>);
       Insert::insert($date, $number, $title); 
   } elsif (lc($input_opt) eq 'e') {
       say "Enter the comic number to be deleted";
       chomp(my $number = <>);
       Delete::delete($number);
       RemoveBL::remove();
   } elsif (lc($input_opt) eq 's') {
       say "Enter word to search";
       chomp(my $search = <>);
       Search::search($search);
   } elsif (lc($input_opt) eq 'r') {
       say "Enter word to change";
       chomp(my $old = <>);
       say "Insert new word";
       chomp(my $new = <>);
       Replace::replace($old, $new);
   } elsif (lc($input_opt) eq 'o') {
       Sort::sort();
   }          
   
} while lc($input_opt) ne 'q';
