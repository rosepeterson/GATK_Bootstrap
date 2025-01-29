#!/bin/bash
for f in */*filtersnps2.vcf;
do
ref=/data/petersonrod/Reference/marmoset_genome.fasta
in=${f%_filtersnps2.vcf}_filterindels2.vcf
out=${f%_filtersnps2.vcf}_final_sorted_SNP_indel.vcf
echo "module load GATK && gatk SortVcf -R $ref -I $f -I $in -O $out" >> Step16_Final_filter.swarm
done
