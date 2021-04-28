# run_LDSC.sh
# runs like `bash run_LDSC.sh` from GWAS-project/code/

#########################################################
#########################################################
#########################################################


# Estimate intercept and heritability
../../ldsc/ldsc.py \
--h2 ../data/sumstats/GWAS_CP.sumstats.gz \
--out ../data/CP_h2 \
--w-ld-chr ../data/eur_w_ld_chr/ \
--ref-ld-chr ../data/eur_w_ld_chr/ 

# Partitioned heritability
../../ldsc/ldsc.py \
--h2 ../data/sumstats/GWAS_CP.sumstats.gz \
--ref-ld-chr ../data/baseline/baseline. \
--w-ld-chr ../data/weights_hm3_no_hla/weights. \
--overlap-annot \
--frqfile-chr ../data/1000G_frq/1000G.mac5eur. \
--out CP_baseline 

# Cell-specific paritioned heritability
# https://github.com/bulik/ldsc/wiki/Cell-type-specific-analyses
../../ldsc/ldsc.py \
--h2-cts ../data/sumstats/GWAS_CP.sumstats.gz \
--ref-ld-chr ../data/1000G_EUR_Phase3_baseline/baseline. \
--ref-ld-chr-cts ../data/GTEx_brain.ldcts \
--w-ld-chr ../data/weights_hm3_no_hla/weights. \
--out CP_Brain

