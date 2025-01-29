#!/bin/bash
for f in */*._raw.snps.vcf;
do 
indels=${f%*._raw.snps.vcf}._raw.indels.vcf
out=${f%*._raw.snps.vcf}_filter_snps.vcf
inout=${f%*._raw.snps.vcf}_filter.indels.vcf
echo "module load GATK && gatk VariantFiltration -V $f -filter 'QD < 2.0' --filter-name 'QD2'  -filter 'SOR > 3.0' --filter-name 'SOR3' -filter 'FS > 60.0' --filter-name 'FS60' -filter 'MQ < 40.0' --filter-name 'MQ40' -filter 'MQRankSum < -12.5' --filter-name 'MQRankSum-12.5' -filter 'ReadPosRankSum < -8.0' --filter-name 'ReadPosRankSum-8' -O $out && gatk VariantFiltration -V $indels -filter 'QD < 2.0' --filter-name 'QD2' -filter 'QUAL < 30.0' --filter-name 'QUAL30' -filter 'FS > 200.0' --filter-name 'FS200' -filter 'ReadPosRankSum < -20.0' --filter-name 'ReadPosRankSum-20' -O $inout" >> Step7_FilterVariants1.swarm
done
