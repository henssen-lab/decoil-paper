#!/bin/bash

# create environments
conda create env -f scripts/shasta/assembly.yaml
conda create env -f scripts/assembly_compare_env.yaml
conda create env -f scripts/convert_bed_to_fasta_env.yaml

root="../data/ecDNA_comparison"
ref=GRCh38.primary_assembly.genome.fa

# CHP212

conda activate bed2fasta
# convert all inputs
python convert_bed_to_fasta.py -i $root/chp212/helmsauer_etal_2020/chp212_coordinates_hg38_liftover.bed -o $root/chp212/helmsauer_etal_2020/chp212_coordinates_hg38_liftover.fa -f bed -r $ref
python convert_bed_to_fasta.py -i $root/chp212/decoil_v1.0.7/reconstruct.bed -o $root/chp212/decoil_v1.0.7/reconstruct.fa  -f decoil -r $ref

conda activate assembly_compare
bedtools getfasta -fi $ref -bed $root/chp212/hg38_regions.bed > $root/chp212/hg38_regions.fa

minimap2 -c $root/chp212/hg38_regions.fa $root/chp212/decoil_v1.0.7/reconstruct.fa > $root/chp212/hg38_decoil.paf
minimap2 -c $root/chp212/hg38_regions.fa $root/chp212/shasta_v6.0.6/amplicon.fasta > $root/chp212/hg38_shasta.paf
minimap2 -c $root/chp212/hg38_regions.fa $root/chp212/helmsauer_etal_2020/chp212_coordinates_hg38_liftover.fa > $root/chp212/hg38_paper.paf

minimap2 -c $root/chp212/helmsauer_etal_2020/chp212_coordinates_hg38_liftover.fa $root/chp212/decoil_v1.0.7/reconstruct.fa > $root/chp212/paper_decoil.paf
minimap2 -c $root/chp212/helmsauer_etal_2020/chp212_coordinates_hg38_liftover.fa $root/chp212/shasta_v6.0.6/amplicon.fasta > $root/chp212/paper_shasta.paf

minimap2 -c $root/chp212/shasta_v6.0.6/amplicon.fasta chp212/decoil_v1.0.7/reconstruct.fa > $root/chp212/shasta_decoil.paf

# TR14

conda activate bed2fasta
python convert_bed_to_fasta.py -i $root/tr14/hung_etal_2021/tr14_coordinates_hg38_liftover.bed -o $root/tr14/hung_etal_2021/tr14_coordinates_hg38_liftover.fa -f bed -r $ref
python convert_bed_to_fasta.py -i $root/tr14/decoil_v1.0.7/reconstruct.bed -o $root/tr14/decoil_v1.0.7/reconstruct.fa -f decoil -r $ref


conda activate assembly_compare
bedtools getfasta -fi $ref -bed $root/tr14/hg38_regions.bed > $root/tr14/hg38_regions.fa 

minimap2 -c $root/tr14/hg38_regions.fa $root/tr14/decoil_v1.0.7/reconstruct.fa > $root/tr14/hg38_decoil.paf
minimap2 -c $root/tr14/hg38_regions.fa $root/tr14/shasta_v6.0.6/selected_sequences.fasta > $root/tr14/hg38_shasta.paf
minimap2 -c $root/tr14/hg38_regions.fa $root/tr14/hung_etal_2021/tr14_coordinates_hg38_liftover.fa > $root/tr14/hg38_paper.paf

minimap2 -c $root/tr14/hung_etal_2021/tr14_coordinates_hg38_liftover.fa $root/tr14/decoil_v1.0.7/reconstruct.fa > $root/tr14/paper_decoil.paf
minimap2 -c $root/tr14/hung_etal_2021/tr14_coordinates_hg38_liftover.fa tr14/shasta_v6.0.6/selected_sequences.fasta > $root/tr14/paper_shasta.paf

minimap2 -c $root/tr14/shasta_v6.0.6/selected_sequences.fasta  $root/tr14/decoil_v1.0.7/reconstruct.fa > $root/tr14/shasta_decoil.paf

# STA-NB-10DM

conda activate assembly_compare
minimap2 -c $root/sta-nb-10-dm/shasta_v6.0.6/selected_sequences.fasta  $root/sta-nb-10-dm/decoil_v1.0.7/reconstruct.ecDNA.fasta > $root/sta-nb-10-dm/shasta_decoil.paf





