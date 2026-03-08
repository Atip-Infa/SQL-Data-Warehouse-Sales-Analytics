-- =====================================================
--- TIME ANALYSIS
-- =====================================================

--- SALES BY YEAR
SELECT
 YEAR(order_date) AS sales_year,
 SUM(sales_amount) AS revenue
FROM gold.fact_sales
GROUP BY YEAR(order_date)
ORDER BY sales_year

--- SALES BY MONTH
SELECT
 YEAR(order_date) AS YEAR,
 MONTH(order_date) AS MONTH,
 SUM(sales_amount) AS revenue
FROM gold.fact_sales
GROUP BY
 YEAR(order_date),
 MONTH(order_date)
ORDER BY YEAR, MONTH

--- ORDERS PER MONTH
SELECT
 YEAR(order_date) AS YEAR,
 MONTH(order_date) AS MONTH,
 COUNT(DISTINCT order_number) AS orders
FROM gold.fact_sales
GROUP BY
 YEAR(order_date),
 MONTH(order_date)
ORDER BY YEAR, MONTH

--- AVERAGE SALES PER DAY
SELECT
 order_date,
 AVG(sales_amount) AS avg_sales
FROM gold.fact_sales
GROUP BY order_date
ORDER BY order_date

--- DAILY REVENUE
SELECT
 order_date,
 SUM(sales_amount) AS daily_revenue
FROM gold.fact_sales
GROUP BY order_date
ORDER BY order_date
