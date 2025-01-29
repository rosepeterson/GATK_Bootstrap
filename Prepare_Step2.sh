#!/bin/bash
for f in M*/*_1.fq.gz;
do 
in2=${f%_1*}"_2.fq.gz"
out1=${f%_1*}"_matched_R1.fq.gz"
out2=${f%_1*}"_matched_R2.fq.gz"
outum1=${f%_1*}"_unmatched_R1.fq.gz"
outum2=${f%_1*}"_unmatched_R2.fq.gz"
echo "java -jar /usr/local/apps/trimmomatic/0.39/trimmomatic-0.39.jar PE -threads 16 $f $in2 $out1 $outum1 $out2  $outum2 ILLUMINACLIP:/usr/local/apps/trimmomatic/Trimmomatic-0.39/adapters/TruSeq3-PE-2.fa:2:30:10 TRAILING:20 SLIDINGWINDOW:4:15 MINLEN:31" >> Step2_trimommatic.swarm
done
