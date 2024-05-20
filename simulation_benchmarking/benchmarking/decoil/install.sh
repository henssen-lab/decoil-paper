## Install decoil from source
# use the local Decoil 1.1.2 commit e9419946f1114089e33b8e113c04dcfcbf3deee6
git clone https://github.com/madagiurgiu25/decoil-pre.git
cd  decoil-pre
git checkout e9419946f1114089e33b8e113c04dcfcbf3deee6

# create conda environment
mamba env create -f environment.yml
conda activate envdecoil

python -m pip install -r requirements.txt
python setup.py build install

# add decoil in $PATH
ROOT=`dirname $(which decoil)`
export PATH=$PATH:$ROOT