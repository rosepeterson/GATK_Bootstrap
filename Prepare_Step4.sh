for f in M*/*_bwa.sam;
do
out=${f%_bwa.sam}"_bwa.out.bam"
in=${f%_bwa.sam}"_dedup_metrics.txt"
out1=${f%_bwa.sam}"_sorted_dedup_reads.bam"
path='$PICARDJARPATH/picard.jar'
echo "java -Xmx32G -jar $path AddOrReplaceReadGroups I=$f O=$out RGID=4 RGLB=lib1 RGPL=ILLUMINA RGPU=unit1 RGSM=20 &&  gatk MarkDuplicatesSpark -I $out -M $in -O $out1" >> Step4_MarkDuplicatesSpark_Sort_Bam.swarm
done
