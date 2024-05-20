This part of the paper describes the ecDNA simulations.

## 2.1 Simulate ecDNA sequence templates (.fasta)
How we simulate ecDNA templates to cover a large spectrum of structure complexity, defined by the seven topologies in the paper, i.e. (i) Simple circularization, (ii) Simple SV's, (iii) Mixed SV's, (iv) Multi-region, (v) Multi-chromosomal, (vi) Duplications, (vii) Foldbacks.

### 2.1.1 Simulate ecDNA templates highthroughput

```
# install
git clone https://github.com/madagiurgiu25/ecDNA-sim
cd ecdna-sim
python -m pip install -e .
```

Simulate ecDNA structure diversity (2631 simulations):

```python
import main as m
import simulate as s

# generate entire spectrum of conformations (577 different possible conformations)
s.generate_conformation()

# simulate based on the conformations  (2631 simulations)
m.simulate_structure(s.CHRLEN, s.CHRRANGES, specify_conformation=None)
```

### 2.1.2 ecDNA templates dataset

The simulated ecDNA templates are available under `../data/simulation_benchmarking/simulation_ecDNA_templates/ecDNA_templates.tar.gz` (https://zenodo.org/uploads/10785693).

## 2.2 Simulate and pre-process in-silico long-read ecDNA-containing samples (.fastq, .bam, .bw, .vcf)

This will generate in-silico ecDNA containing long-read samples and pre-process them (i.e. perform mapping, coverage profile, sv calling) for the >2000 simulations.

### 2.2.1 Run ecDNA-simulate-validate-pipeline

```bash
cd ../simulation_benchmarking/simulation_ecDNA_samples
git clone git@github.com:madagiurgiu25/ecDNA-simulate-validate-pipeline.git
conda create -n snakemake python=3.7 snakemake
conda activate snakemake

# initialize genome index
cd ecDNA-simulate-validate-pipeline
snakemake --use-conda -s rules/genome_index.smk 

# run 
rawdir=../../../../data/simulation_benchmarking/simulation_ecDNA_templates
processdir=../../../../data/simulation_benchmarking/simulation_ecDNA_samples
sbatch ../run_cluster.sh $rawdir $processdir
```

### 2.2.2 Output

Pipeline output example for `simulate-mapping-sv` mode ([example sim_1501](https://zenodo.org/uploads/10785693/decoil-paper/data/simulation_benchmarking/simulation_ecDNA_samples/sim_1502)):

```
.
├── config.yaml
├── mapping
│   ├── coverage.bw
│   ├── ngmlr.bam
│   └── ngmlr.bam.bai
├── reads
│   ├── circle-template.bed
│   └── circle-template.fastq.gz
├── sv
│   ├── sv.sniffles.bedpe
│   └── sv.sniffles.vcf
```


The Decoil reconstructions for the ecDNA simulations are available under `../data/simulation_benchmarking/simulation_ecDNA_samples/reconstruction_merged_v112_02022024.txt` (https://zenodo.org/uploads/10785693).