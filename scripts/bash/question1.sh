#!/bin/bash

# Set environment variable for URL
export DATA_URL="https://www.stats.govt.nz/assets/Uploads/Annual-enterprise-survey/Annual-enterprise-survey-2023-financial-year-provisional/Download-data/annual-enterprise-survey-2023-financial-year-provisional.csv"

# --- Extract ---
echo "Starting extraction..."
mkdir -p raw # Create raw directory if it doesn't exist
curl -s "$DATA_URL" -o raw/annual-enterprise-survey-2023-financial-year-provisional.csv 

if [ -f "raw/annual-enterprise-survey-2023-financial-year-provisional.csv" ]; then
  echo "Extraction successful! File saved to raw/annual-enterprise-survey-2023-financial-year-provisional.csv"
else
  echo "Extraction failed! Please check the URL and try again."
  exit 1
fi

# --- Transform ---
echo "Starting transformation..."
mkdir -p transformed # Create transformed directory if it doesn't exist
csvtool rename -c Variable_code -n variable_code raw/annual-enterprise-survey-2023-financial-year-provisional.csv | \
csvtool col year,Value,Units,variable_code - > transformed/2023_year_finance.csv

if [ -f "transformed/2023_year_finance.csv" ]; then
  echo "Transformation successful! File saved to transformed/2023_year_finance.csv"
else
  echo "Transformation failed! Please check the script."
  exit 1
fi

# --- Load ---
echo "Starting load..."
mkdir -p gold # Create gold directory if it doesn't exist
cp transformed/2023_year_finance.csv gold/
if [ -f "gold/2023_year_finance.csv" ]; then
  echo "Load successful! File saved to gold/2023_year_finance.csv"
else
  echo "Load failed! Please check the script."
  exit 1
fi

echo "ETL process completed!"