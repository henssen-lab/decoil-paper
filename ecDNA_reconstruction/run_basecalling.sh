#!/bin/bash
#SBATCH --nodes 1
#SBATCH --mem 100G
#SBATCH --ntasks 1
#SBATCH --cpus-per-task 16
#SBATCH --job-name guppy5
#SBATCH --mail-type END
#SBATCH --gres=gpu:tesla:1
#SBATCH --time 30:00:00
#SBATCH --partition=gpu

# conda activate test-nano


fast5_folder=$1
fastq_folder=$2
kit=$3 # SQK-LSK110
flowcell="FLO-MIN106"
minscore=7

export PATH=$PATH:guppy_6.3.4/ont-guppy/bin/
guppy_basecaller --version

# base calling using the "super-accurate" DNA model -> taken from bonito
sup_model=guppy_6.3.4/ont-guppy/data/template_r9.4.1_450bps_sup.jsn

# check if flowcell and kit included
guppy_basecaller --print_workflows | grep $kit | grep $flowcell

echo "Start base calling using Guppy5"
echo "Kit: $kit"
echo "Flowcell: $flowcell"
echo "Model: $sup_model"
echo "Input: $fast5_folder"
echo "Output: $fastq_folder"

guppy_basecaller -m $sup_model --kit $kit --flowcell $flowcell \
  --input_path $fast5_folder --save_path $fastq_folder -r \
  -q 0 -x 'cuda:0' --gpu_runners_per_device 2 --chunks_per_runner 128 --chunk_size 3072 --min_qscore $minscore