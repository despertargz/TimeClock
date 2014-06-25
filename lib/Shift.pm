package Shift;

sub new() {
	my ($class) = @_;
	
	my $self = {
		Punches => []
	};
	
	return bless $self
}

sub AddPunch {
	my ($self, $punch) = @_;
	
	#$punches = $self->{Punches};
	#push @$punches, $punch;
	
	push @($self->{Punches})), $punch;
}

sub GetTotal {
	my ($self) = @_;
	
	#TODO: finish method
}

return 1;
