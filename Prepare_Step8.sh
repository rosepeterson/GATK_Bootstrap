#!/bin/bash
for f in */*sorted_dedup_reads.bam;
do 
in1=${f%_sorted_dedup_reads.bam}_filter.indels.vcf
in2=${f%_sorted_dedup_reads.bam}_filter_snps.vcf
out=${f%_sorted_dedup_reads.bam}_recal_data.table
echo "module load GATK && gatk BaseRecalibrator -I $f -R /data/petersonrod/Reference/marmoset_genome.fasta --known-sites $in1 --known-sites $in2 -O $out" >> Step8_BaseRecal.swarm
done
