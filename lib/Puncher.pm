package Puncher;

use DBI;
use DateTime;
use Data::Dumper;

sub _getConStr {
	my ($self) = @_;
	
	$conStr = "dbi:SQLite:dbname=" . $self->{_filename};
	my $db = DBI->connect($conStr, "", "", { RaiseError => 1 });
	return $db;
}

sub new {
	my ($class, $filename) = @_;

	my $self = { 
		_filename => $filename
	};
	
	bless $self, $class;
	return $self;
}

sub punch {
	my ($self, $time) = @_;
	
	$now = DateTime->now(time_zone => 'local')->epoch();
	$time = ($time == undef) ? $now : $time;
	$db = $self->_getConStr();
	
	$db->do("insert into punches values (?)", undef, $time);
}

sub getPunchesForToday {
	my ($self) = @_;

	my $todaysDate = DateTime->now(time_zone => 'local')->strftime("%Y-%m-%d");
	my $db = $self->_getConStr();
	
	return $db->selectall_arrayref("select datetime(time, 'unixepoch') from punches where date(time, 'unixepoch') = ?", undef, $todaysDate); 
}

return 1;