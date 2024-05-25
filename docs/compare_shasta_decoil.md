### 4.2.1 Perform de-novo assembly for cell lines using Shasta

```
conda create env -f scripts/shasta/assembly.yaml

conda activate assembly
cd ../ecDNA_comparison/scripts/shasta
sbatch shasta_v6.0.6.sh <chp212_fastq> ../../../data/ecDNA_comparison/chp212/shasta_v6.0.6
sbatch shasta_v6.0.6.sh <tr14_fastq> ../../../data/ecDNA_comparison/tr14/shasta_v6.0.6
sbatch shasta_v6.0.6.sh <sta-nb-10dm_fastq> ../../../data/ecDNA_comparison/sta-nb-10dm/shasta_v6.0.6
```

### 4.2.1 Compare Decoil and Shasta outputs against the against published ecDNA structures

```
bash run ../ecDNA_comparison/comparison_reconstruction_true.sh
```