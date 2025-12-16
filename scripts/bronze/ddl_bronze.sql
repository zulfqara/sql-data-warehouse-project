--==========================================
/*Purpose:
    Create tables for the bronze-layer.

Description:
    - To store the loaded data from the csv files.
    - Used as a source for silver layer to transform and clean the raw data*/
--==========================================

create table bronze.crm_cust_info (
    cst_id INT,
    cst_key Nvarchar(50),
    cst_firstname Nvarchar(50),
    cst_lastname Nvarchar(50),
    cst_material Nvarchar(50),
    cst_gndr Nvarchar(50),
    cst_create_date date
);
Go
create table bronze.crm_prd_info(
    prd_id int,
    prd_key nvarchar(50),
    prd_nm nvarchar(50),
    prd_cost varchar(50),
    prd_line nvarchar(50),
    prd_start DATE,
    prd_end_dt DATE
)
Go

create table bronze.crm_sales_details(
    sls_ord_num nvarchar(50),
    sls_prd_key nvarchar(50),
    sls_cust_id nvarchar(50),
    sls_order_dt INT,
    sls_ship_dt DATE,
    sls_due_dt DATE,
    sls_sales INT,
    sls_quantity INT,
    sls_price INT
)
--Here the CRM part has ended.
Go

--Creating tables for the ERP files.
create table bronze.erp_CUST_AZ12 (
    CID nvarchar(50),
    BDATE DATE,
    GEN NVARCHAR(50)
)
GO

Create table bronze.erp_LOC_A101(
    CID NVARCHAR(50),
    CNTRY NVARCHAR(50)
)
GO
create table bronze.erp_PX_CAT_G1V2(
    ID NVARCHAR(50),
    CAT NVARCHAR(50),
    SUBCAT NVARCHAR(50),
    MAINTENANCE NVARCHAR(50)
)



