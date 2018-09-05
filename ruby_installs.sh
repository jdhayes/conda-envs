#!/bin/bash
set -e

## Ruby - Conda
module unload ruby python miniconda2 miniconda3 anaconda2 anaconda3
module load anaconda3
conda create -y -n my-ruby-env
source activate my-ruby-env
conda install -y -n my-ruby-env ruby #gxx_linux-64
RUBY=$(which ruby)
GEM=$(which gem)
gem install bio && echo "Success: Ruby gem 'bio' installed using ${GEM}"
ruby -e 'require "bio"' && echo "Success: Ruby gem 'bio' loaded using ${RUBY}"
source deactivate

