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
s2=$2
p1=$3
p2=$4
first=$5
second=$6
genome=$7


# conda activate dilutions
# samtools 1.9
samtools --version

# picard 2.26
# bedtools 
bedtools --version

cd raw_dilutions

echo "Merged downsampled $s1 $s2"
echo "$first_$p1 $second_$p2 $genome"
echo "--"
	
picard MergeSamFiles \
	I=${first}_${p1}_$genome.bam \
	I=${second}_${p2}_$genome.bam \
	O=${first}_${p1}_${second}_${p2}_$genome.bam	
	
samtools index ${first}_${p1}_${second}_${p2}_$genome.bam
	
outputfq=${first}_${p1}_${second}_${p2}_${genome}.fq
bedtools bamtofastq -i ${first}_${p1}_${second}_${p2}_$genome.bam -fq $outputfq
rm -rf $first_$p1.bam* $second_$p2.bam*

