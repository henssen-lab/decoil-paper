#!/bin/bash
#
#SBATCH --job-name=quast_shasta
#SBATCH --array=1-2631
#SBATCH --ntasks=1
#SBATCH --nodes=1
#SBATCH --time=1-00:00:00
#SBATCH --mem-per-cpu=30G
target=$(sed -n ${SLURM_ARRAY_TASK_ID}p ../samples.list)

set -x
set -e

#conda activate quast

date

root=$1

batchid=$(echo $target | awk '{print $1}')
simid=$(echo $target | awk '{print $2}')

ref=$root/$batchid/$simid/reads/circle-template.fa
query=$root/$batchid/$simid/shasta_21/Assembly.fasta

outdir=$root/$batchid/$simid/quast_true_shasta
rm -rf $outdir
mkdir -p $outdir

quast -o $outdir -r $ref \
--min-contig 500 \
--no-check --no-plots --no-html \
--no-icarus --no-snps --no-gc --no-sv \
$query

date