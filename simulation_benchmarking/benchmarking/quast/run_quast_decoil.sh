#!/bin/bash
#
#SBATCH --job-name=quast_decoil
#SBATCH --array=1-2631
#SBATCH --ntasks=1
#SBATCH --nodes=1
#SBATCH --time=1-00:00:00
#SBATCH --mem-per-cpu=30G
#SBATCH --output=/data/gpfs-1/users/giurgium_c/scratch/sim_all/slurm_logs_quast/%j-%x.log
target=$(sed -n ${SLURM_ARRAY_TASK_ID}p ../samples.list)

set -x
set -e

#conda activate quast

date

root=$1

batchid=$(echo $target | awk '{print $1}')
simid=$(echo $target | awk '{print $2}')

input=$root/$batchid/$simid/reads/circle-template.bed
ref=$root/$batchid/$simid/reads/circle-template.fa
query=$root/$batchid/$simid/reconstruct_v112_07022024/reconstruct.fasta

outdir=$root/$batchid/$simid/quast_true_decoil_v112
rm -rf $outdir
mkdir -p $outdir

quast -o $outdir -r $ref \
--min-contig 500 \
--no-check --no-plots --no-html \
--no-icarus --no-snps --no-gc --no-sv \
$query

date