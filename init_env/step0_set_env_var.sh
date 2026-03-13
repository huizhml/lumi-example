#!/bin/bash

PROJECT_ID="xxx"
ENV_NAME="conda_env"
ENV_PREFIX=/projappl/project_${PROJECT_ID}/${ENV_NAME}
mkdir -p $ENV_PREFIX

# =========================== Clean old paths ===========================
CLEANED_PATH=$(echo $PATH | tr ':' '\n' | grep -v "project_" | paste -sd ":" -)
export PATH="$CLEANED_PATH"


# =========================== update ~/.bashrc ===========================
FILE="$HOME/.bashrc"
NEW_LINE="export PATH=\"/projappl/project_${PROJECT_ID}/${ENV_NAME}/bin:\$PATH\""
# 1. Create a backup
cp "$FILE" "${FILE}.bak"

# 2. Remove any line that exports a PATH containing /scratch/project_
# This clears out both the old ID and the new ID if it was already there
sed -i '/export PATH=.../d' "$FILE"

# 3. Append the fresh, correct line to the end of the file
echo "" >> "$FILE"
echo "# Updated LUMI Python path" >> "$FILE"
echo "$NEW_LINE" >> "$FILE"

# Set the EasyBuild user prefix for GDAL installation
echo "export EBU_USER_PREFIX=/projappl/project_${PROJECT_ID}/EasyBuild" >> ~/.bashrc


# make softlinks
ln -s /scratch/project_${PROJECT_ID}/ ~/scratch
ln -s /flash/project_${PROJECT_ID}/ ~/flash