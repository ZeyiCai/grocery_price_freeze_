#### Preamble ####
# Purpose: Tests the structure and validity of the simulated dataset.
# Author: Zeyi Cai
# Date: 25 November 2024
# Contact: zcloris.cai@mail.utoronto.ca
# License: MIT
# Pre-requisites: 
  # - The `tidyverse` package must be installed and loaded
  # - 00-simulate_data.R must have been run
# Any other information needed? No

#### Workspace setup ####
library(tidyverse)
library(readr)
library(dplyr)

# Load the dataset
simulated_data <- read_csv("~/starter_folder-main/data/00-simulated_data/simulated_data.csv", 
                           show_col_types=FALSE)

# Test if the data was successfully loaded
if (exists("simulated_data")) {
  message("Test Passed: The dataset was successfully loaded.")
} else {
  stop("Test Failed: The dataset could not be loaded.")
}

#### Test data ####

# Check if the dataset has rows and columns
if (nrow(simulated_data) == 100) {
  message("Test Passed: The dataset has 100 rows.")
} else {
  stop("Test Failed: The dataset does not have 100 rows.")
}

if (ncol(simulated_data) == 10) {
  message("Test Passed: The dataset has 10 columns.")
} else {
  stop("Test Failed: The dataset does not have 10 columns.")
}

# Check if all required columns are present
required_columns <- c("product_id", "nowtime", "current_price", "old_price", 
                      "other", "price_per_unit", "product_description", 
                      "vendor", "product_name", "units")

if (all(required_columns %in% colnames(simulated_data))) {
  message("Test Passed: All required columns are present.")
} else {
  missing_columns <- setdiff(required_columns, colnames(simulated_data))
  stop(paste("Test Failed: The following required columns are missing:", 
             paste(missing_columns, collapse = ", ")))
}

# Check if `product_id` contains only numeric values
if (all(!is.na(as.numeric(simulated_data$product_id)))) {
  message("Test Passed: The 'product_id' column contains only numeric values.")
} else {
  stop("Test Failed: The 'product_id' column contains non-numeric values.")
}

# Check if `nowtime` contains valid datetime strings
if (all(!is.na(as.POSIXct(simulated_data$nowtime, format = "%Y-%m-%d %H:%M:%S", tz = "UTC")))) {
  message("Test Passed: The 'nowtime' column contains valid datetime values.")
} else {
  stop("Test Failed: The 'nowtime' column contains invalid datetime values.")
}

# Check if `current_price` and `old_price` contain numeric values
if (all(!is.na(as.numeric(simulated_data$current_price)))) {
  message("Test Passed: The 'current_price' column contains only numeric values.")
} else {
  stop("Test Failed: The 'current_price' column contains non-numeric values.")
}

if (all(is.na(simulated_data$old_price) | !is.na(as.numeric(simulated_data$old_price)))) {
  message("Test Passed: The 'old_price' column contains only numeric values or is NA.")
} else {
  stop("Test Failed: The 'old_price' column contains non-numeric values.")
}

# Check if there are any missing values in essential columns
essential_columns <- c("product_id", "nowtime", "current_price", "price_per_unit", 
                       "product_description", "vendor", "product_name", "units")

if (all(!is.na(simulated_data[essential_columns]))) {
  message("Test Passed: There are no missing values in essential columns.")
} else {
  stop("Test Failed: There are missing values in essential columns.")
}

# Check if `price_per_unit` follows a valid format (e.g., "$0.01/gram")
if (all(grepl("^\\$[0-9]+\\.[0-9]{2}/\\w+$", simulated_data$price_per_unit, perl = TRUE))) {
  message("Test Passed: The 'price_per_unit' column contains valid format values.")
} else {
  stop("Test Failed: The 'price_per_unit' column contains invalid format values.")
}

# Check if `units` follows a valid format (e.g., "617g")
if (all(grepl("^[0-9]+g$", simulated_data$units, perl = TRUE))) {
  message("Test Passed: The 'units' column contains valid format values.")
} else {
  stop("Test Failed: The 'units' column contains invalid format values.")
}

