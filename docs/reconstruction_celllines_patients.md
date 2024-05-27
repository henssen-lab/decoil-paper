Reconstruct ecDNA elements in cell lines and patient samples using Decoil.

## 4.1 Preprocess nanopore sequencing data from cell lines and patient samples

### 4.1.1 Run basecalling

Install using Nanopore Guideline, `guppy_6.3.4`. Per sample perform basecalling to transform fast5 to fastq.
```bash
sbatch ../ecDNA_reconstruction/run_basecalling.sh
```

### 4.1.2 Run preprocessing

This step is perform per sample and executes:
- read filtering
- QC
- mapping
- sv calling
- coverage profile

```
# download snakmemake workflow
git clone git@github.com:henssen-lab/nano-wgs.git
cd nano-wgs

# uses an input file s.txt
# Run	          Sample   Patient	    Kit	        Flowcell
# <path_to_fastq> <p1_s1>  <p1>     SQK-LSK110	FLO-MIN106
# <path_to_fastq> <p1_s2>  <p1>     SQK-LSK110	FLO-MIN106
# <path_to_fastq> <p2_s1>  <p2>     SQK-LSK110	FLO-MIN106
# <path_to_fastq> <p2_s2>  <p2>     SQK-LSK110	FLO-MIN106
sbatch ../ecDNA_reconstruction/run_preprocessing.sh
```

## 4.2 Reconstruct ecDNA elements for cell lines and patient sample using Decoil

### 4.2.1 Install Decoil from source (version 1.1.2):

```bash
git clone https://github.com/madagiurgiu25/decoil-pre.git
cd  decoil-pre

# checkout release 1.1.2-slim
git checkout tags/1.1.2-slim

# create conda environment
mamba env create -f environment.yml
conda activate envdecoil

python -m pip install -r requirements.txt
python setup.py build install

# add decoil in $PATH
ROOT=`dirname $(which decoil)`
export PATH=$PATH:$ROOT
```

This is available also as docker container [madagiurgiu25/decoil:1.1.2-slim](https://hub.docker.com/r/madagiurgiu25/decoil).

### 4.2.2 Run reconstruction for cell lines

```bash
sbatch ../ecDNA_reconstruction/run_decoil_v112_07022024_slurmarray_celllines_hg19.sh
sbatch ../ecDNA_reconstruction/run_decoil_v112_07022024_slurmarray_celllines_hg38.sh
```

### 4.2.3 Run reconstruction for patient samples

```bash
sbatch ../ecDNA_reconstruction/run_decoil_v112_07022024_slurmarray.sh
```
