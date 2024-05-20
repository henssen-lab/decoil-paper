#!/bin/bash

s1=$1
s2=$2
first=$3
second=$4
genome=$5

declare -a arrs1=(1.00 1.00 1.00 1.00 1.00)
declare -a arrs2=(0.90 0.75 0.50 0.25 0.10)

# samtools 1.9
samtools --version

# picard 2.26

# bedtools 
bedtools --version

for (( i=0; i<${#arrs1[@]}; i++ ));
do
	p1=${arrs1[i]}
	p2=${arrs2[i]}
	echo "$s1 $s2 $p1 $p2 $first $second $genome"
	sbatch run_downsampling_merge.sh $s1 $s2 $p1 $p2 $first $second $genome

done
