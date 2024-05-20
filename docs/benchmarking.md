This part of the paper describes the benchmarking over the simulations using Decoil, Shasta and CReSIL.

## 2.3 Alignment-free ecDNA reconstruction using Shasta from simulated data

```
cd simulation_benchmarking/benchmarking/shasta
bash install.sh

# run Shasta for the simulations
sbatch run_shasta.sh
```

## 2.4 Alignment-based ecDNA reconstruction using Decoil from simulated data

```
cd simulation_benchmarking/benchmarking/decoil
bash install.sh

# run Shasta for the simulations
sbatch run_decoil.sh <root> <ref> <anno>
```

## 2.5 Alignment-based ecDNA reconstruction using CReSIL from simulated data

```
cd simulation_benchmarking/benchmarking/cresil
bash install.sh

# run CReSIL for the simulations
sbatch run_cresil.sh
```

## 2.6 Performance evaluation on simulated data for Decoil, Shasta and CReSIL

```
cd simulation_benchmarking/benchmarking/quast

# install Quast
bash install.sh

# run Quast for Decoil, Shasta and CReSIL for the simulations
sbatch run_quast_decoil.sh
sbatch run_quast_shasta.sh
sbatch run_quast_cresil.sh

# collect all results
# output: collect_metrics.txt
bash run_collect_metrics.sh
```

The output `collect_metrics.txt` is under `../data/simulation_benchmarking/benckmarking/collect_metrics.txt` (https://zenodo.org/uploads/10785693).