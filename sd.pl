##usage:perl sd.pl tbn-traingene-57pos+63neg.txt sd-slimiolow-57tbnposgenes.txt 1 0.01 >out.txt

use strict;
use warnings;
my %hb;
open IN,"<$ARGV[0]";
while (my $str=<IN>){
	chomp $str;
	my @arr=split /\t/,$str;
	$hb{$arr[1]}=$arr[0];
}
close IN;
open IN,"<$ARGV[1]";
my $str=<IN>;
chomp $str;
my @id=split /\t/,$str;
while ($str=<IN>){
	chomp $str;
	my @arr=split /\t/,$str;
	my $i=1; my $sum=0;
	while ($id[$i]){
		if ($arr[$i] == 1){
			$sum=$sum+$ARGV[2];
		}elsif ($arr[$i] == 2){
			$sum=$sum+$ARGV[3];
		}
		$i++;
	}
	if (exists $hb{$arr[0]}){
		print "$arr[0]\t$sum\t$hb{$arr[0]}\n";
	}else{
		print "$arr[0]\t$sum\tBackground\n";
	}
}
close IN;
