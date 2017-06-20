# Напишите программу на Perl, которая получает первым аргументом командной строки имя tab-separated файл и записывает его содержимое в таблицу БД.

# Таблица создана таким запросом:

# create table banners (
#      banner_id int unsigned not null primary key,
#      title varchar(200),
#      url varchar(4000)
# );

# В файле содержатся строки, состоящие из этих же полей в таком же порядке.

use strict;
use warnings;
use DBI;

# открываем файл и считываем все строки
open F, $ARGV[0] || die $!;
my @lines = <F>;
# подключаемся к базе. Пусть это будет MySQL, потому что с ней я обычно работаю.
my $dbh = DBI->connect(dbi:mysql:host=localhost;database=database, user, password, params);
# парсим строки и составляем строку для одного инсерта
my @fields;
while (@lines) {
	$_ =~ m/^(\d+)\t([^\t]+)\t([^\t]+)$/ or warn "parsing wasn't successfull";
	push @fields, "'$1','$2','$3'";
}
my $buff_str = join '),(', @fields;

my $str = "insert into banners (banner_id, title, url) values (".$buff_str.")";
my $add_to_banners = $dbh->prepare($str);
$add_to_banners->execute();
#подразумевается автокоммит в параметрах