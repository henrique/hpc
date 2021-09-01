#!/bin/bash

source ~/.bashrc
conda activate ocp

nodes=${1:-2}
id=ocp-n$nodes-`date +'%y%m%d-%H%M%S'`

set -x
python main.py --config-yml configs/mlperf_cscs.yml \
    --mode train --distributed --submit --amp \
    --identifier $id \
    --num-nodes $nodes \
    --slurm-timeout 8 \
    --run-dir=$SCRATCH/runs/mlperf/ocp/$id \
    --logdir=$SCRATCH/runs/mlperf/ocp

