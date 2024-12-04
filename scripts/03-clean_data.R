#### Preamble ####
# Purpose: Clean the raw dataset.
# Author: Zeyi Cai
# Date: 25 November 2024
# Contact: zcloris.cai@mail.utoronto.ca
# License: MIT
# Pre-requisites: No
# Any other information needed? No

#### Workspace setup ####
library(tidyverse)
library(lubridate)
library(janitor)

#### Clean data ####
raw_data <- read_csv("~/grocery_price_freeze/data/01-raw_data/raw_data.csv")

#### Clean data ####
# Remove rows with missing values
cleaned_data <- 
  raw_data |>
  drop_na(current_price, product_id) |>
  mutate(
    current_price = as.numeric(current_price),
    price_per_unit = as.numeric(str_remove_all(price_per_unit, "\\$|/gram|/100g|ea\\.|\\s"))
  )


print(cleaned_data)
nrow(cleaned_data)
#### Save data ####
write_csv(cleaned_data, "~/grocery_price_freeze/data/02-analysis_data/analysis_data.csv")
