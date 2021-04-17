# prepare_data.sh
# Coleman Breen
# April 15, 2021

# Uses ldsc to munge data
# run from root/code/ directory like `bash prepare_data.sh`

#ldsc conda environment must be activated
# See
../../ldsc/munge_sumstats.py \
--sumstats ../data/GWAS_CP_all.txt \
--N 257828 \
--out ../data/GWAS_CP_all_munged.txt \
--chunksize 500000
# Chunk size needs to be manually set
# See https://github.com/bulik/ldsc/issues/145


../../ldsc/munge_sumstats.py \
--sumstats ../data/GWAS_AD.txt \
--N 63926 \
--out ../data/GWAS_AD_munged.txt \
--chunksize 500000