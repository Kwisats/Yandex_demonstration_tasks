#Что выведет программа? 

print join ' ', sort reverse qw/6 10 7/;

# Ответ: 10 6 7
# Это происходит потому что qw создаёт список строк, которые сортируются лексиграфически ($a cmp $b).