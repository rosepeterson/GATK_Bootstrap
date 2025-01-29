#!/bin/bash
for f in */*bqsr1.bam;
do 
in=${f%_bqsr1.bam}_recal_data.table 
in2=${f%_bqsr1.bam}_postrecal_data.table
out=${f%_bqsr1.bam}_AnalyzeCovariates2.pdf
echo "module load GATK && gatk AnalyzeCovariates -before $in -after $in2 -plots $out" >> Step12_Plot.swarm
done
