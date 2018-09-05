#!/bin/bash
set -e

## Perl - Conda
module unload perl python miniconda2 miniconda3 anaconda2
module load anaconda3
conda create -y -n my-perl-env
source activate my-perl-env
conda install -y -n my-perl-env -c bioconda perl-app-cpanminus #gxx_linux-64 needed?
which perl
conda install -y -n my-perl-env -c bioconda perl-xml-simple

## Perl - CPANM
PERL=$(which perl)
CPANM=$(which cpanm)
cpanm Test::More && echo "Success: Perl module 'Test::More' installed using ${CPANM}"
perl -e 'use Test::More' && echo "Success: Perl module 'bio' loaded using ${PERL}"

# List all installed PMs
#for path in $(perl -E 'say for @INC'); do find $path -name '*.pm'; done
source deactivate

