# =========================== Load gdal ===========================

source ~/.bashrc
module load LUMI/25.03 EasyBuild-user #NOTE: LUMI version matches the version of the following GDAL package
eb GDAL-3.12.0-cpeGNU-25.03-cray-python-3.11.7.eb -r