library(tidyverse)
library(here)

#Open R Studio and write a function that multiplies a value by 234. Use this function to find the result of 234 * 311.
multiply_by_234 <- function(x, y = 234) {
  product <- x * y
  return(product)
}

#Write a function that sums 2 numbers together. Use this function to compute 3256 + 8934.
sum_2_numbers <- function(x, y) {
  sum <- x + y
  return(sum)
}

#What's wrong with this function?
is_even <- function(number) {
  return(number %% 2 == 0)
}

#Open your penguin project and write a function that shows the relationship between bill length and bill depth with a scatterplot.
#The functin should expect 2 arguments to target a specific island and a specific species.
plot_length_depth <- function(data, selected_island, selected_species) {
  plot <- data %>%
    na.omit() %>%
    filter(species == selected_species & island == selected_island) %>%
    ggplot(aes(x = bill_length_mm,
               y = bill_depth_mm,
               color = species,
               shape = species)) +
    geom_point() + 
    labs(title = paste0(selected_species, " Penguin Bill Dimensions in ", selected_island),
         x = "Bill Length (mm)",
         y = "Bill Depth (mm)") +
    scale_shape_manual(values = c("Adelie" = 16,
                                  "Chinstrap" = 17,
                                  "Gentoo" = 18))
  
  return(plot)
}

calc_adelie_bill_mean <- function(data, island_name) {
  filtered_data <- data %>%
    filter(species == "Adelie" & island == island_name)
  mean_bill_length <- round(mean(filtered_data$bill_length_mm, na.rm = TRUE), 2)
  return(mean_bill_length)
}

