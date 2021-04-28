# run_GNOVA.sh
# Coleman Breen
# See GNOVA GitHub here: https://github.com/xtonyjiang/GNOVA
#-m pdb

python3  ../../SUPERGNOVA/supergnova.py \
../data/sumstats/CP.sumstats.gz \
../data/sumstats/AD.sumstats.gz \
--N1 257828 \
--N2 94437 \
--bfile ../data/bfiles/eur_chr@_SNPmaf5 \
--partition ../data/partition/eur_chr@.bed \
--out ../data/supergnova-results.txt