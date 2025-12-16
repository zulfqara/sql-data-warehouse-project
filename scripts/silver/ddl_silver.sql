--==========================================
-- Layer   : silver
-- Purpose : Raw ingestion tables (CRM & ERP)
--==========================================

create table silver.crm_cust_info (
cst_id INT,
cst_key Nvarchar(50),
cst_firstname Nvarchar(50),
cst_lastname Nvarchar(50),
cst_material Nvarchar(50),
cst_gndr Nvarchar(50),
cst_create_date date,
--DEFAULT means: if no value is provided when inserting, SQL Server will automatically fill it.
dwh_create_date DATETIME2 DEFAULT GETDATE()
);
Go
create table silver.crm_prd_info(
prd_id int,
prd_key nvarchar(50),
prd_nm nvarchar(50),
prd_cost varchar(50),
prd_line nvarchar(50),
prd_start DATE,
prd_end_dt DATE,
dwh_create_date DATETIME2 DEFAULT GETDATE()
)
Go

create table silver.crm_sales_details(
sls_ord_num nvarchar(50),
sls_prd_key nvarchar(50),
sls_cust_id nvarchar(50),
sls_order_dt INT,
sls_ship_dt DATE,
sls_due_dt DATE,
sls_sales INT,
sls_quantity INT,
sls_price INT,
dwh_create_date DATETIME2 DEFAULT GETDATE()
)
--Here the CRM part has ended.s
Go

--Creating tables for the ERP files.
create table silver.erp_CUST_AZ12 (
CID nvarchar(50),
BDATE DATE,
GEN NVARCHAR(50),
dwh_create_date DATETIME2 DEFAULT GETDATE()
)
GO

Create table silver.erp_LOC_A101(
CID NVARCHAR(50),
CNTRY NVARCHAR(50),
dwh_create_date DATETIME2 DEFAULT GETDATE()
)
GO
create table silver.erp_PX_CAT_G1V2(
ID NVARCHAR(50),
CAT NVARCHAR(50),
SUBCAT NVARCHAR(50),
MAINTENANCE NVARCHAR(50),
dwh_create_date DATETIME2 DEFAULT GETDATE()
)
