# Financial_statistics_of_consolidated_general_government_from_2005_to_2024

## Project Overview

This project analyzes government financial data from 2005 to 2024 to uncover trends, growth patterns, and key contributors to financial performance. The dataset includes multiple financial categories and subcategories, transformed and analyzed to support data driven decision making.

The primary objective is to evaluate how government financial metrics evolve over time and identify the main drivers behind changes in revenue or expenditure.

---

## Objectives

* Analyze financial trends over a 20 year period
* Measure year over year growth and performance
* Identify top contributing categories
* Evaluate the impact of economic shocks (e.g., 2020)
* Provide actionable insights for policy and planning

---

## Tools & Technologies

* **Excel (Power Query)**  Data cleaning and transformation (wide to long format)
* **BigQuery (SQL)**  Data analysis and aggregation
* **Power BI / Excel**  Data visualization and dashboarding

---

## Data Preparation

The original dataset was in a **wide format** with multiple year columns (Y2005–Y2024).

Key steps performed:

* Cleaned missing and inconsistent values
* Transformed dataset into **long format** using unpivoting
* Standardized structure into:

  * Category fields (H01–H25)
  * Year
  * Amount

This transformation enabled efficient time series analysis and scalable querying.

---

## Key Analysis Performed

### 1. Financial Trend Analysis

* Aggregated total financial values per year
* Identified long term upward or downward trends

### 2. Year-over-Year Growth

* Calculated growth using SQL window functions (LAG)
* Measured both absolute and percentage change

### 3. Category Contribution Analysis

* Identified top-performing categories
* Measured contribution percentages to total financial value

### 4. Shock Impact Analysis

* Compared pre-crisis (2019), crisis (2020), and post crisis (2021) periods
* Evaluated the financial impact of external events

---

## Key Insights

* Financial performance shows clear trends over time, enabling forecasting opportunities
* Certain categories consistently dominate total financial contribution
* Significant variations observed during crisis periods highlight sensitivity to external shocks
* Growth rates vary across categories, indicating uneven financial performance

---

## Business Value

This analysis supports:

* Strategic financial planning
* Budget allocation decisions
* Risk identification and mitigation
* Policy evaluation and improvement

---

## Future Enhancements

* Implement forecasting models for future financial predictions
* Build interactive dashboards with advanced filtering
* Integrate additional datasets for deeper economic analysis

---

## Conclusion

This project demonstrates the end to end data analytics process from data cleaning and transformation to advanced SQL analysis and insight generation. It highlights the importance of structured data modeling and analytical thinking in solving real world financial problems.
