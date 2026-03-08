-- =====================================================
--- BASIC SALES METRICES
-- =====================================================

--- TOTAL REVENUE
SELECT SUM(sales_amount) AS total_revenue
FROM gold.fact_sales;

--- TOTAL NUMBER OF ORDERS
SELECT COUNT(DISTINCT order_number) AS total_orders
FROM gold.fact_sales;

--- TOTAL QUANTITY SOLD
SELECT SUM(quantity) AS total_units_sold
FROM gold.fact_sales;

--- AVERAGE ORDER VALUE
SELECT AVG(sales_amount) AS average_order_value
FROM gold.fact_sales;

--- AVERAGE PRODUCT PRICE
SELECT AVG(price) AS average_price
FROM gold.fact_sales;
