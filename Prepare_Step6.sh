#!/bin/bash
for f in */*vcf.gz;
do 
snp=${f%vcf.gz}_raw.snps.vcf
indels=${f%vcf.gz}_raw.indels.vcf

echo "module load GATK && gatk SelectVariants -R /data/petersonrod/Reference/marmoset_genome.fasta -V $f --select-type-to-include SNP -O $snp && gatk SelectVariants -R /data/petersonrod/Reference/marmoset_genome.fasta -V $f --select-type-to-include INDEL -O $indels" >> Step6_SelectVariants.swarm
done
