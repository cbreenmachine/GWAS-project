# munge-data.sh
# Runs through 5 GWAS summary statistics found in ../data/sumstats
# Files downloaded from link provided by Prof. Lu and renamed for simplicity.
# AD = Alzheimer's disease
# CP = Cognitive performance
# INSOM = insomnia
# MDD = major depressive disorder
# SCZ = schizophrenia


# AD
../../ldsc/munge_sumstats.py \
--out ../data/sumstats/AD \
--N 94437 \
--sumstats ../data/sumstats/AD.txt \
--merge-alleles ../data/w_hm3.snplist \
--a1-inc \
--chunksize 500000


# CP
../../ldsc/munge_sumstats.py \
--out ../data/sumstats/CP \
--N 257828 \
--sumstats ../data/sumstats/CP.txt \
--merge-alleles ../data/w_hm3.snplist \
--a1-inc \
--chunksize 500000
# Chunk size needs to be manually set
# See https://github.com/bulik/ldsc/issues/145


# INSOM
../../ldsc/munge_sumstats.py \
--out ../data/sumstats/INSOM \
--N 113006 \
--sumstats ../data/sumstats/INSOM.txt.gz \
--merge-alleles ../data/w_hm3.snplist \
--a1-inc \
--chunksize 500000


# MDD
../../ldsc/munge_sumstats.py \
--out ../data/sumstats/MDD \
--N 83005 \
--sumstats ../data/sumstats/MDD.gz \
--merge-alleles ../data/w_hm3.snplist \
--a1-inc \
--chunksize 500000

# SCZ
../../ldsc/munge_sumstats.py \
--out ../data/sumstats/SCZ \
--N 79845 \
--sumstats ../data/sumstats/SCZ.txt.gz \
--merge-alleles ../data/w_hm3.snplist \
--a1-inc \
--chunksize 500000