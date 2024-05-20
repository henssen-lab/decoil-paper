
## Install CReSIL
git clone https://github.com/visanuwan/cresil.git
cd cresil && git checkout 646aec9
mamba env create -f environment.yml
conda activate cresil
pip install .

## Install other packages
mamba install -c bioconda biopython=1.79