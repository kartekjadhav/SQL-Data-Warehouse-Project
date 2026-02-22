USE DataWarehouse;

GO

CREATE OR ALTER PROCEDURE bronze.load_bronze AS
BEGIN
	DECLARE @start_time DATETIME, @end_time DATETIME, @batch_start_time DATETIME, @batch_end_time DATETIME
	BEGIN TRY
		SET @batch_start_time = GETDATE();
		PRINT '=============================================';
		PRINT 'Loading Bronze Layer';
		PRINT '=============================================';

		PRINT '---------------------------------------------';
		PRINT 'Loading CRM Tables';
		PRINT '---------------------------------------------';

		-- Inserting data for table bronze.crm_cust_info
		PRINT 'STARTING TABLE bronze.crm_cust_info';
		SET @start_time=GETDATE();
		PRINT 'Truncating table bronze.crm_cust_info';
		TRUNCATE TABLE bronze.crm_cust_info;
		PRINT 'Inserting data into table bronze.crm_cust_info';
		BULK INSERT bronze.crm_cust_info
		FROM 'Path for bronze.crm_cust_info data'
		WITH (
			FIRSTROW=2,
			FIELDTERMINATOR=',',
			TABLOCK
		);
		SET @end_time=GETDATE();
		PRINT 'Successfully loaded data into bronze.crm_cust_info table';
		PRINT 'Time taken to load' + CAST(DATEDIFF(SECOND, @start_time, @end_time) AS NVARCHAR) + ' seconds';

		-- Inserting data for table bronze.crm_prd_info
		PRINT 'STARTING TABLE bronze.crm_prd_info';
		SET @start_time=GETDATE();
		PRINT 'Truncating table bronze.crm_prd_info';
		TRUNCATE TABLE bronze.crm_prd_info;
		PRINT 'Inserting data into table bronze.crm_prd_info';
		BULK INSERT bronze.crm_prd_info
		FROM 'Path for bronze.crm_prd_info data'
		WITH (
			FIRSTROW=2,
			FIELDTERMINATOR=',',
			TABLOCK
		);
		SET @end_time=GETDATE();
		PRINT 'Successfully loaded data into bronze.crm_prd_info';
		PRINT 'Time taken to load: ' + CAST(DATEDIFF(SECOND, @start_time, @end_time) AS NVARCHAR) + ' seconds';

		-- Inserting data for table bronze.crm_sales_details
		PRINT 'STARTING TABLE bronze.crm_sales_details';
		SET @start_time=GETDATE();
		PRINT 'Truncating table bronze.crm_sales_details';
		TRUNCATE TABLE bronze.crm_sales_details;
		PRINT 'Inserting data into table bronze.crm_sales_details';
		BULK INSERT bronze.crm_sales_details
		FROM 'Path for bronze.crm_sales_details data'
		WITH (
			FIRSTROW=2,
			FIELDTERMINATOR=',',
			TABLOCK
		);
		SET @end_time=GETDATE();
		PRINT 'Successfully loaded data into bronze.crm_sales_details';
		PRINT 'Time taken to load: ' + CAST(DATEDIFF(SECOND, @start_time, @end_time) AS NVARCHAR) + ' seconds';


		PRINT '---------------------------------------------';
		PRINT 'Loading ERP Tables';
		PRINT '---------------------------------------------';

		-- Inserting data for table bronze.erp_cust_az12
		PRINT 'STARTING TABLE bronze.erp_cust_az12';
		SET @start_time=GETDATE();
		PRINT 'Truncating table bronze.erp_cust_az12';
		TRUNCATE TABLE bronze.erp_cust_az12;
		PRINT 'Inserting data into table bronze.erp_cust_az12';
		BULK INSERT bronze.erp_cust_az12
		FROM 'Path for bronze.erp_cust_az12 data'
		WITH (
			FIRSTROW=2,
			FIELDTERMINATOR=',',
			TABLOCK
		);
		SET @end_time=GETDATE();
		PRINT 'Successfully loaded data into bronze.erp_cust_az12';
		PRINT 'Time taken to load: ' + CAST(DATEDIFF(SECOND, @start_time, @end_time) AS NVARCHAR) + ' seconds';

		-- Inserting data for table bronze.erp_loc_a101
		PRINT 'STARTING TABLE bronze.erp_loc_a101';
		SET @start_time=GETDATE();
		PRINT 'Truncating table bronze.erp_loc_a101';
		TRUNCATE TABLE bronze.erp_loc_a101;
		PRINT 'Inserting data into table bronze.erp_loc_a101';
		BULK INSERT bronze.erp_loc_a101
		FROM 'Path for bronze.erp_loc_a101 data'
		WITH (
			FIRSTROW=2,
			FIELDTERMINATOR=',',
			TABLOCK
		);
		SET @end_time=GETDATE();
		PRINT 'Successfully loaded data into bronze.erp_loc_a101';
		PRINT 'Time taken to load: ' + CAST(DATEDIFF(SECOND, @start_time, @end_time) AS NVARCHAR) + ' seconds';


		-- Inserting data for table bronze.erp_px_cat_g1v2
		PRINT 'STARTING TABLE bronze.erp_px_cat_g1v2';
		SET @start_time=GETDATE();
		PRINT 'Truncating table bronze.erp_px_cat_g1v2';
		TRUNCATE TABLE bronze.erp_px_cat_g1v2;
		PRINT 'Inserting data into table bronze.erp_px_cat_g1v2';
		BULK INSERT bronze.erp_px_cat_g1v2
		FROM 'Path for bronze.erp_px_cat_g1v2 data'
		WITH (
			FIRSTROW=2,
			FIELDTERMINATOR=',',
			TABLOCK
		);
		SET @end_time=GETDATE();
		PRINT 'Successfully loaded data into bronze.erp_px_cat_g1v2';
		PRINT 'Time taken to load: ' + CAST(DATEDIFF(SECOND, @start_time, @end_time) AS NVARCHAR) + ' seconds';
	END TRY

	BEGIN CATCH
		PRINT '=========================================';
		PRINT 'ERROR OCCURED DURING BRONZE LOADING LAYER';
		PRINT 'Error Procedure: ' + ERROR_PROCEDURE();
		PRINT 'Error Line: ' + CAST(ERROR_LINE() AS NVARCHAR);
		PRINT 'Error Message: ' + ERROR_MESSAGE();
		PRINT 'Error Number: ' +  CAST(ERROR_NUMBER() AS NVARCHAR);
		PRINT 'Error State: ' + CAST(ERROR_STATE() AS NVARCHAR);
		PRINT '=========================================';
	END CATCH
END;

GO 

EXEC bronze.load_bronze;
