-- =====================================================
--- WINDOW FUNCTION ANALYSIS
-- =====================================================

--- RANK PRODUCTS BY REVENUE
SELECT
 p.product_name,
 SUM(f.sales_amount) AS revenue,
 RANK() OVER (ORDER BY SUM(f.sales_amount) DESC) AS revenue_rank
FROM gold.fact_sales f
JOIN gold.dim_products p
ON f.product_key = p.product_key
GROUP BY p.product_name

--- RANK CUSTOMERS BY SPENDING
SELECT
 c.customer_id,
 SUM(f.sales_amount) AS revenue,
 RANK() OVER (ORDER BY SUM(f.sales_amount) DESC) AS customer_rank
FROM gold.fact_sales f
JOIN gold.dim_customers c
ON f.customer_key = c.customer_key
GROUP BY c.customer_id

--- RUNNING TOTAL REVENUE
SELECT
 order_date,
 SUM(sales_amount) AS daily_sales,
 SUM(SUM(sales_amount)) OVER (ORDER BY order_date) AS running_total
FROM gold.fact_sales
GROUP BY order_date

--- REVENUE SHARE PER PRODUCT
SELECT
 p.product_name,
 SUM(f.sales_amount) AS revenue,
 SUM(f.sales_amount) * 100.0 /
 SUM(SUM(f.sales_amount)) OVER() AS revenue_percentage
FROM gold.fact_sales f
JOIN gold.dim_products p
ON f.product_key = p.product_key
GROUP BY p.product_name

--- TOP CUSTOMER PER COUNTRY
SELECT *
FROM (
SELECT
 c.customer_country,
 c.customer_id,
 SUM(f.sales_amount) AS revenue,
 RANK() OVER (
PARTITION BY c.customer_country
ORDER BY SUM(f.sales_amount) DESC
) AS rank_in_country
FROM gold.fact_sales f
JOIN gold.dim_customers c
ON f.customer_key = c.customer_key
GROUP BY
 c.customer_country,
 c.customer_id
) t
WHERE rank_in_country = 1
