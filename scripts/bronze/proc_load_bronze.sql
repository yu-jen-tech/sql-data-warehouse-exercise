CREATE OR ALTER PROCEDURE bronze.load_bronze AS
BEGIN
	RAISERROR('----------Loading Bronze Layer----------', 0, 1) WITH NOWAIT;
	RAISERROR('----------Loading CRM Tables----------', 0, 1) WITH NOWAIT;
	

	RAISERROR('Truncating Table: bronze.crm_cust_info...', 0, 1) WITH NOWAIT;
	TRUNCATE TABLE bronze.crm_cust_info;

	RAISERROR('Inserting Data Into: bronze.crm_cust_info...', 0, 1) WITH NOWAIT;
	BULK INSERT bronze.crm_cust_info
	FROM '/var/importdata/source_crm/cust_info.csv'
	WITH (
		FIRSTROW = 2,
		FIELDTERMINATOR = ',',
		TABLOCK
	);


	RAISERROR('Truncating Table: bronze.crm_prd_info...', 0, 1) WITH NOWAIT;
	TRUNCATE TABLE bronze.crm_prd_info;

	RAISERROR('Inserting Data Into: bronze.crm_prd_info...', 0, 1) WITH NOWAIT;
	BULK INSERT bronze.crm_prd_info
	FROM '/var/importdata/source_crm/prd_info.csv'
	WITH (
		FIRSTROW = 2,
		FIELDTERMINATOR = ',',
		TABLOCK
	);


	RAISERROR('Truncating Table: bronze.crm_sales_details...', 0, 1) WITH NOWAIT;
	TRUNCATE TABLE bronze.crm_sales_details;

	RAISERROR('Inserting Data Into: bronze.crm_sales_details...', 0, 1) WITH NOWAIT;
	BULK INSERT bronze.crm_sales_details
	FROM '/var/importdata/source_crm/sales_details.csv'
	WITH (
		FIRSTROW = 2,
		FIELDTERMINATOR = ',',
		TABLOCK
	);


	RAISERROR('----------Loading ERP Tables----------', 0, 1) WITH NOWAIT;


	RAISERROR('Truncating Table: bronze.erp_cust_az12...', 0, 1) WITH NOWAIT;
	TRUNCATE TABLE bronze.erp_cust_az12;

	RAISERROR('Inserting Data Into: bronze.erp_cust_az12...', 0, 1) WITH NOWAIT;
	BULK INSERT bronze.erp_cust_az12
	FROM '/var/importdata/source_erp/CUST_AZ12.csv'
	WITH (
		FIRSTROW = 2,
		FIELDTERMINATOR = ',',
		TABLOCK
	);


	RAISERROR('Truncating Table: bronze.erp_loc_a101...', 0, 1) WITH NOWAIT;
	TRUNCATE TABLE bronze.erp_loc_a101;

	RAISERROR('Inserting Data Into: bronze.erp_loc_a101...', 0, 1) WITH NOWAIT;
	BULK INSERT bronze.erp_loc_a101
	FROM '/var/importdata/source_erp/LOC_A101.csv'
	WITH (
		FIRSTROW = 2,
		FIELDTERMINATOR = ',',
		TABLOCK
	);


	RAISERROR('Truncating Table: bronze.erp_px_cat_g1v2...', 0, 1) WITH NOWAIT;
	TRUNCATE TABLE bronze.erp_px_cat_g1v2;

	RAISERROR('Inserting Data Into: bronze.erp_px_cat_g1v2...', 0, 1) WITH NOWAIT;
	BULK INSERT bronze.erp_px_cat_g1v2
	FROM '/var/importdata/source_erp/PX_CAT_G1V2.csv'
	WITH (
		FIRSTROW = 2,
		FIELDTERMINATOR = ',',
		TABLOCK
	);
END

