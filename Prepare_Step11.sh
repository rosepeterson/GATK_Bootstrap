#!/bin/bash
for f in */*bqsr1.bam;
do 
in=${f%_bqsr1.bam}_postrecal_data.table
out=${f%_bqsr1.bam}_bqsr2.bam
echo "module load GATK && gatk ApplyBQSR -I $f -R /data/petersonrod/Reference/marmoset_genome.fasta --bqsr-recal-file $in -O $out " >> Step11_BQSR2.swarm
done
