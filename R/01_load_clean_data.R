library(tidyverse)
library(readxl)
library(here)

raw_pinguins_data <- read_excel("data/raw_pinguins_data.xlsx",
                                col_types = c("text",
                                              "text",
                                              "numeric",
                                              "numeric",
                                              "numeric",
                                              "numeric",
                                              "text",
                                              "numeric"),
                                progress = TRUE)

clean_pinguins_data <- raw_pinguins_data %>%
  slice(-c(23, 48)) %>%
  mutate(across(c(species,
                island,
                sex,
                year), as.factor))

saveRDS(clean_pinguins_data, here("data/data_clean.rds"))
