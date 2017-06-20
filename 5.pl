# Как отсортировать массив хешей по числовому значению, содержащемуся в элементах с ключом 'name'? Предложите код.

package HashSort;
use 5.010;
use strict;
use warnings;
use DDP;

my @arr = ();
for my $i (0..9) {
	push @arr, { name => int rand(10) };
}
p   	@arr;

@arr = sort { $a->{name} <=> $b->{name} } @arr;
p @arr;

1;