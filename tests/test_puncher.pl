use FindBin;
use lib "$FindBin::Bin\\..\\lib";

use Puncher;
use strict;
use DateTime;
use Data::Dumper;

my $puncher = Puncher->new("$FindBin::Bin\\..\\data\\timeclock.db");

sub punch {
	$puncher->punch();
}

sub getPunchesForToday {
	my $punches = $puncher->getPunchesForToday();
	print Dumper($punches);
}

#punch();
getPunchesForToday();