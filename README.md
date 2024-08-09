Scripts and analysis for the Giurgiu et al. Genome Research 2024. "Reconstructing extrachromosomal DNA structural heterogeneity from long-read sequencing data using Decoil".

## Software release:

- Decoil tool: [decoil-pre-1.1.2-slim](https://zenodo.org/api/records/10785693/draft/files/decoil-pre-1.1.2-slim.zip/content)
- Decoil vizualization tools: [decoil-viz-1.0.3](https://zenodo.org/api/records/10785693/draft/files/decoil-viz-1.0.3.zip/content)
- Simulate ecDNA templates: [ecDNA-sim-1.0.0](https://zenodo.org/api/records/10785693/draft/files/ecDNA-sim-1.0.0.zip/content)
- Simulate reads using a circular .fasta with an improved pseudonumber generator (adapted PBSIM2): [pbsim2-1.0.0beta.zip](https://zenodo.org/api/records/10785693/draft/files/pbsim2-1.0.0beta.zip/content) 
- Pipeline for simulating and processing ecDNA: [ecDNA-simulate-validate-pipeline-1.0.1](https://zenodo.org/api/records/10785693/draft/files/ecDNA-simulate-validate-pipeline-1.0.1.zip/content)

## Linked repositories:
- https://github.com/madagiurgiu25/decoil-pre
- https://github.com/madagiurgiu25/decoil-viz
- https://github.com/madagiurgiu25/ecDNA-sim
- https://github.com/madagiurgiu25/ecDNA-simulate-validate-pipeline
- https://github.com/madagiurgiu25/pbsim2

## Zenodo
To access the data linked to this analysis go to https://zenodo.org/uploads/10785693.
The raw have been submitted to the EGA repository (https://ega-archive.org/) under studies
EGAS50000000348 and EGAS50000000349.

## Code and analysis for the paper (overview):
- ### 1. [Decoil development](docs/decoil.md)
  - Decoil
  - Decoil-viz
  - Linear models comparison to deconvolve ecDNA elements from simulated overlapping fragments data
- ### 2. [Simulations](docs/simulations.md) and [benchmarking](docs/benchmarking.md)
  - Simulate ecDNA sequence templates (.fasta)
  - Simulate and pre-process in-silico long-read ecDNA-containing samples (.fastq, .bam, .bw, .vcf)
  - Alignment-free ecDNA reconstruction using Shasta from simulated data
  - Alignment-based ecDNA reconstruction using Decoil from simulated data
  - Alignment-based ecDNA reconstruction using CReSIL from simulated data
  - Performance evaluation on simulated data for Decoil, Shasta and CReSIL
- ### 3. Generate ecDNA [mixtures](docs/mixtures.md) and evaluate amplicon's breakpoints
  - Downsampling to 10,25,50,75,90% for the three celllines
  - Generate mixtures 100-10, 100-25, 100-50, 100-75, 100-90% 
  - Process all mixtures, i.e. SV calling, Decoil reconstruction, aggregate results
  - Compute amplicion breakpoints recovery in the dilutions
- ### 4. ecDNA [reconstruction](docs/reconstruction_celllines_patients.md) for cellines and patient data 
  - Preprocess nanopore sequencing data from cell lines and patient samples
  - Reconstruct ecDNA elements for cell lines using Decoil
  - Reconstruct ecDNA elements for patient samples using Decoil
  - Perform de-novo assembly for cell lines using Shasta
  - [Compare](docs/compare_shasta_decoil.md) Decoil and Shasta outputs against the against published ecDNA structures
- ### 5. Paper [figures](data/README.md)

<br/><br/>

# 1. Decoil development

Go to [decoil](docs/decoil.md).

# 2. Simulations and benchmarking
This part of the paper describes the ecDNA simulation and performance evaluation.

Go to [simulations](docs/simulations.md) and [benchmarking](docs/benchmarking.md).

# 3. Evaluate amplicon's breakpoints recovery in ecDNA mixtures
Pair-wise mixtures of ecDNA containing samples at different ratios and reconstruction of co-occurring ecDNA elements using Decoil.

Go to [mixtures](docs/mixtures.md).

# 4. ecDNA reconstruction for cellines and patient data 
Apply Decoil on celllines and patient data. Go to [reconstruction](docs/reconstruction_celllines_patients.md).

Additionally, the reconstruction and de-novo assembly for cell lines are compared against validated structures. Go to [comparison](docs/compare_shasta_decoil.md).

# 5. Paper figures

Go to `../data/figures`.


## Citation

If you use this code please cite our publication:

Madalina Giurgiu, Nadine Wittstruck, Elias Rodriguez-Fos, Rocio Chamorro Gonzalez, Lotte Bruckner, Annabell Krienelke-Szymansky, Konstantin Helmsauer, Anne Hartebrodt, Philipp Euskirchen, Richard P. Koche, Kerstin Haase*, Knut Reinert*, Anton G. Henssen*.**Reconstructing extrachromosomal DNA structural heterogeneity from long-read sequencing data using Decoil**. _Genome Research 2024_, DOI: [https://doi.org/10.1101/gr.279123.124](https://doi.org/10.1101/gr.279123.124)

```
@article{Giurgiu2024ReconstructingDecoil,
    title = {{Reconstructing extrachromosomal DNA structural heterogeneity from long-read sequencing data using Decoil}},
    year = {2024},
    journal = {Genome Research},
    author = {Giurgiu, Madalina and Wittstruck, Nadine and Rodriguez-Fos, Elias and Chamorro Gonzalez, Rocio and Brueckner, Lotte and Krienelke-Szymansky, Annabell and Helmsauer, Konstantin and Hartebrodt, Anne and Euskirchen, Philipp and Koche, Richard P. and Haase, Kerstin and Reinert, Knut and Henssen, Anton G.},
    month = {8},
    pages = {gr.279123.124},
    doi = {10.1101/gr.279123.124},
    issn = {1088-9051}
}
```

## License

The code is distributed under BSD-3-Clause license. See [LICENSE](LICENSE) for details.

## Contact

For any questions do no hesitate to contact us.<br/>
Author: Madalina Giurgiu (madalina.giurgiu@charite.de)
