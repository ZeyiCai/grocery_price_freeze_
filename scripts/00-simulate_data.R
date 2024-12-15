#### Preamble ####
# Purpose: Simulates a dataset of some information about whole wheat bread from different vendors
# Author: Zeyi Cai
# Date: 25 November 2024
# Contact: zcloris.cai@mail.utoronto.ca
# License: MIT
# Pre-requisites: The `tidyverse` package must be installed
# Any other information needed? No


#### Workspace setup ####
library(tidyverse)
set.seed(304)

# Load necessary library
library(dplyr)

#### Combine the csv. file ####
# Read the CSV files
raw <- read.csv("~/grocery_price_freeze/data/01-raw_data/raw.csv", stringsAsFactors = FALSE)
product <- read.csv("~/grocery_price_freeze/data/01-raw_data/product.csv", stringsAsFactors = FALSE)

# Combine the files
combined_data <- left_join(raw, product, by = c("product_id"="id"))

# Save the combined file
write.csv(combined_data, "~/grocery_price_freeze/data/01-raw_data/raw_data.csv", row.names = FALSE)

cat("Files successfully combined and saved as 'raw_data.csv'.")

#### Simulate data ####
# Simulate dataset
n <- 500
simulated_data <- data.frame(
  product_id = sample(n, replace = TRUE),
  nowtime = as.character(seq(from = as.POSIXct("2024-04-26 09:20:00"), 
                             length.out = n, by = "days")),
  current_price = round(runif(n, 3.99, 9.99), 2),
  old_price = ifelse(runif(n) > 0.5, round(runif(n, 3.99, 9.99), 2), NA),
  other = NA,
  price_per_unit = paste0("$", round(runif(n, 0.01, 0.05), 2), "/gram"),
  product_description = paste0("Voila~Dempster's Whole Wheat Bread Texas Toast ", 
                               sample(500:700, n, replace = TRUE), " g"),
  vendor = "Voila",
  product_name = paste0("Dempster's Whole Wheat Bread Texas Toast ", 
                        sample(500:700, n, replace = TRUE), " g"),
  units = paste0(sample(500:700, n, replace = TRUE), "g")
)

# View simulated data
head(simulated_data)
nrow(simulated_data)

#### Save data ####
write_csv(simulated_data, "~/grocery_price_freeze/data/00-simulated_data/simulated_data.csv")

