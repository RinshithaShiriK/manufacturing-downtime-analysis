CREATE DATABASE manufacturing_downtime_analysis;

USE manufacturing_downtime_analysis;

SELECT DATABASE();

SHOW TABLES;

SELECT COUNT(*) AS productivity_rows
FROM `productivity clean`;

SELECT COUNT(*) AS downtime_rows
FROM `downtime clean`;

SELECT COUNT(*) AS factors_rows
FROM `factors clean`;

SELECT COUNT(*) AS products_rows
FROM `products clean`;

DESCRIBE `productivity clean`;
DESCRIBE `downtime clean`;
DESCRIBE `factors clean`;
DESCRIBE `products clean`;

RENAME TABLE
    `productivity clean` TO line_productivity,
    `downtime clean` TO line_downtime,
    `factors clean` TO downtime_factors,
    `products clean` TO products;

SHOW TABLES;

USE manufacturing_downtime_analysis;

SELECT
    Batch,
    Product,
    Operator,
    `Production Duration`,
    `Min Batch Time`,
    `Total Downtime (Minutes)`,
    `Excess Time`,
    `Production Efficiency (%)`,
    Shifts
FROM line_productivity;

SELECT
    Batch,
    Product,
    Operator,
    `Production Duration`,
    `Total Downtime (Minutes)`
FROM line_productivity
WHERE `Total Downtime (Minutes)` > 40
ORDER BY `Total Downtime (Minutes)` DESC;

SELECT
    Operator,
    COUNT(Batch) AS Total_Batches,
    ROUND(AVG(`Production Efficiency (%)`), 2) AS Average_Efficiency
FROM line_productivity
GROUP BY Operator
ORDER BY Average_Efficiency DESC;

SELECT
    COUNT(Batch) AS Total_Batches,
    SUM(`Production Duration`) AS Total_Production,
    SUM(`Total Downtime (Minutes)`) AS Total_Downtime,
    ROUND(AVG(`Production Efficiency (%)`), 2) AS Average_Efficiency,
    ROUND(AVG(`Production Duration`), 2) AS Average_Production_Duration
FROM line_productivity;

SELECT
    lp.Product,
    p.Flavor,
    p.Size,
    COUNT(lp.Batch) AS Total_Batches,
    SUM(lp.`Production Duration`) AS Total_Production,
    ROUND(AVG(lp.`Production Efficiency (%)`), 2) AS Average_Efficiency
FROM line_productivity lp
INNER JOIN products p
    ON lp.Product = p.Product
GROUP BY
    lp.Product,
    p.Flavor,
    p.Size
ORDER BY Total_Production DESC;

SELECT
    Batch,
    Product,
    Operator,
    `Production Efficiency (%)`,
    CASE
        WHEN `Production Efficiency (%)` >= 75 THEN 'High Efficiency'
        WHEN `Production Efficiency (%)` >= 60 THEN 'Medium Efficiency'
        ELSE 'Low Efficiency'
    END AS Efficiency_Category
FROM line_productivity
ORDER BY `Production Efficiency (%)` DESC;

SELECT
    Batch,
    Product,
    Operator,
    `Total Downtime (Minutes)`
FROM line_productivity
WHERE `Total Downtime (Minutes)` >
(
    SELECT AVG(`Total Downtime (Minutes)`)
    FROM line_productivity
)
ORDER BY `Total Downtime (Minutes)` DESC;

SELECT
    Operator,
    ROUND(AVG(`Production Efficiency (%)`), 2) AS Average_Efficiency,
    RANK() OVER (
        ORDER BY AVG(`Production Efficiency (%)`) DESC
    ) AS Efficiency_Rank
FROM line_productivity
GROUP BY Operator
ORDER BY Efficiency_Rank;

SELECT
    Batch,
    Product,
    Operator,
    `Total Downtime (Minutes)`,
    RANK() OVER (
        ORDER BY `Total Downtime (Minutes)` DESC
    ) AS Downtime_Rank
FROM line_productivity
ORDER BY Downtime_Rank;

CREATE OR REPLACE VIEW production_summary AS
SELECT
    Operator,
    COUNT(Batch) AS Total_Batches,
    SUM(`Production Duration`) AS Total_Production,
    SUM(`Total Downtime (Minutes)`) AS Total_Downtime,
    ROUND(AVG(`Production Efficiency (%)`), 2) AS Average_Efficiency,
    ROUND(AVG(`Production Duration`), 2) AS Average_Production_Duration
FROM line_productivity
GROUP BY Operator;

