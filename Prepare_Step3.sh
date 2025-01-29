#!/bin/bash
for f in M*/*_matched_R1.fq.gz;
do 
in2=${f%_R1*}"_R2.fq.gz"
out=${f%_L0*}"_bwa.sam"
echo "module load bwa-mem2 && bwa-mem2 mem -t 16 /data/petersonrod/Stacey_Piotrowksi/Reference/marmoset_genome $f $in2 > $out" >> Step3_map_BWA.swarm
done
