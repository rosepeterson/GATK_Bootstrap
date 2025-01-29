#!/bin/bash
for f in */*gatk2.vcf;
do 
ref=/data/petersonrod/Reference/marmoset_genome.fasta
snp=${f%_gatk2.vcf}_rawsnps2.vcf
indel=${f%_gatk2.vcf}_rawindels2.vcf
echo "module load GATK && gatk SelectVariants -R $ref -V $f --select-type-to-include SNP -O $snp && gatk SelectVariants -R $ref -V $f --select-type-to-include INDEL -O $indel" >> Step14_SelectVariants2.swarm
done
