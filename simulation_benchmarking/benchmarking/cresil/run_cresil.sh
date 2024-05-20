#!/bin/bash
#SBATCH --job-name=21cresil_wgs
#SBATCH --ntasks=4
#SBATCH --nodes=1
#SBATCH --time=1-00:00:00
#SBATCH --mem-per-cpu=30G
#SBATCH --array=1-2631
target=$(sed -n ${SLURM_ARRAY_TASK_ID}p ../samples.list)

set -x
set -e
# conda activate cresil
# commit 646aec9
# release v1.1.0

## Activate CReSIL environment
#conda activate cresil
batchid=$(echo $target | awk '{print $1}')
simid=$(echo $target | awk '{print $2}')

input=/data/gpfs-1/users/giurgium_c/scratch/sim_all/process/$batchid/$simid/reads/circle-template.fastq
threads=4
output=/data/gpfs-1/users/giurgium_c/scratch/sim_all/process/$batchid/$simid/cresil_wgs
ref=~/Nanopore/scripts/reference/GRCh38.p13.genome.chr_scaff.fa
refmmi=~/Nanopore/scripts/reference/GRCh38.p13.genome.chr_scaff.mmi

## Run trim
mkdir -p $output
cresil trim -t $threads -fq $input -r $refmmi -o $output

# Run eccDNA identification for whole-genome long-read (WGLS) sequencing data
cresil identify_wgls -t $threads -r $refmmi -fa $ref -fai $ref.fai -fq $input -trim $output/trim.txt

# Convert to bed format
python convert_cresil_to_bed_fasta.py --input $input  --outdir $output --ref $ref