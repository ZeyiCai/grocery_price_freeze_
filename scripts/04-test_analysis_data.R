#### Preamble ####
# Purpose: Tests the structure and validity of the cleaned dataset.
# Author: Zeyi Cai
# Date: 25 November 2024
# Contact: zcloris.cai@mail.utoronto.ca
# License: MIT
# Pre-requisites: No
# Any other information needed? No

#### Workspace setup ####
library(tidyverse)
library(testthat)

data <- read_csv("data/02-analysis_data/analysis_data.csv")


#### Test data ####
# Test that the dataset has 968 rows - there are 151 divisions in Australia
test_that("dataset has 968 rows", {
  expect_equal(nrow(analysis_data), 968)
})

# Test that the dataset has 10 columns
test_that("dataset has 10 columns", {
  expect_equal(ncol(analysis_data), 10)
})

# Test that the 'product_name' column is character type
test_that("'product_name' is character", {
  expect_type(analysis_data$product_name, "character")
})

# Test that the 'product_description' column is character type
test_that("'product_description' is character", {
  expect_type(analysis_data$product_description, "character")
})

# Test that the 'vendor' column is character type
test_that("'vendor' is character", {
  expect_type(analysis_data$vendor, "character")
})

# Test that there are no missing values in the dataset
test_that("no missing values in dataset", {
  expect_true(all(!is.na(analysis_data)))
})


