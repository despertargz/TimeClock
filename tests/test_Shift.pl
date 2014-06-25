use FindBin;
use Data::Dumper;

use lib "$FindBin::Bin\\..\\lib";
use Shift;

$list = [];

$shift = Shift->new();
$shift->AddPunch("one");
$shift->AddPunch("two");

print Dumper($shift);