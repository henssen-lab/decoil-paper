# install conda dependencies
mamba create -n dilutions -c bioconda python=3.7.8 samtools=1.9 bedtools=2.30.0 picard=2.26.0

conda activate dilutions
mamba install -y -c bioconda survivor=1.0.7 sniffles=1.0.7

# decoil
git clone https://github.com/madagiurgiu25/decoil-pre.git
cd  decoil-pre

python -m pip install -r requirements.txt
python setup.py build install

# add decoil in $PATH
ROOT=`dirname $(which decoil)`
export PATH=$PATH:$ROOT
