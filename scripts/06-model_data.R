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
library(rstanarm)
library(readr)

#### Read data ####
analysis_data <- read_csv("~/grocery_price_freeze/data/02-analysis_data/analysis_data.csv", 
                          show_col_types = FALSE)
nrow(analysis_data)

# Verify the number of rows
cat("Number of rows in the dataset:", nrow(analysis_data), "\n")
analysis_data <- analysis_data %>%
  filter(!is.na(price_per_unit), !is.na(old_price))
nrow(analysis_data)
# Inspect the first few rows
head(analysis_data)

#### Fit Bayesian Model ####
# Fit a Bayesian regression model
bayesian_model <- stan_glm(
  formula = current_price ~ price_per_unit + old_price,
  data = analysis_data,
  family = gaussian(),
  prior = normal(location = 0, scale = 2.5, autoscale = TRUE),
  prior_intercept = normal(location = 0, scale = 2.5, autoscale = TRUE),
  prior_aux = exponential(rate = 1, autoscale = TRUE),
  seed = 302  # Set seed for reproducibility
)

# View summary of the model
summary(bayesian_model)

plot(bayesian_model)

#### Save Model ####
# Save the fitted model
saveRDS(bayesian_model, file = "~/grocery_price_freeze/models/bayesian_model.rds")


#### Predict Using the Model ####
# Generate predictions
analysis_data <- analysis_data %>%
  mutate(predicted_price = predict(bayesian_model, newdata = analysis_data))

# View updated data with predictions
head(analysis_data)


### Model data ####
first_model <-
  stan_glm(
    formula = flying_time ~ length + width,
    data = analysis_data,
    family = gaussian(),
    prior = normal(location = 0, scale = 2.5, autoscale = TRUE),
    prior_intercept = normal(location = 0, scale = 2.5, autoscale = TRUE),
    prior_aux = exponential(rate = 1, autoscale = TRUE),
    seed = 853
  )


#### Save model ####
saveRDS(
  first_model,
  file = "models/first_model.rds"
)

