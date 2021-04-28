library(GenomicSEM)


trait.names <- c("CP", "AD", "INSOM", "MDD", "SCZ")

traits <- paste0("../data/sumstats/", trait.names, ".sumstats.gz")

sample.prev <- c(NaN, 0.37, 0.29, 0.34, 0.24)
pop.prev <- c(NaN, 0.02, 0.1, 0.05, 0.01)

ld <- "../data/eur_w_ld_chr/"
wld <- "../data/eur_w_ld_chr/"


LDSCoutput <- ldsc(traits, sample.prev, pop.prev, ld, wld, trait.names)

CommonFactor_DWLS<- commonfactor(covstruc = LDSCoutput, estimation="DWLS")


fit <- 