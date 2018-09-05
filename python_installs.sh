#!/bin/bash
set -e

## Python - Conda
module unload python miniconda2 miniconda3 anaconda2
module load anaconda3
conda create -y -n my-py-env
source activate my-py-env
which python
source deactivate
which python

## Python - Conda (continuted)
# Delete new environment
conda env remove -y --name my-py-env

# Create new environment with python 2.7.14
conda create -y -n my-py-env python=2.7.14
source activate my-py-env

## Python - Conda (continuted)
conda install -y -n my-py-env numpy
conda install -y -n my-py-env -c anaconda pandas
#conda config --add channels defaults

## Python - Pip
PIP=$(which pip)
PYTHON=$(which python)
head -n 1 $(which pip)
pip install cython && echo "Success: Python package 'cython' installed using ${PIP}"
python -c 'import cython' && echo "Success: Python package 'cython' loaded using ${PYTHON}"
source deactivate

