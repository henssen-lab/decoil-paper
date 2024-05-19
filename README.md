Script and analysis for the Giurgiu et al. 2024.

# 1. Decoil development

## 1.1 Decoil

Decoil implementation for reconstructing ecDNA structure heterogeneity from sequencing data is available freely on Github https://github.com/madagiurgiu25/decoil-pre.<br/>
Decoil 1.1.2-slim release available on [zenodo](https://zenodo.org/uploads/10785693).

## 1.2 Decoil-viz

Decoil-viz for visualizing the amplicon threads and summarize the genomic regions on the amplicon is available on Github https://github.com/madagiurgiu25/decoil-viz.<br/>
Decoil-viz 1.0.3 release available on [zenodo](https://zenodo.org/uploads/10785693).

## 1.3 Linear models comparison to deconvolve ecDNA elements from simulated overlapping fragments data

Simulation of overlapping ecDNA elements and reasoning of chosing LASSO model over other linear models for the likely ecDNA candidates selection.

```
lasso_experiments/4_Decoil_Dev_2.ipynb
```


# 2. Simulations and benchmarking


## 
## 2.1 Simulate ecDNA sequence templates
## 2.2 Simulate in-silico long-read ecDNA-containing samples
## 2.3 Alignment-free ecDNA reconstruction using Shasta from simulated data
## 2.4 Alignment-based ecDNA reconstruction using Decoil from simulated data
## 2.5 Alignment-based ecDNA reconstruction using CReSIL from simulated data
## 2.6 Performance evaluation on simulated data for Decoil, Shasta and CReSIL

# 3. Evaluate amplicon's breakpoints recovery in ecDNA mixtures

Pair-wise mixtures of ecDNA containing celllines at different ratios 
- Generate mixtures
- Compute breakpoint recovery

# 4. ecDNA reconstruction for cellines and patient data 

## 4.1 Preprocess nanopore sequencing data from cell lines and patient samples

## 4.2 Reconstruct ecDNA elements for cell lines

### 4.2.1 Perform de-novo assembly for cell lines using Shasta

### 4.2.1 Compare Decoil and Shasta outputs against the against published ecDNA structures

## 4.3 Reconstruct ecDNA elements fro patient samples using Decoil

# 5. ecDNA properties


