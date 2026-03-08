-- =============================================================================
--- REPORTING VIEWS
-- =============================================================================


--- SALES BY MONTH
/* SELECT * FROM gold.sales_by_month */ 
IF OBJECT_ID('gold.sales_by_month', 'V') IS NOT NULL
 DROP VIEW gold.sales_by_month;
GO
CREATE VIEW gold.sales_by_month AS
SELECT
 YEAR(order_date) AS sales_year,
 MONTH(order_date) AS sales_month,
 SUM(sales_amount) AS total_revenue,
 SUM(quantity) AS total_units
FROM gold.fact_sales
GROUP BY
 YEAR(order_date),
 MONTH(order_date)
GO


--- TOP PRODUCTS BY REVENUE
/* SELECT * FROM gold.top_products */
IF OBJECT_ID('gold.top_products', 'V') IS NOT NULL
 DROP VIEW gold.top_products;
GO
CREATE VIEW gold.top_products AS
SELECT
 p.product_name,
 SUM(f.sales_amount) AS total_revenue,
 SUM(f.quantity) AS units_sold
FROM gold.fact_sales f
JOIN gold.dim_products p
ON f.product_key = p.product_key
GROUP BY
 p.product_name
GO


--- SALES BY COUNTRY
/* SELECT * FROM gold.sales_by_country */ 
IF OBJECT_ID('gold.sales_by_country', 'V') IS NOT NULL
 DROP VIEW gold.sales_by_country;
GO
CREATE VIEW gold.sales_by_country AS
SELECT
 c.customer_country,
 SUM(f.sales_amount) AS total_revenue,
 COUNT(DISTINCT f.order_number) AS total_orders
FROM gold.fact_sales f
JOIN gold.dim_customers c
ON f.customer_key = c.customer_key
GROUP BY
 c.customer_country
GO
