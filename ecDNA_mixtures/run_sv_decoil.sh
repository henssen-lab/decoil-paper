#!/bin/bash
#
#SBATCH --ntasks=8
#SBATCH --nodes=1
#SBATCH --time=2-00:00:00
#SBATCH --mem=100G

s=$1

# GRCh38.p13.genome.chr_scaff.fa
genome=$2
mkdir -p $s

bamCoverage --bam raw_dilutions/$s.bam -o $s/coverage.bw --binSize 50 -p 4
sniffles -t 4 -m raw_dilutions/$s.bam -v $s/sv.sniffles.vcf --min_homo_af 0.7 --min_het_af 0.1 --min_length 50 --cluster --genotype --min_support 4 --report-seq
SURVIVOR vcftobed $s/sv.sniffles.vcf -1 -1 $s/sv.sniffles.bedpe
decoil filter -i $s/sv.sniffles.vcf -o $s/sv.sniffles.filtered.vcf
SURVIVOR vcftobed $s/sv.sniffles.filtered.vcf -1 -1 $s/sv.sniffles.filtered.bedpe

mkdir -p $s/decoil_v112_0702024
decoil reconstruct \
    --min-vaf 0.01 --min-cov-alt 10 --min-cov 10 --max-explog-threshold 0.01 \
    --fragment-min-cov 10 --fragment-min-size 500 \
    --vcf $s/sv.sniffles.vcf \
    --genome $genome \
    --bam raw_dilutions/$s.bam \s
    --coverage $s/coverage.bw \
    --name $s \
    --output $s/decoil_v112_0702024