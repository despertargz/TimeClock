use DBI;
use Data::Dumper;
use v5.10;

$filename = 'E:\Projects\Perl\TimeClock\tests\test2.db';
$dbh = DBI->connect("dbi:SQLite:dbname=$filename","","", { RaiseError => 1});

eval {
	$result = $dbh->selectall_arrayref("selects * from people", { Slice => { } });
};
if ($@) {
	say "first error";
}
if ($@) {
	say "second error";
}

eval {
	$r = "";
};
if ($@) {
	say "but i didn't do anything!";
}

print "Done!";

