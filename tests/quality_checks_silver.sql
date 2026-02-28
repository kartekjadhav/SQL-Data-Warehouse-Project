/*
===================================
Quality Checks
===================================

This script is to perform various quality checks post loading silver layer. 
It includes
  1. Checking duplicates or NULLS in primary key.
  2. Handling invalid dates.
  3. Doing data normalisation in columns with low cardanility.
  4. Handing leading or trailing spaces in the fields.
  5. Data consistency between related fields.


*/

-- =====================
-- Table silver.crm_cust_info
-- =====================
-- Check for duplicates and NULLS in Primary Key
-- Expectation : No Result
SELECT
	cst_id,
	COUNT(*) count
FROM silver.crm_cust_info
GROUP BY cst_id
HAVING COUNT(*) > 1 OR cst_id IS NULL;


-- Check for unwanted leading and trailing spaces in string values
-- Expectation : No Result
SELECT
	cst_firstname,
	cst_lastname,
	cst_marital_status,
	cst_gndr
FROM silver.crm_cust_info
WHERE
	cst_firstname <> TRIM(cst_firstname)
	OR cst_lastname <> TRIM(cst_lastname)
	OR cst_marital_status <> TRIM(cst_marital_status)
	OR cst_gndr <> TRIM(cst_gndr);

-- Data standardization & Consistency: cst_gndr
-- Expectation : Only 2 genders - Male, Female
SELECT
	cst_gndr
FROM silver.crm_cust_info
GROUP BY cst_gndr;


-- Data standardization & Consistency: cst_marital_status
-- Expectation : Only 2 status - Single, Married
SELECT
	cst_marital_status
FROM silver.crm_cust_info
GROUP BY cst_marital_status;


-- =====================
-- Table silver.crm_prd_info
-- =====================
-- Check for duplicates and NULLS in Primary Key
-- Expectation : No Result
SELECT
	prd_id,
	COUNT(*) AS count
FROM silver.crm_prd_info
GROUP BY prd_id
HAVING COUNT(*) > 1 OR prd_id IS NULL;

-- Check if any NULL in prd_key
-- Expectation : 0
SELECT
	COUNT(*) AS count
FROM silver.crm_prd_info
WHERE prd_key IS NULL;

-- Check if any NULL in cat_id
-- Expectation : 0
SELECT
	COUNT(*) AS count
FROM silver.crm_prd_info
WHERE cat_id IS NULL;

-- Check for unwanted leading and trailing spaces in string values
-- Expectation : No Result
SELECT
	prd_key,
	prd_nm,
	prd_line
FROM silver.crm_prd_info
WHERE
	prd_key <> TRIM(prd_key)
	AND prd_nm <> TRIM(prd_nm)
	AND prd_line <> TRIM(prd_line);

-- Data standardization & Consistency: prd_line
-- Expectation : Only 4 genders - Male, Female
SELECT
	prd_line
FROM silver.crm_prd_info
GROUP BY prd_line;


-- Data standardization & Consistency: prd_start_dt and prd_end_dt
-- Expectation: prd_start_dt should be less than prd_end_dt, and the interval shouldn't overlap for same products.
SELECT
	*
FROM silver.crm_prd_info
WHERE prd_start_dt > prd_end_dt;


-- =====================
-- Table silver.crm_sales_details
-- =====================
-- Check for duplicates or NUlls
-- Expectation : None
SELECT
	sls_ord_num,
	sls_prd_key
FROM bronze.crm_sales_details
WHERE 
	sls_ord_num <>TRIM(sls_ord_num)
	AND sls_prd_key <> TRIM(sls_prd_key)


SELECT
	sls_prd_key
FROM bronze.crm_sales_details
WHERE sls_prd_key NOT IN (SELECT prd_key from silver.crm_prd_info);

SELECT
	sls_cust_id
FROM bronze.crm_sales_details
WHERE sls_cust_id NOT IN (SELECT cst_id from silver.crm_cust_info);


SELECT
	sls_order_dt
FROM bronze.crm_sales_details
WHERE 
	sls_order_dt IS NULL
	OR sls_order_dt <= 0
	OR LEN(sls_order_dt) <> 8


SELECT
	sls_sales,
	sls_quantity,
	sls_price
FROM bronze.crm_sales_details
WHERE sls_sales <> sls_quantity * sls_price;

SELECT
	sls_sales AS old_sls_sales,
	CASE 
		WHEN sls_sales IS NULL OR sls_sales <= 0 OR sls_price <> ABS(sls_quantity * sls_price)
		THEN sls_quantity * ABS(sls_price)
		ELSE sls_sales
	END AS sls_sales,
	sls_price AS old_sls_price,
	CASE 
		WHEN sls_price IS NULL OR sls_price <= 0 
		THEN sls_sales / NULLIF(sls_quantity,0)
		ELSE sls_price
	END AS sls_price,
	sls_quantity
FROM bronze.crm_sales_details
WHERE sls_sales <> sls_quantity * sls_price;

-- =====================
-- Table silver.erp_cust_az12
-- =====================
-- Check for duplicates in ci
SELECT
	ci
FROM silver.erp_cust_az12
GROUP BY ci
HAVING COUNT(*) > 1 OR ci IS NULL

-- Birthdate should not be 100 years old or in future
SELECT
	bdate
FROM silver.erp_cust_az12
WHERE bdate < '1926-02-28' OR bdate > GETDATE()


-- Values of low cardinality
SELECT
	DISTINCT
	gen
FROM silver.erp_cust_az12;

-- =====================
-- Table silver.erp_loc_a101
-- =====================
-- Leading or trailing spaces
SELECT
	cid
FROM silver.erp_loc_a101
WHERE TRIM(cid) <> cid;

-- Normalised the foreign key
SELECT 
	cid
FROM silver.erp_loc_a101

-- Low cardanility values
SELECT 
	DISTINCT
	cntry
FROM silver.erp_loc_a101;


-- =====================
-- Table silver.erp_px_cat_g1v2
-- =====================
-- No duplicate product id or null
SELECT
	id
FROM bronze.erp_px_cat_g1v2
GROUP BY id
HAVING COUNT(*) > 1 OR id IS NULL

-- No leading or trailing spaces in cat and subcat
SELECT
	*
FROM bronze.erp_px_cat_g1v2
WHERE TRIM(cat) <> cat OR TRIM(subcat) <> subcat OR TRIM(maintenance) <> maintenance;


-- Low cardanilty data
SELECT
	DISTINCT 
	cat
FROM bronze.erp_px_cat_g1v2;

SELECT
	DISTINCT 
	subcat
FROM bronze.erp_px_cat_g1v2;

SELECT
	DISTINCT 
	maintenance
FROM bronze.erp_px_cat_g1v2;

SELECT
	id
FROM bronze.erp_px_cat_g1v2
WHERE id NOT IN (
	SELECT
		DISTINCT
		cat_id
	FROM silver.crm_prd_info
)
