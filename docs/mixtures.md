This analysis generates in-silico mixtures at different ratios and reconstructs co-occurring ecDNA elements using Decoil.

### 3.1  Pair-wise mixtures of ecDNA containing samples at different ratios
- Generate in-silico mixtures
- Reconstruct ecDNA elements in mixtures
- Aggregate all found SVs for downstream analysis

```
cd ../ecDNA_mixtures

# create environment
bash install.sh

# Generate mixtures, reconstruct ecDNA in mixtures and aggregate results
bash runs.sh
```

### 3.2 Compute amplicon recovery for the mixtures

Install:
- jupyter-lab
- python>=3.8
  - pysam
  - numpy
  - pandas
  - rpy2
-  R>4.1.1
    - ggplot2

See [AmpliconRecovery.ipynb](../ecDNA_mixtures/AmpliconRecovery.ipynb) notebook. 
Output [breakpoints_recovery_merged.png](../data/ecDNA_mixtures/breakpoints_recovery_merged.png) (https://doi.org/10.5281/zenodo.10785693).