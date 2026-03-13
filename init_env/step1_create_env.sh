#!/bin/bash
PROJECT_ID="xxx"
ENV_NAME="conda_env"
ENV_PREFIX=/projappl/project_${PROJECT_ID}/${ENV_NAME}
mkdir -p $ENV_PREFIX

# =========================== Load modules and create container env ===========================
source ~/.bashrc
module load LUMI
module load lumi-container-wrapper
conda-containerize new --prefix $ENV_PREFIX env_cnr.yml
conda-containerize update $ENV_PREFIX --post-install env_update.sh


