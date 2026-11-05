# Data Dictionary: Cancer Drug Response Dataset

## Overview

This dataset contains information about cancer cell models, drug treatments, drug concentrations, and cellular responses. It is designed for practising data cleaning, data transformation, and exploratory data analysis using R.

## Variable Descriptions

| Variable | Description | Data Type | Unit |
|:---|:---|:---|:---|
| `model_id` | Unique identifier assigned to each cancer cell model. | Character | None |
| `cancer` | Cancer type associated with each cell model (e.g., HCC, TNBC, Pancreatic). | Character | None |
| `drug` | Name or identifier of the drug administered. | Character | None |
| `dose_uM` | Concentration of the drug administered. | Numeric | µM (micromolar) |
| `response` | Normalized cellular response following drug treatment. | Numeric | Proportion (0–1) |
| `high_dose` | Indicates whether the drug concentration exceeds 5 µM. | Logical | TRUE/FALSE |
| `response_percent` | Cellular response expressed as a percentage. | Numeric | % |

## Additional Notes

- `model_id` identifies individual cancer cell models.
- `cancer` and `drug` are categorical variables.
- `dose_uM` represents drug concentration in micromolar.
- `response` contains the original normalized response values.
- `high_dose` is TRUE when `dose_uM` is greater than 5; otherwise, FALSE.
- `response_percent` is calculated by multiplying `response` by 100.

## Dataset Information

- **Dataset name:** `cancer_data`
- **Number of observations:** 30
- **Original variables:** 5
- **Derived variables:** 2
- **File format:** CSV

## Purpose

This practice dataset is used to develop skills in R programming, including:

- Selecting columns using `select()`.
- Filtering observations using `filter()`.
- Creating new variables using `mutate()`.
- Exporting datasets using `write.csv()`.
- Understanding and documenting research data.
