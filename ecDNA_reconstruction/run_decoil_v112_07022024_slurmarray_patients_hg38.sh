#!/bin/bash
#
#SBATCH --partition=medium
#SBATCH --array=1-35
#SBATCH --job-name=91decoil_real
#SBATCH --ntasks=1
#SBATCH --nodes=1
#SBATCH --time=1-00:00:00
#SBATCH --mem=30G
target=$(sed -n ${SLURM_ARRAY_TASK_ID}p samples_patients_decoil_v112.txt)

set -x
set -e

# conda activate decoil_release112

date

sroot=$(echo $target | awk '{print $1}')
s=$(echo $target | awk '{print $2}')

decoil --version

ref=GRCh38.p13.genome.chr_scaff.fa
anno=gencode.v42.primary_assembly.basic.annotation.gtf
outdir=$sroot/$s/hg38/decoil_v112_07022024
logs=logs/${s}_v112_07022024.log
sv=$sroot/$s/hg38/ngmlr_hg38.sniffles.vcf
coverage=$sroot/$s/hg38/coverage_hg38.bw
bam=$sroot/$s/hg38/ngmlr_hg38.bam

echo "Root: $sroot"
echo "Sample: $s"
echo "Output directory: $outdir"
echo
echo "Genome: $ref"
echo "Annotation: $anno"
echo "--"

mkdir -p $outdir
rm -rf $outdir/summary.txt
rm -rf $outdir/reconstruct.*

# decoil 1.1.2
decoil reconstruct \
--min-vaf 0.01 --min-cov-alt 4 --min-cov 5 --max-explog-threshold 1 \
--fragment-min-cov 5 --fragment-min-size 500 --filter-score 5 \
-r $ref \
-g $anno \
--bam $bam \
--name $s \
--coverage $coverage \
--vcf $sv \
--outputdir $outdir > $logs