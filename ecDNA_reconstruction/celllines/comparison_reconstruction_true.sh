#!/bin/bash

# CHP212

pathtofastq="~/CHP212_WGS_Nanopore/HMW_CHP212_run3/fastq_gpu"
bam=""

conda activate assembly
cd scripts/shasta
sbatch chp212_shasta.sh $pathtofastq
cd ..

conda activate decoil

# put here decoil command

conda activate bed2fasta

# convert all inputs
python ../scripts/convert_bed_to_fasta.py -i chp212/helmsauer_etal_2020/chp212_coordinates_hg38_liftover.bed -o chp212/helmsauer_etal_2020/chp212_coordinates_hg38_liftover.fa -f bed -r ~/Projects/PhD/reference/GRCh38.primary_assembly.genome.fa
python ../scripts/convert_bed_to_fasta.py -i chp212/decoil_v1.0.7/reconstruct.bed -o chp212/decoil_v1.0.7/reconstruct.fa  -f decoil -r ~/Projects/PhD/reference/GRCh38.primary_assembly.genome.fa

conda activate assembly_compare
bedtools getfasta -fi ~/Projects/PhD/reference/GRCh38.primary_assembly.genome.fa -bed chp212/hg38_regions.bed > chp212/hg38_regions.fa

minimap2 -c chp212/hg38_regions.fa chp212/decoil_v1.0.7/reconstruct.fa > chp212/hg38_decoil.paf
minimap2 -c chp212/hg38_regions.fa chp212/shasta_v6.0.6/amplicon.fasta > chp212/hg38_shasta.paf
minimap2 -c chp212/hg38_regions.fa chp212/helmsauer_etal_2020/chp212_coordinates_hg38_liftover.fa > chp212/hg38_paper.paf

minimap2 -c chp212/helmsauer_etal_2020/chp212_coordinates_hg38_liftover.fa chp212/decoil_v1.0.7/reconstruct.fa > chp212/paper_decoil.paf
minimap2 -c chp212/helmsauer_etal_2020/chp212_coordinates_hg38_liftover.fa chp212/shasta_v6.0.6/amplicon.fasta > chp212/paper_shasta.paf

minimap2 -c chp212/shasta_v6.0.6/amplicon.fasta chp212/decoil_v1.0.7/reconstruct.fa > chp212/shasta_decoil.paf

# TR14

conda activate bed2fasta

python ../scripts/convert_bed_to_fasta.py -i tr14/hung_etal_2021/tr14_coordinates_hg38_liftover.bed -o tr14/hung_etal_2021/tr14_coordinates_hg38_liftover.fa -f bed -r ~/Projects/PhD/reference/GRCh38.primary_assembly.genome.fa

python ../scripts/convert_bed_to_fasta.py -i tr14/decoil_v1.0.7/reconstruct.bed -o tr14/decoil_v1.0.7/reconstruct.fa -f decoil -r ~/Projects/PhD/reference/GRCh38.primary_assembly.genome.fa


conda activate assembly_compare
bedtools getfasta -fi ~/Projects/PhD/reference/GRCh38.primary_assembly.genome.fa -bed tr14/hg38_regions.bed > tr14/hg38_regions.fa 

minimap2 -c tr14/hg38_regions.fa tr14/decoil_v1.0.7/reconstruct.fa > tr14/hg38_decoil.paf
minimap2 -c tr14/hg38_regions.fa tr14/shasta_v6.0.6/selected_sequences.fasta > tr14/hg38_shasta.paf
minimap2 -c tr14/hg38_regions.fa tr14/hung_etal_2021/tr14_coordinates_hg38_liftover.fa > tr14/hg38_paper.paf

minimap2 -c tr14/hung_etal_2021/tr14_coordinates_hg38_liftover.fa tr14/decoil_v1.0.7/reconstruct.fa > tr14/paper_decoil.paf
minimap2 -c tr14/hung_etal_2021/tr14_coordinates_hg38_liftover.fa tr14/shasta_v6.0.6/selected_sequences.fasta > tr14/paper_shasta.paf

minimap2 -c tr14/shasta_v6.0.6/selected_sequences.fasta  tr14/decoil_v1.0.7/reconstruct.fa > tr14/shasta_decoil.paf

# STA-NB-10DM

conda activate assembly_compare
minimap2 -c sta-nb-10-dm/shasta_v6.0.6/selected_sequences.fasta  sta-nb-10-dm/decoil_v1.0.7/reconstruct.ecDNA.fasta > sta-nb-10-dm/shasta_decoil.paf




