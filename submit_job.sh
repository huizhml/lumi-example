#!/bin/bash
#SBATCH --account=project_xxxxxxx # !!! change to your project number
#SBATCH --partition=small
#SBATCH --ntasks-per-node=1
#SBATCH --cpus-per-task=1
#SBATCH --mem=16G
#SBATCH --time=3-00:00:00  # NOTE: max time is 3 days for small and small-g, 2 days for standard and standard-g
#SBATCH --job-name=run_job
#SBATCH --output=$P{HOME}/scratch/logs # NOTE: !!! do not save logs to home directory
#SBATCH --error=$P{HOME}/scratch/logs # and make sure this folder exists


source ~/.bashrc
python your_script.py