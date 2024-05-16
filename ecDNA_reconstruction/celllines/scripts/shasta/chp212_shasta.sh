#!/bin/bash
#SBATCH --nodes 1
#SBATCH --mem 100G
#SBATCH --ntasks 1
#SBATCH --cpus-per-task 32
#SBATCH --job-name shastachp212

# --gres=gpu:tesla:2

conda activate assembly
set -x

input=$1/all.fastq
shastaconsensus=https://github.com/chanzuckerberg/shasta/blob/master/conf/SimpleBayesianConsensusCaller-10.csv
conf=ecDNA.conf
outdir=CHP212_shasta_assembly

mkdir -p $outdir

# run shasta
rm -rf $outdir/ShastaRun
shasta --input $input --Assembly.consensusCaller Bayesian:$shastaconsensus --assemblyDirectory $outdir/ShastaRun
