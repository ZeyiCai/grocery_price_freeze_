# Grocery Price Freeze

## Overview

This article aims to study the possibility of Canada adopting a price freeze strategy for specific products(whole wheat bread) from November to February of the following year. By selecting relevant data such as the old price, price per unit and current price of specific products in several major groceries, and fitting the Bayesian model for price prediction, the impact of historical prices and time changes on the current price trend is analysed.


## File Structure

The repo is structured as:

-   `data/raw_data` contains the raw data as obtained from https://jacobfilipp.com/hammer/.
-   `data/analysis_data` contains the cleaned dataset that was constructed.
-   `model` contains fitted models. 
-   `other` contains relevant literature, details about LLM chat interactions, and sketches.
-   `paper` contains the files used to generate the paper, including the Quarto document and reference bibliography file, as well as the PDF of the paper. 
-   `scripts` contains the R scripts used to simulate, download and clean data.


## Statement on LLM usage

Some of the r codes for visualizations of price trends by vendors-nowtimes, testing simulated data, model prediction with plots and diagnostics parts were written,revised and improven with the help of the ChatGpt-4o. The diagnostics analysis, template of the questionnare, package citation and variable and package summaries were written with the help(reference) of ChatGpt-4o and the entire chat history is available in other/llms/usage.txt.

