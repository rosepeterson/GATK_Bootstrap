#!/bin/bash
for f in */*rawsnps2.vcf;
do
snp=${f%_rawsnps2.vcf}_filtersnps2.vcf
in=${f%_rawsnps2.vcf}_rawindels2.vcf
indel=${f%_rawsnps2.vcf}_filterindels2.vcf
echo "module load GATK && gatk VariantFiltration -V $f -filter 'QD < 2.0' --filter-name 'QD2'  -filter 'SOR > 3.0' --filter-name 'SOR3' -filter 'FS > 60.0' --filter-name 'FS60' -filter 'MQ < 40.0' --filter-name 'MQ40' -filter 'MQRankSum < -12.5' --filter-name 'MQRankSum-12.5' -filter 'ReadPosRankSum < -8.0' --filter-name 'ReadPosRankSum-8' -O $snp && gatk VariantFiltration -V $in -filter 'QD < 2.0' --filter-name 'QD2' -filter 'QUAL < 30.0' --filter-name 'QUAL30' -filter 'FS > 200.0' --filter-name 'FS200' -filter 'ReadPosRankSum < -20.0' --filter-name 'ReadPosRankSum-20' -O $indel" >> Step15_Filter2.swarm
done
