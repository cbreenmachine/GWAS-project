library(wiscR)
library(tidyverse)





################################################################################
################### Cell-type-specific plot ####################################
################################################################################

df <- read.table("../data/CP_Brain.cell_type_results.txt", header = T)

sig.level <- 0.01 / nrow(df)

df.2 <- df %>%
  mutate(isSignificant = ifelse(Coefficient_P_value < sig.level, T, F)) %>%
  mutate(Name = str_replace_all(Name, "_", " ")) %>%
  mutate(Name = str_replace_all(Name, " \\s*\\([^\\)]+\\)", ""))

df.2$Name <- factor(df.2$Name, levels = df.2$Name[order(df.2$Coefficient_P_value, decreasing = T)])

p1 <- df.2 %>%
  ggplot(aes(y = Name, x = Coefficient, fill = isSignificant)) +
  geom_col() +
  wiscR::light_theme() +
  theme(legend.position = "none") +
  ylab("") +
  xlab("Coefficient?") +
  scale_fill_discrete(type = c("grey", "#4B9CD3"))

print(p1)
wiscR::save_plot(p1, "../figures/CellTypeSpecific")



################################################################################
################################################################################
################################################################################


  
