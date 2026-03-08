## QUESTION 1: Which product has the highest revenue?

```sql
SELECT TOP 1
 p.product_name,
 SUM(f.sales_amount) AS total_revenue
FROM gold.fact_sales f
JOIN gold.dim_products p
ON f.product_key = p.product_key
GROUP BY p.product_name
ORDER BY total_revenue DESC;
```

--------------------------------------------------------
## QUESTION 2: Which countries contribute the most to total sales?

```sql
SELECT
 customer_country,
 total_revenue,
 total_orders
FROM gold.sales_by_country
ORDER BY total_revenue DESC;
```

--------------------------------------------------------
## QUESTION 3: How do sales change over time?

```sql
SELECT
 sales_year,
 sales_month,
 total_revenue,
 total_units
FROM gold.sales_by_month
ORDER BY sales_year, sales_month;
```

--------------------------------------------------------
## QUESTION 4: Who are the top spending customers?

```sql
SELECT
 c.customer_first_name,
 c.customer_last_name,
 SUM(f.sales_amount) AS total_spent
FROM gold.fact_sales f
JOIN gold.dim_customers c
ON f.customer_key = c.customer_key
GROUP BY
 c.customer_first_name,
 c.customer_last_name
ORDER BY total_spent DESC;
```

--------------------------------------------------------
## QUESTION 5: Which product categories have the most revenue?

```sql
SELECT
 p.category,
 SUM(f.sales_amount) AS total_revenue
FROM gold.fact_sales f
JOIN gold.dim_products p
ON f.product_key = p.product_key
GROUP BY p.category
ORDER BY total_revenue DESC;
```
