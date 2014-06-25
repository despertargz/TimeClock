use FindBin;
use lib "$FindBin::Bin\\lib";

use Puncher;
use strict;
use DateTime;
use Data::Dumper;
use v5.10;

my $puncher = Puncher->new("$FindBin::Bin\\data\\punches.db");
my $punchedIn = 0;

my $date = DateTime->now(time_zone => "local")->strftime("%m/%d");
say "Good Morning! The date is $date and it is a beautiful day!";

while (1) {
	my $input = <>;
	
	if ($input == "" || $input == "punch") {
		$puncher->punch();
		
		$punchedIn = !$punchedIn; #toggles 0 and 1
		my $status = $punchedIn ? "[IN]" : "[OUT]";
		my $now = DateTime->now(time_zone => "local")->strftime("%I:%M %p");
		say "You punched $status @ $now";
	}
}

