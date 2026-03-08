-- =====================================================
--- CUSTOMER ANALYSIS
-- =====================================================

--- REVENUE BY COUNTRY
SELECT
 c.customer_country,
 SUM(f.sales_amount) AS revenue
FROM gold.fact_sales f
JOIN gold.dim_customers c
ON f.customer_key = c.customer_key
GROUP BY c.customer_country
ORDER BY revenue DESC

--- TOTAL CUSTOMERS
SELECT COUNT(*) AS total_customers
FROM gold.dim_customers

--- REVENUE BY GENDER
SELECT
 c.customer_gender,
 SUM(f.sales_amount) AS revenue
FROM gold.fact_sales f
JOIN gold.dim_customers c
ON f.customer_key = c.customer_key
GROUP BY c.customer_gender

--- TOP 10 CUSTOMERS BY REVENUE
SELECT TOP 10
 c.customer_id,
 c.customer_first_name,
 c.customer_last_name,
SUM(f.sales_amount) AS revenue
FROM gold.fact_sales f
JOIN gold.dim_customers c
ON f.customer_key = c.customer_key
GROUP BY
 c.customer_id,
 c.customer_first_name,
 c.customer_last_name
ORDER BY revenue DESC

--- ORDERS PER CUSTOMER
SELECT
 c.customer_id,
COUNT(DISTINCT f.order_number) AS total_orders
FROM gold.fact_sales f
JOIN gold.dim_customers c
ON f.customer_key = c.customer_key
GROUP BY c.customer_id
ORDER BY total_orders DESC
