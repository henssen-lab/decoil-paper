#!/bin/bash
#
#SBATCH --array=1-2631
#SBATCH --job-name=batch_test
#SBATCH --ntasks=32
#SBATCH --nodes=1
#SBATCH --time=14-00:00:00
#SBATCH --mem=300G
#SBATCH --partition=highmem
target=$(sed -n ${SLURM_ARRAY_TASK_ID}p ../../../data/simulation_benchmarking/samples.list)

# conda activate decoiltest

set -e

date
echo "$target"
rawdir=$1
processdir=$2
batch=$(echo $target | awk '{print $1}')
sim=$(echo $target | awk '{print $2}')
path_templates=$rawdir
path=$processdir/$batch/$sim

mkdir -p $path
threads=4

# unlock
snakemake --cores 32 \
--use-conda --conda-prefix .snakemake/conda --rerun-incomplete --keep-going --unlock \
--configfile configs/config.yaml \
--groups nanofile=group0 ngmlr=group0 coverage=group0 sv=group0 --group-components group0=$threads \
--config input=${path_templates}/$sim.bed name=$sim outputdir=$path runmode=simulate-mapping-sv

# run
snakemake --cores 32 \
--use-conda --conda-prefix .snakemake/conda --rerun-incomplete --keep-going --unlock \
--configfile configs/config.yaml \
--groups nanofile=group0 ngmlr=group0 coverage=group0 sv=group0 --group-components group0=$threads \
--config input=${path_templates}/$sim.bed name=$sim outputdir=$path runmode=simulate-mapping-sv

date
