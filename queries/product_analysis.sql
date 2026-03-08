-- =====================================================
--- PRODUCT ANALYSIS
-- =====================================================

--- REVENUE BY PRODUCT
SELECT
 p.product_name,
 SUM(f.sales_amount) AS revenue
FROM gold.fact_sales f
JOIN gold.dim_products p
ON f.product_key = p.product_key
GROUP BY p.product_name
ORDER BY revenue DESC

--- TOTAL QUANTITY SOLD PER PRODUCT
SELECT
 p.product_name,
 SUM(f.quantity) AS units_sold
FROM gold.fact_sales f
JOIN gold.dim_products p
ON f.product_key = p.product_key
GROUP BY p.product_name
ORDER BY units_sold DESC

--- REVENUE BY CATEGORY
SELECT
 p.category,
 SUM(f.sales_amount) AS revenue
FROM gold.fact_sales f
JOIN gold.dim_products p
ON f.product_key = p.product_key
GROUP BY p.category
ORDER BY revenue DESC

--- REVENUE BY SUBCATEGORY
SELECT
 p.sub_category,
 SUM(f.sales_amount) AS revenue
FROM gold.fact_sales f
JOIN gold.dim_products p
ON f.product_key = p.product_key
GROUP BY p.sub_category
ORDER BY revenue DESC

--- TOP 10 PRODUCTS BY REVENUE
SELECT TOP 10
 p.product_name,
 SUM(f.sales_amount) AS revenue
FROM gold.fact_sales f
JOIN gold.dim_products p
ON f.product_key = p.product_key
GROUP BY p.product_name
ORDER BY revenue DESC
