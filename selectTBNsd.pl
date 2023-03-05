##usage: perl selectTBNsd.pl tbn-traingene-57pos+63neg.txt sd-slimio-lowconf.txt > temp-sd-slimiolow-57tbnposgenes.txt
use strict;
use warnings;
my %hb;
open IN,"<$ARGV[0]";
while (my $str=<IN>){
	chomp $str;
	my @arr=split /\t/,$str;
	if ($arr[0] eq "1"){
		$hb{$arr[1]}=1;
	}
}
close IN;
open IN,"<$ARGV[1]";
my $str=<IN>;
chomp $str;
print "$str\n";
my @id=split /\t/,$str;
while ($str=<IN>){
	chomp $str;
	my @arr=split /\t/,$str;
	if (exists $hb{$arr[0]}){
		print "$str\n";
	}
}
close IN;