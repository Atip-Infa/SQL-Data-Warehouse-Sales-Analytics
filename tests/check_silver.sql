--- ===================================================
--- CHECK silver.crm_cust_info
--- ===================================================
--- CHECK FOR NULL AND DUPLICATE IN PRIMARY KEY
SELECT 
cst_id,
COUNT(*)
FROM silver.crm_cust_info
GROUP BY cst_id
HAVING COUNT(*) > 1 OR cst_id IS NULL



--- CHECK FOR UNWANTED SPACES
SELECT cst_firstname
FROM silver.crm_cust_info
WHERE cst_firstname != TRIM(cst_firstname)

--- CHECK FOR UNWANTED SPACES
SELECT cst_lastname
FROM silver.crm_cust_info
WHERE cst_lastname != TRIM(cst_lastname)

--- CHECK FOR UNWANTED SPACES
SELECT cst_gndr
FROM silver.crm_cust_info
WHERE cst_gndr!= TRIM(cst_gndr)

--- DATA STANDARDIZATION & CONSISTENCY
SELECT DISTINCT cst_gndr
FROM silver.crm_cust_info


--- DATA STANDARDIZATION & CONSISTENCY
SELECT DISTINCT cst_marital_status
FROM silver.crm_cust_info

--- ===================================================
--- CHECK silver.crm_prd_info
--- ===================================================
--- CHECK FOR NULL AND DUPLICATE IN PRIMARY KEY
SELECT 
prd_id,
COUNT(*)
FROM silver.crm_prd_info
GROUP BY prd_id
HAVING COUNT(*) > 1 OR prd_id IS NULL

--- CHECK FOR UNWANTED SPACES
SELECT prd_nm
FROM silver.crm_prd_info
WHERE prd_nm != TRIM(prd_nm)

--- CHECK FOR NULLS OR NEGATIVE NUMBERS
SELECT prd_cost
FROM silver.crm_prd_info
WHERE prd_cost < 0 OR prd_cost IS NULL

--- DATA STANDARDIZATION & CONSISTENCY
SELECT DISTINCT prd_line
FROM silver.crm_prd_info

--- CHECK INVALID DATE ORDERS
SELECT *
FROM silver.crm_prd_info
WHERE prd_end_dt < prd_start_dt

SELECT *
FROM silver.crm_prd_info


--- ===================================================
--- CHECK silver.crm_sales_details
--- ===================================================
--- CHECK INVALID DATES
SELECT
NULLIF(sls_order_dt,0) sls_order_dt
FROM bronze.crm_sales_details
WHERE sls_order_dt <=0 
OR LEN(sls_order_dt) != 8 
OR sls_order_dt > 20500101
OR sls_order_dt < 19000101


--- CHECK INVALID DATES
SELECT
NULLIF(sls_ship_dt,0) sls_ship_dt
FROM bronze.crm_sales_details
WHERE sls_ship_dt <=0 
OR LEN(sls_ship_dt) != 8 
OR sls_ship_dt > 20500101
OR sls_ship_dt < 19000101


--- CHECK INVALID DATES
SELECT
NULLIF(sls_due_dt,0) sls_due_dt
FROM bronze.crm_sales_details
WHERE sls_due_dt <=0 
OR LEN(sls_due_dt) != 8 
OR sls_due_dt > 20500101
OR sls_due_dt < 19000101


--- CHECK INVALID DATES
SELECT *
FROM silver.crm_sales_details
WHERE sls_order_dt > sls_ship_dt OR sls_order_dt > sls_due_dt


--- CHECK DATA CONSISTENCY: BETWEEN SALES, QUANTITY AND PRICE
--- SALES = QUANTITY * PRICE (CAN'T BE ZERO OR NULL OR NEGATIVE)

SELECT DISTINCT
sls_sales,
sls_quantity,
sls_price
FROM silver.crm_sales_details
WHERE sls_sales != sls_quantity * sls_price
OR sls_sales IS NULL OR sls_quantity IS NULL OR sls_price IS NULL
OR sls_sales <= 0 OR sls_quantity <= 0 OR sls_price <= 0
ORDER BY sls_sales, sls_quantity, sls_price

SELECT * FROM silver.crm_sales_details


--- ===================================================
--- CHECK silver.erp_cust_az12
--- ===================================================
--- IDENTIFY OUT OF RANGE DATES

SELECT DISTINCT
bdate
FROM silver.erp_cust_az12
WHERE bdate < '1921-01-01' OR bdate > GETDATE()


--- DATA STANDARDIZATION & CONSISTENCY
SELECT DISTINCT 
gen

FROM silver.erp_cust_az12


SELECT * FROM silver.erp_cust_az12



--- ===================================================
--- CHECK silver.erp_loc_a101
--- ===================================================
--- DATA STANDARDIZATION & CONSISTENCY
SELECT DISTINCT cntry
FROM silver.erp_loc_a101
ORDER BY cntry 

SELECT * FROM silver.erp_loc_a101



--- ===================================================
--- CHECK silver.erp_px_cat_g1v2
--- ===================================================
--- CHECK UNWANTED SPACE
SELECT * FROM bronze.erp_px_cat_g1v2
WHERE cat != TRIM(cat) OR subcat != TRIM(subcat) OR maintenance != TRIM(maintenance)

--- CHECK STANDARDIZATION AND CONSISTENCY
SELECT DISTINCT
cat
FROM bronze.erp_px_cat_g1v2

SELECT DISTINCT
subcat
FROM bronze.erp_px_cat_g1v2

SELECT DISTINCT
maintenance
FROM bronze.erp_px_cat_g1v2


SELECT * FROM silver.erp_px_cat_g1v2
