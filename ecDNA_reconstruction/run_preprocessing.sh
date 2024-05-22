#!/bin/bash
#SBATCH --ntasks=16
#SBATCH --nodes=1
#SBATCH --mem=150GB
#SBATCH --partition=highmem
#SBATCH --time 7-00:00:00

set -x

date
hostname

snakemake -F --cores 16 --max-jobs-per-second 16 --keep-going --rerun-incomplete --printshellcmds \
--config threads=8 read_length=300 refs=hg38 metafile=runs/s.txt tmp_dir=/tmp/s working_dir=workdir project_name=pj --unlock

snakemake -F --cores 16 --max-jobs-per-second 16 --keep-going --rerun-incomplete --printshellcmds \
--config threads=8 read_length=300 refs=hg38 metafile=runs/s.txt tmp_dir=/tmp/s working_dir=workdir project_name=pj 