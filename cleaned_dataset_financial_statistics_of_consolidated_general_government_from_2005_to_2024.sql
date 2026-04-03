select * from `workspace`.`default`.`cleaned_dataset_financial_statistics_of_consolidated_general_government_from_2005_to_2024`;



-- ============================================================
-- MASTER FINANCIAL SUMMARY (CLEANED LONG FORMAT)
-- ============================================================

SELECT
    H01 AS Main_Category,
    H02 AS Sub_Category,

    Year,

    -- Total value per category per year
    SUM(Amount) AS Total_Amount,

    -- Average value per category per year
    AVG(Amount) AS Avg_Amount,

    -- Number of records contributing
    COUNT(*) AS Num_Records

FROM `workspace`.`default`.`cleaned_dataset_financial_statistics_of_consolidated_general_government_from_2005_to_2024`

GROUP BY H01, H02, Year

ORDER BY Year DESC, Total_Amount DESC;



-- ============================================================
-- TOTAL GOVERNMENT FINANCIAL TREND (2005–2024)
-- ============================================================

SELECT
    Year,

    SUM(Amount) AS Total_Financial_Value

FROM `workspace`.`default`.`cleaned_dataset_financial_statistics_of_consolidated_general_government_from_2005_to_2024`

GROUP BY Year

ORDER BY Year;



-- ============================================================
-- YEAR-OVER-YEAR GROWTH ANALYSIS
-- ============================================================

WITH yearly_totals AS (
    SELECT
        Year,
        SUM(Amount) AS Total_Value
    FROM `workspace`.`default`.`cleaned_dataset_financial_statistics_of_consolidated_general_government_from_2005_to_2024`
    GROUP BY Year
)

SELECT
    Year,
    Total_Value,

    LAG(Total_Value) OVER (ORDER BY Year) AS Previous_Year,

    (Total_Value - LAG(Total_Value) OVER (ORDER BY Year)) AS Growth_Value,

    try_divide(
        (Total_Value - LAG(Total_Value) OVER (ORDER BY Year)),
        LAG(Total_Value) OVER (ORDER BY Year)
    ) * 100 AS Growth_Percentage

FROM yearly_totals

ORDER BY Year;

-- ============================================================
-- TOP FINANCIAL CATEGORIES (LATEST YEAR)
-- ============================================================

SELECT
    H01 AS Main_Category,
    H02 AS Sub_Category,

    SUM(Amount) AS Total_Amount

FROM `workspace`.`default`.`cleaned_dataset_financial_statistics_of_consolidated_general_government_from_2005_to_2024`

WHERE Year = 2024

GROUP BY H01, H02

ORDER BY Total_Amount DESC

LIMIT 10;


-- ============================================================
-- CATEGORY CONTRIBUTION TO TOTAL (2024)
-- ============================================================

WITH total AS (
    SELECT SUM(Amount) AS grand_total
    FROM `workspace`.`default`.`cleaned_dataset_financial_statistics_of_consolidated_general_government_from_2005_to_2024`
    WHERE Year = 2024
)

SELECT
    t.H01 AS Main_Category,

    SUM(t.Amount) AS Total_Amount,

    try_divide(SUM(t.Amount), total.grand_total) * 100 AS Contribution_Percentage

FROM `workspace`.`default`.`cleaned_dataset_financial_statistics_of_consolidated_general_government_from_2005_to_2024` t
CROSS JOIN total

WHERE t.Year = 2024

GROUP BY t.H01, total.grand_total

ORDER BY Contribution_Percentage DESC;


-- ============================================================
-- PRE vs DURING vs POST CRISIS ANALYSIS
-- ============================================================

SELECT
    H01 AS Main_Category,

    SUM(CASE WHEN Year = 2019 THEN Amount END) AS Pre_Crisis,
    SUM(CASE WHEN Year = 2020 THEN Amount END) AS Crisis,
    SUM(CASE WHEN Year = 2021 THEN Amount END) AS Post_Crisis,

    SUM(CASE WHEN Year = 2020 THEN Amount END) -
    SUM(CASE WHEN Year = 2019 THEN Amount END) AS Shock_Impact

FROM `workspace`.`default`.`cleaned_dataset_financial_statistics_of_consolidated_general_government_from_2005_to_2024`

GROUP BY H01

ORDER BY Shock_Impact DESC;