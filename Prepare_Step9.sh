#!/bin/bash
for f in */*sorted_dedup_reads.bam;
do
table=${f%_sorted_dedup_reads.bam}_recal_data.table
out=${f%_sorted_dedup_reads.bam}_bqsr1.bam
echo "module load GATK && gatk ApplyBQSR -I $f --bqsr-recal-file $table -O $out" >> Step9_BQSR1.swarm
done
