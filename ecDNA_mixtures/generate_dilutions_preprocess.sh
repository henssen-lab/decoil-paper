#!/bin/bash

s1=$1
first=$2
genome=$3

declare -a arrs1=(0.50 0.10 0.25 0.75 0.90)

# samtools 1.9
samtools --version

# picard 2.26

# bedtools 
bedtools --version

for (( i=0; i<${#arrs1[@]}; i++ ));
do
	p1=${arrs1[i]}
	echo "$s1 $p1 $first $genome"
	sbatch run_downsampling.sh $s1 $p1 $first $genome

done
