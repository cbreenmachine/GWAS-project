library(data.table)
library(qqman)
library(tidyverse)
library(wiscR)

df <- fread("../data/sumstats/GWAS_CP_all.txt") %>% as.data.frame()

# dt.sig <- dt %>% filter(Pval <= 0.001)
# dt.sample <- dt %>% filter(Pval > 0.001)
# ix <- sample(1:nrow(dt.sample), size = 1e5)
# dt.sample <- dt.sample[ix, ]
# 
# dt.2 <- rbind(dt.sample, dt.sig)
# 
# qqman::manhattan(dt.2, chr = "CHR", bp = "POS", snp = "MarkerName", p = "Pval")



# Code from the following link
# https://www.r-graph-gallery.com/101_Manhattan_plot.html
df.2 <- df %>%
  group_by(CHR) %>%
  summarize(chr_len = max(POS)) %>%
  mutate(tot = cumsum(as.numeric(chr_len)) - chr_len) %>%
  dplyr::select(-chr_len) %>%
  left_join(df, .,  by = c("CHR"="CHR")) %>%
  arrange(CHR, POS) %>%
  mutate(pos_cum = POS + tot)

axis.df <- df.2 %>% 
  group_by(CHR) %>% 
  summarize(center=( max(pos_cum) + min(pos_cum) ) / 2 )

cutoff <- 0.01
# Thin the data below the significance point
ix <- which(df.2$Pval > cutoff)
ix.2 <- sample(ix, size=floor(0.99*length(ix)), replace = F)
df.3 <- df.2 %>% slice(-ix.2)

nrow(df.3)


# Manhattan ---------------------------------------------------------------

man.plot <- ggplot(df.3, aes(x=pos_cum, y=-log10(Pval))) +
  # Show all points
  geom_point( aes(color=as.factor(CHR)), alpha=0.9, size=3.5) +
  scale_color_manual(values = rep(c("grey", "#4B9CD3"), 22 )) +
  scale_x_continuous( label = axis.df$CHR, breaks= axis.df$center ) +
  theme_minimal() %+replace%
  theme(legend.position="none",
        text = element_text(size=rel(4)), 
        plot.title = element_text(hjust = 0.5), 
        axis.text.x = element_text(angle = 90, size = rel(3/4)),
        axis.text.y = element_text(size = rel(3/4))) +
  xlab("Chromosome") +
  ggtitle("GWAS P-values for Cognitive Performance") +
  geom_hline(aes(yintercept= -log10(5*10e-8)), color = "red") 

wiscR::save_plot(man.plot, "GWAS-manhattan.png")
