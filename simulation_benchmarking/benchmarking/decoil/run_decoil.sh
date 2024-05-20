#!/bin/bash
#
#SBATCH --partition=medium
#SBATCH --array=1-2631
#SBATCH --job-name=81decoil_array
#SBATCH --ntasks=1
#SBATCH --nodes=1
#SBATCH --time=1-00:00:00
#SBATCH --mem=20G
target=$(sed -n ${SLURM_ARRAY_TASK_ID}p ../samples.list)

set -x
set -e

# conda activate envdecoil
# use the local Decoil 1.1.2 commit e9419946f1114089e33b8e113c04dcfcbf3deee6

date

root=$1
# GRCh38.p13.genome.chr_scaff.fa
ref=$2
# gencode.v42.primary_assembly.basic.annotation.gtf
anno=$3

batch=$(echo $target | awk '{print $1}')
sample=$(echo $target | awk '{print $2}')

# Decoil 1.1.2
decoil reconstruct \
--min-vaf 0.01 --min-cov-alt 6 --min-cov 8 --max-explog-threshold 0.01 \
--fragment-min-cov 10 --fragment-min-size 500 --filter-score 30 \
--sv-caller sniffles \
--vcf $root/$batch/$sample/sv/sv.sniffles.vcf \
--bam $root/$batch/$sample/mapping/ngmlr.bam \
--name $sample \
--coverage $root/$batch/$sample/mapping/coverage.bw \
--outputdir $root/$batch/$sample/reconstruct_v112_07022024 \
-r $ref \
-g $anno

date
