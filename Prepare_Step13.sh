#!/bin/bash
for f in */*bqsr2.bam;
do 
out=${f%_bqsr2.bam}_gatk2.vcf
echo "module load GATK && gatk --java-options \"-Xms24G -Xmx24G -XX:ParallelGCThreads=4\" HaplotypeCaller -R /data/petersonrod/Reference/marmoset_genome.fasta -I $f -O $out" >> Step13_HaplotypeCaller2.swarm
done
