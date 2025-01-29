#!/bin/bash

for f in M*/*sorted_dedup_reads.bam;
do 
out=${f%/}"_first.vcf.gz"
ref="/data/petersonrod/Reference/marmoset_genome.fasta"
echo "module load GATK && gatk HaplotypeCaller -R $ref  -I $f  -O $out --standard-min-confidence-threshold-for-calling 20.0" >> Step5_Haplotypecaller1.swarm
done
