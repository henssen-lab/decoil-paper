# Run decoil v1.0.7 for the celllines 

ref=GRCh38.primary_assembly.genome.fa
root=<root>

decoil reconstruct --fragment-min-cov 20 --fragment-min-size 1000 \
--vcf $root/CHP212_WGS_14122021/hg38/ngmlr_hg38.sniffles.vcf \
--genome $ref \
--bam $root/CHP212_WGS_14122021/hg38/ngmlr_hg38.bam \
--coverage $root/CHP212_WGS_14122021/hg38/coverage_hg38.bw \
--name CHP212_WGS_14122021 \
--output $root/CHP212_WGS_14122021/hg38/decoil_v107

decoil reconstruct --min-vaf 0.03 --fragment-min-cov 8 --fragment-min-size 300 \
--vcf $root/TR14_WGS_20022022/hg38/ngmlr_hg38.sniffles.vcf \
--genome $ref \
--bam $root/TR14_WGS_20022022/hg38/ngmlr_hg38.bam \
--coverage $root/TR14_WGS_20022022/hg38/coverage_hg38.bw \
--name TR14_WGS_20022022 \
--output $root/TR14_WGS_20022022/hg38/decoil_v107

decoil reconstruct --min-vaf 0.03 --fragment-min-cov 8 --fragment-min-size 300 \
--vcf $root/STA-NB-10-DM_26042021/hg38/ngmlr_hg38.sniffles.vcf \
--genome $ref \
--bam $root/STA-NB-10-DM_26042021/hg38/ngmlr_hg38.bam \
--coverage $root/STA-NB-10-DM_26042021/hg38/coverage_hg38.bw \
--name STA-NB-10-DM_26042021 \
--output $root/STA-NB-10-DM_26042021/hg38/decoil_v107







