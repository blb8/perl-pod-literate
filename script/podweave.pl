#!/usr/bin/perl
use strict;
use warnings;
my ($title);
while(<>) {
	if(0) { 1 }
	elsif(/^=for +literate:command +target=/)  { 1 }
	elsif(/^=for +literate +target:/)          { 1 } # deprecated
	elsif(/^=end +literate/)                   { undef($title) }
	elsif(/^=for +literate +\.\s*$/)           { undef($title) }
	elsif(/^=begin +literate +\+?(\S.*?)\s*$/) { $title=$1 }
	elsif(/^=for +literate +\+?(\S.*?)\s*$/)   { $title=$1 }
	elsif($title&&/^(\s*)\S/) { print "$1< $title >=\n$_"; undef($title) }
	else { print }
}
1;

