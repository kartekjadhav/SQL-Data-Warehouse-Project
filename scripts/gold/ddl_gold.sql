/* =============================================================================
   Script:   Gold Layer - Dimension & Fact Views
   Purpose:  Creates the final analytical views in the Gold layer of the data 
             warehouse. Transforms and integrates cleansed Silver layer data 
             into business-ready Star Schema structures, consisting of:
               - dim_customers : Customer dimension with demographic enrichment
                                 from both CRM and ERP source systems
               - dim_products  : Product dimension with category mapping, 
                                 filtered to active (current) products only
               - fact_sales    : Central fact table linking sales transactions
                                 to customer and product dimensions
   Schema:   gold
   Layer:    Gold (Presentation / Reporting)
   Depends:  silver.crm_cust_info, silver.erp_cust_az12, silver.erp_loc_a101,
             silver.crm_prd_info, silver.erp_px_cat_g1v2,
             silver.crm_sales_details
   Notes:    - All views are dropped and recreated on each execution
             - ROW_NUMBER() generates surrogate keys for dimension tables
             - Gender defaults to ERP source when CRM value is 'n/a'
             - Historical products (prd_end_dt IS NOT NULL) are excluded
============================================================================= */

IF OBJECT_ID('gold.dim_customers', 'V') IS NOT NULL
	DROP VIEW gold.dim_customers;
GO
CREATE VIEW gold.dim_customer AS
SELECT
	ROW_NUMBER() OVER (ORDER BY cc.cst_id) AS customer_key,
	cc.cst_id AS customer_id,
	cc.cst_key AS customer_number,
	cc.cst_firstname AS first_name,
	cc.cst_lastname AS last_name,
	cc.cst_marital_status AS marital_status,
	CASE
		WHEN cc.cst_gndr = 'n/a' THEN COALESCE(ec.gen, 'n/a')
		ELSE cc.cst_gndr 
	END AS gender,
	ec.bdate AS birth_date,
	el.cntry AS country,
	cc.cst_create_date
FROM silver.crm_cust_info AS cc
LEFT JOIN silver.erp_cust_az12 AS ec
ON cc.cst_key = ec.ci
LEFT JOIN silver.erp_loc_a101 AS el
ON cc.cst_key = el.cid;

GO

IF OBJECT_ID('gold.dim_products', 'V') IS NOT NULL
	DROP VIEW gold.dim_products;
GO
CREATE VIEW gold.dim_products AS
SELECT
	ROW_NUMBER() OVER (ORDER BY cpi.prd_start_dt, cpi.prd_key) AS product_key,
	cpi.prd_id AS product_id,
	cpi.prd_key AS product_number,
	cpi.prd_nm AS product_name,
	cpi.cat_id AS category_id,
	epc.cat AS category,
	epc.subcat AS sub_category,
	epc.maintenance AS maintenance,
	cpi.prd_line AS product_line,
	cpi.prd_start_dt AS start_date,
	cpi.prd_cost AS cost
FROM silver.crm_prd_info AS cpi
LEFT JOIN silver.erp_px_cat_g1v2 AS epc
ON cpi.cat_id = epc.id
WHERE cpi.prd_end_dt IS NULL -- Filter out all historical data;

GO

IF OBJECT_ID('gold.fact_sales', 'V') IS NOT NULL
	DROP VIEW gold.fact_sales;
GO
CREATE VIEW gold.fact_sales AS
SELECT
    sls_ord_num AS order_number,
    dp.product_key,
    dc.customer_id,
    sls_order_dt AS order_date,
    sls_ship_dt AS shipping_date,
    sls_due_dt AS due_date,
    sls_sales AS sales_amount,
    sls_quantity AS quantity,
    sls_price AS price,
    dwh_create_date
FROM silver.crm_sales_details csd
LEFT JOIN gold.dim_customer AS dc
ON csd.sls_cust_id = dc.customer_id
LEFT JOIN gold.dim_products AS dp
ON csd.sls_prd_key = dp.product_number;
