#!/bin/bash
set -e

## R - Conda
module unload R python miniconda2 miniconda3 anaconda2
module load anaconda3
conda create -y -n my-r-env
source activate my-r-env
conda install -y -n my-r-env -c r r-base=3.5.0
which R
#conda install -n my-r-env -c conda-forge r-base=3.5.1
conda install -y -n my-r-env -c r r-ggplot2

## R - CRAN
Rscript -e 'install.packages("ggplot2", repos = "http://cran.us.r-project.org")'

## R - Bioconductor
Rscript=$(which Rscript)
R=$(which R)
Rscript -e 'source("https://bioconductor.org/biocLite.R"); biocLite(); biocLite("GenomicRanges")' && echo Success: R package 'GenomicRanges' installed using ${Rscript}
Rscript -e 'library(GenomicRanges)' && echo Success: R package 'GenomicRanges' loaded using ${Rscript}
source deactivate my-r-env

