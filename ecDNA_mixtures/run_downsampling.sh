#!/bin/bash
#
#SBATCH --job-name=dil
#SBATCH --ntasks=8
#SBATCH --nodes=1
#SBATCH --time=4-00:00:00
#SBATCH --mem=40G

set -x
set -e

s1=$1
p1=$2
first=$3
genome=$4

# conda activate dilutions
# samtools 1.9
samtools --version

# picard 2.26

# bedtools 
bedtools --version

cd raw_dilutions

echo "Downsampling $s1 $first_$p1 $genome"
echo "--"

picard DownsampleSam \
	I=$s1 \
	O=${first}_${p1}_$genome.bam \
	P=$p1

samtools index ${first}_${p1}_$genome.bam