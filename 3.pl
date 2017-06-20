# Что неправильно в программе, подсчитывающей число строк и слов в файле? (Аналог стандартной программы wc, словами считаем последовательности непробельных символов, т.е. \S). Что можно улучшить? Предложите свой вариант.

# open F, $ARGV[0] || die $!;
# my @lines = <F>;
# my @words = map {split /\s/} @lines;
# printf "%8d %8d\n", scalar(@lines), scalar(@words); close(F);

# Программа неправильно обрабатывает строки вида " word", т.к. функция split в этом случае возвращает ["","word"]. Можно было бы исключить пустые строки из итогового массива, но это не оптимальный выход.
# Лучше воспользоваться жадностью квантификатора +, как показано ниже. 

use strict;
use warnings;
use DDP;
# execute with command "perl 3.pl 5.pl" to check
# it should be 16 42
open F, $ARGV[0] || die $!;
my @lines = <F>;
my @words = map {$_ =~ m/([^\s]+)/g} @lines;
printf "%8d %8d\n", scalar(@lines), scalar(@words); close(F);
