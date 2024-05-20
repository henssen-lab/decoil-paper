#!/bin/bash
#
#SBATCH --partition=highmem
#SBATCH --array=1-2631
#SBATCH --job-name=51shasta_array
#SBATCH --ntasks=1
#SBATCH --nodes=1
#SBATCH --time=1-00:00:00
#SBATCH --mem=20G
target=$(sed -n ${SLURM_ARRAY_TASK_ID}p ../samples.list)

set -x
set -e

# conda activate assembly
# use the local shasta 0.10.0

date

batchid=$(echo $target | awk '{print $1}')
simid=$(echo $target | awk '{print $2}')

input=/data/gpfs-1/users/giurgium_c/scratch/sim_all/process/$batchid/$simid/reads/circle-template.fastq
threads=1
shastaconsensus=/data/gpfs-1/users/giurgium_c/work/assembly/Assembly/Shasta/shasta/conf/SimpleBayesianConsensusCaller-10.csv
outdir=/data/gpfs-1/users/giurgium_c/scratch/sim_all/process/$batchid/$simid/shasta_31

rm -rf ${outdir}

./shasta-Linux-0.10.0 --threads $threads \
--input ${input} \
--config Nanopore-May2022 \
--Reads.minReadLength 1000 \
--assemblyDirectory ${outdir} \
--Kmers.distanceThreshold 500 \
--Kmers.probability 0.5

date