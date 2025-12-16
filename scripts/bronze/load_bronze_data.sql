*/ 
	Loading data from the  source files crm and erp to the bronze schema tables

--Used procedure to automate truncating and inserting new data from the csv file.

Parameters: The procedure does not return any values .

To use the procedure:	
exec  bronze.load_bronze
/*


CREATE OR ALTER PROCEDURE bronze.load_bronze AS
BEGIN

  -- Used Try-Catch for error handling
BEGIN TRY

    --Inserting data to crm_cust_info
		print'.....................'
		print 'Truncated table: bronze.crm_cust_info'
		Truncate table bronze.crm_cust_info

		print'Inserted data into bronze.crm_cust_info'
		BULK INSERT bronze.crm_cust_info
		FROM 'C:\Users\zulfy\Downloads\sql-data-warehouse-project\sql-data-warehouse-project\datasets\source_crm\cust_info.csv'
		WITH (
		FIRSTROW = 2,
		FIELDTERMINATOR = ',',
		TABLOCK
		);

--Inserting data to crm_prd_info
		print'.....................'
		print 'Truncated table: bronze.crm_prd_info'
		TRUNCATE TABLE bronze.crm_prd_info

		print'Inserted data into bronze.crm_prd_info'

		BULK INSERT bronze.crm_prd_info
		FROM 'C:\Users\zulfy\Downloads\sql-data-warehouse-project\sql-data-warehouse-project\datasets\source_crm\prd_info.csv'
		WITH (
		FIRSTROW = 2,
		FIELDTERMINATOR = ',',
		TABLOCK
		);

    --Inserting data to crm_sales_details
		print'.....................'
		print 'Truncated table: bronze.crm_sales_details'
		TRUNCATE TABLE bronze.crm_sales_details
		print'Inserted data into bronze.crm_sales_details'
		BULK INSERT bronze.crm_sales_details
		FROM 'C:\Users\zulfy\Downloads\sql-data-warehouse-project\sql-data-warehouse-project\datasets\source_crm\sales_details.csv'
		WITH (
		FIRSTROW = 2,
		FIELDTERMINATOR = ',',
		TABLOCK
		);

    --Inserting data to crm_cust_AZ12
		print'.....................'
		print 'Truncated table: bronze.crm_cust_AZ12'
		TRUNCATE TABLE bronze.erp_CUST_AZ12
		print'Inserted data into bronze.crm_CUST_AZ12'
		BULK INSERT bronze.erp_CUST_AZ12
		FROM 'C:\Users\zulfy\Downloads\sql-data-warehouse-project\sql-data-warehouse-project\datasets\source_erp\CUST_AZ12.csv'
		WITH (
		FIRSTROW = 2,
		FIELDTERMINATOR = ',',
		TABLOCK
		);

    -- Inserting data to crm_loc_A101
		print'.....................'
		print 'Truncated table: bronze.crm_loc_A101'
		TRUNCATE TABLE bronze.erp_LOC_A101
		print'Inserted data into bronze.crm_LOC_A101'
		BULK INSERT bronze.erp_LOC_A101
		FROM 'C:\Users\zulfy\Downloads\sql-data-warehouse-project\sql-data-warehouse-project\datasets\source_erp\LOC_A101.csv'
		WITH (
		FIRSTROW = 2,
		FIELDTERMINATOR = ',',
		TABLOCK
		);

--Inserting data to crm_px_cat_G1V2
		print'.....................'
		print 'Truncated table: bronze.crm_px_cat_G1V2'
		TRUNCATE TABLE bronze.erp_PX_CAT_G1V2
		print'Inserted data into bronze.crm_PX_CAT_G1V2'
		BULK INSERT bronze.erp_PX_CAT_G1V2
		FROM 'C:\Users\zulfy\Downloads\sql-data-warehouse-project\sql-data-warehouse-project\datasets\source_erp\PX_CAT_G1V2.csv'
		WITH (
		FIRSTROW = 2,
		FIELDTERMINATOR = ',',
		TABLOCK
		);
END TRY

  --It will indicate the problem specific to the bronze layer.
BEGIN CATCH
PRINT 'ERROR OCCURED DURING LOADING BRONZE LAYER'
PRINT 'Error Messaage' + ERROR_MESSAGE();
PRINT 'Error Message' + CAST(ERROR_NUMBER() AS NVARCHAR);
PRINT 'Error Message' + CAST( ERROR_STATE() AS NVARCHAR);
END CATCH
END



