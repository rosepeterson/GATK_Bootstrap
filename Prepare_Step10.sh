#!/bin/bash
for f in */*bqsr1.bam;
do
in1=${f%_bqsr1.bam}_sorted_dedup_reads.bam_first_filter.indels.vcf
in2=${f%_bqsr1.bam}_sorted_dedup_reads.bam_first_filter_snps.vcf
out=${f%_bqsr1.bam}_postrecal_data.table
echo "module load GATK && gatk BaseRecalibrator -I $f -R /data/petersonrod/Reference/marmoset_genome.fasta --known-sites $in1 --known-sites $in2 -O $out" >> Step10_BaseRecal2.swarm
done
