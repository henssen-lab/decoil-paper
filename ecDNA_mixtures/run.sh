#!/bin/bash

conda activate dilutions
root=$1
genome=$2

# Downsample to 10,25,50,75,90% 
bash generate_dilutions_preprocess.sh $root/CHP212_WGS_14122021/hg38/ngmlr_hg38.bam CHP212 hg38
bash generate_dilutions_preprocess.sh $root/TR14_WGS_20022022/hg38/ngmlr_hg38.bam TR14 hg38
bash generate_dilutions_preprocess.sh $root/STA-NB-10-DM_26042021/hg38/ngmlr_hg38.bam STA-NB-10DM hg38

# Mix samples at 100%-100%
bash generate_dilutions_100.sh $root/CHP212_WGS_14122021/hg38/ngmlr_hg38.bam $root/TR14_WGS_20022022/hg38/ngmlr_hg38.bam CHP212 TR14 hg38
bash generate_dilutions_100.sh $root/CHP212_WGS_14122021/hg38/ngmlr_hg38.bam $root/STA-NB-10-DM_26042021/hg38/ngmlr_hg38.bam CHP212 STA-NB-10DM hg38
bash generate_dilutions_100.sh $root/STA-NB-10-DM_26042021/hg38/ngmlr_hg38.bam $root/TR14_WGS_20022022/hg38/ngmlr_hg38.bam STA-NB-10DM TR14 hg38

# Mix samples at 10-100, 25-100, 50-100, 75-100, 90-100%
bash generate_dilutions_100_2.sh $root/CHP212_WGS_14122021/hg38/ngmlr_hg38.bam $root/TR14_WGS_20022022/hg38/ngmlr_hg38.bam CHP212 TR14 hg38
bash generate_dilutions_100_2.sh $root/CHP212_WGS_14122021/hg38/ngmlr_hg38.bam $root/STA-NB-10-DM_26042021/hg38/ngmlr_hg38.bam CHP212 STA-NB-10DM hg38

bash generate_dilutions_100_2.sh $root/STA-NB-10-DM_26042021/hg38/ngmlr_hg38.bam $root/TR14_WGS_20022022/hg38/ngmlr_hg38.bam STA-NB-10DM TR14 hg38
bash generate_dilutions_100_2.sh $root/STA-NB-10-DM_26042021/hg38/ngmlr_hg38.bam $root/CHP212_WGS_14122021/hg38/ngmlr_hg38.bam STA-NB-10DM CHP212 hg38

bash generate_dilutions_100_2.sh $root/TR14_WGS_20022022/hg38/ngmlr_hg38.bam $root/CHP212_WGS_14122021/hg38/ngmlr_hg38.bam TR14 CHP212 hg38
bash generate_dilutions_100_2.sh $root/TR14_WGS_20022022/hg38/ngmlr_hg38.bam $root/STA-NB-10-DM_26042021/hg38/ngmlr_hg38.bam TR14 STA-NB-10DM hg38

# 100% to other dilutions
sbatch run_sv_decoil.sh CHP212_1.00_STA-NB-10DM_0.10_hg38 $genome
sbatch run_sv_decoil.sh CHP212_1.00_STA-NB-10DM_0.25_hg38 $genome
sbatch run_sv_decoil.sh CHP212_1.00_STA-NB-10DM_0.50_hg38 $genome
sbatch run_sv_decoil.sh CHP212_1.00_STA-NB-10DM_0.75_hg38 $genome
sbatch run_sv_decoil.sh CHP212_1.00_STA-NB-10DM_0.90_hg38 $genome
sbatch run_sv_decoil.sh CHP212_1.00_STA-NB-10DM_1.00_hg38 $genome

sbatch run_sv_decoil.sh CHP212_1.00_TR14_0.10_hg38 $genome
sbatch run_sv_decoil.sh CHP212_1.00_TR14_0.25_hg38 $genome
sbatch run_sv_decoil.sh CHP212_1.00_TR14_0.50_hg38 $genome
sbatch run_sv_decoil.sh CHP212_1.00_TR14_0.75_hg38 $genome
sbatch run_sv_decoil.sh CHP212_1.00_TR14_0.90_hg38 $genome
sbatch run_sv_decoil.sh CHP212_1.00_TR14_1.00_hg38 $genome

sbatch run_sv_decoil.sh TR14_1.00_CHP212_0.10_hg38 $genome
sbatch run_sv_decoil.sh TR14_1.00_CHP212_0.25_hg38 $genome
sbatch run_sv_decoil.sh TR14_1.00_CHP212_0.50_hg38 $genome
sbatch run_sv_decoil.sh TR14_1.00_CHP212_0.75_hg38 $genome
sbatch run_sv_decoil.sh TR14_1.00_CHP212_0.90_hg38 $genome

sbatch run_sv_decoil.sh TR14_1.00_STA-NB-10DM_0.10_hg38 $genome
sbatch run_sv_decoil.sh TR14_1.00_STA-NB-10DM_0.25_hg38 $genome
sbatch run_sv_decoil.sh TR14_1.00_STA-NB-10DM_0.50_hg38 $genome
sbatch run_sv_decoil.sh TR14_1.00_STA-NB-10DM_0.75_hg38 $genome
sbatch run_sv_decoil.sh TR14_1.00_STA-NB-10DM_0.90_hg38 $genome

sbatch run_sv_decoil.sh STA-NB-10DM_1.00_TR14_0.10_hg38 $genome
sbatch run_sv_decoil.sh STA-NB-10DM_1.00_TR14_0.25_hg38 $genome
sbatch run_sv_decoil.sh STA-NB-10DM_1.00_TR14_0.50_hg38 $genome
sbatch run_sv_decoil.sh STA-NB-10DM_1.00_TR14_0.75_hg38 $genome
sbatch run_sv_decoil.sh STA-NB-10DM_1.00_TR14_0.90_hg38 $genome
sbatch run_sv_decoil.sh STA-NB-10DM_1.00_TR14_1.00_hg38 $genome

sbatch run_sv_decoil.sh STA-NB-10DM_1.00_CHP212_0.10_hg38 $genome
sbatch run_sv_decoil.sh STA-NB-10DM_1.00_CHP212_0.25_hg38 $genome
sbatch run_sv_decoil.sh STA-NB-10DM_1.00_CHP212_0.50_hg38 $genome
sbatch run_sv_decoil.sh STA-NB-10DM_1.00_CHP212_0.75_hg38 $genome
sbatch run_sv_decoil.sh STA-NB-10DM_1.00_CHP212_0.90_hg38 $genome

# Compute breakpoint recovery -> merge breakpoints for CHP212, TR14 and STA-NB-10DM
ls STA-NB-10DM_1.00*hg38/sv.sniffles.vcf > files.list
ls CHP212_1.00*hg38/sv.sniffles.vcf >> files.list
ls TR14_1.00*hg38/sv.sniffles.vcf >> files.list
cat files.list | sort | uniq > tmp && mv tmp files.list 
SURVIVOR merge files.list 50 3 1 1 1 1000 files_merged.vcf 
SURVIVOR filter files_merged.vcf NA 500 -1 -1 10 files_merged.filtered.vcf
