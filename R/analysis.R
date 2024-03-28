library(tidyverse)
library(here)

options(scipen = 100)

raw_pinguins_data <- read_csv("data/raw_pinguins_data.csv")

summary(raw_pinguins_data)

# Means
adelie_bill_length_means <- raw_pinguins_data %>%
  filter(species == "Adelie") %>%
  group_by(island) %>%
  summarise(mean_bill_length = num(mean(bill_length_mm, na.rm = TRUE), digits = 2))

# Plot
raw_pinguins_data %>%
  na.omit() %>%
  ggplot(aes(x = bill_length_mm, y = bill_depth_mm, color = species, shape = species)) +
  geom_point() + 
  labs(title = "Penguin Bill Dimensions",
       x = "Bill Length (mm)",
       y = "Bill Depth (mm)") +
  scale_shape_manual(values = c("Adelie" = 16,
                                "Chinstrap" = 17,
                                "Gentoo" = 18))