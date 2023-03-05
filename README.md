# TBNnetwork

perl selectTBNsd.pl tbn-traingene-57pos+63neg.txt sd-slimio-lowconf.txt > temp-sd-slimiolow-57tbnposgenes.txt;   

awk '{for(i=1;i<=NF;i++){a[FNR,i]=$i}}END{for(i=1;i<=NF;i++){for(j=1;j<=FNR;j++){printf a[j,i]"\t"}print ""}}' temp-sd-slimiolow-57tbnposgenes.txt > sd-slimiolow-57tbnposgenes.txt;

sed -i "/Inf/s/Inf/30966/g" sd-slimiolow-57tbnposgenes.txt;

cut -d "  " -f 1-58 sd-slimiolow-57tbnposgenes.txt > temp-sd-slimiolow-57tbnposgenes.txt; mv temp-sd-slimiolow-57tbnposgenes.txt sd-slimiolow-57tbnposgenes.txt;
