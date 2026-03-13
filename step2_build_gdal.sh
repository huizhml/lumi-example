# =========================== Load gdal ===========================
NEW_PROJECT="xxx"
export EBU_USER_PREFIX=/projappl/project_${NEW_PROJECT}/EasyBuild
module load LUMI EasyBuild-user
eb GDAL-3.12.0-cpeGNU-25.03-cray-python-3.11.7.eb -r