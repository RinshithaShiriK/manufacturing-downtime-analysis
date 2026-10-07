# Manufacturing Production & Downtime Analysis

## Project Overview

This project focuses on analyzing manufacturing production efficiency and downtime operations. The analysis identifies major downtime factors, compares operator performance, evaluates shift-level performance, and examines production efficiency.

The project follows an end-to-end data analytics workflow using Excel, MySQL, Python, and Power BI.

## Objective

The main objectives of this project are:

- Analyze manufacturing production duration and downtime
- Identify major downtime factors
- Compare operator-level performance
- Analyze downtime across shifts
- Evaluate production efficiency
- Identify high-downtime production batches
- Analyze the relationship between production duration and downtime
- Build an interactive Power BI dashboard

## Tools & Technologies

- Excel
- MySQL
- Python
- Pandas
- NumPy
- Matplotlib
- Seaborn
- Power BI

## Methodology

```text
Data Collection
      ↓
Data Cleaning
      ↓
MySQL Analysis
      ↓
Python Exploratory Data Analysis
      ↓
Data Visualization
      ↓
Power BI Dashboard

## Dataset

The project uses the Manufacturing Efficiency in Downtime Operations dataset.
The dataset contains information related to:
- Production batches
- Products
- Operators
- Production start and end times
- Downtime factors
- Downtime duration
- Product characteristics

## Key Analysis
The project analyzes:
- Total production batches
- Total production duration
- Total downtime
- Average production efficiency
- Average downtime per batch
- Downtime by product
- Efficiency by operator
- Downtime by operator
- Downtime by shift
- Downtime by factor
- Production duration vs downtime
- High-downtime batches

## Python Analysis
Python was used for:
- Data loading
- Data cleaning and validation
- Exploratory data analysis
- KPI calculation
- Product-level downtime analysis
- Operator efficiency analysis
- Shift-level analysis
- Data visualization
A small machine-learning proof of concept was also developed using a Decision Tree Classifier to classify batches into low- and high-downtime categories.

## Power BI Dashboard
The Power BI dashboard contains two pages.
Page 1 — Manufacturing Overview
The overview page contains:
- Total Batches
- Total Production Duration
- Total Downtime
- Average Production Efficiency
- Downtime by Product
- Average Efficiency by Operator
- Downtime by Shift
- Production Duration vs Downtime
- Product, Operator, and Shift filters
Page 2 — Operations & Downtime Analysis
The operations page contains:
- Total Downtime
- Top Downtime Factor
- Operator with Highest Downtime
- High Downtime Batches
- Downtime by Factor
- Downtime by Operator
- Downtime by Operator Error

## Key Results
The current analysis identified:
- 31 production batches
- 3,180 minutes of total production duration
- 1,130 minutes of total downtime
- 67.67% average production efficiency
- 36.45 minutes average downtime per batch
## Project Structure
manufacturing-downtime-analysis/
│
├── excel/
├── Github/
├── Power BI/
├── python/
├── raw data/
├── sql/
├── Visualizations/
├── .gitignore
└── README.md

## Project Deliverables
- Excel data cleaning and analysis
- MySQL SQL analysis
- Python analysis notebook
- Python visualizations
- Power BI dashboard
- Project documentation

## Author
Rinshitha Shirin K