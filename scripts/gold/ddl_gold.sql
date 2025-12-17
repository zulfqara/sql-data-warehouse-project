/*
..................................................................................
 Purpose: Create Gold Layer Views

Description:
    This script defines views for the Gold layer of the data warehouse.
    The Gold layer contains the final dimension and fact views structured
    according to a Star Schema.

 Each view applies necessary transformations and integrates data from
 the Silver layer to deliver a refined, enriched, and analytics-ready dataset.

Use:
 These views are intended for direct use in reporting and analytical queries.
..................................................................................
*/


-- Create View Dimension: gold.dim_customers

create view gold.dim_customers as 
select 
  row_number() over(order by cst_id) as customer_key,
  ci.cst_id as customer_Id,
  ci.cst_key as customer_number,
  ci.cst_firstname as first_name,
  ci.cst_lastname as last_name, 
  loc.cntry as country,
  ci.cst_material as martial_status,
case 
  when ci.cst_gndr != 'n/a' then ci.cst_gndr 
  else coalesce(caz.gen,'n/a')
  end as gender,
caz.bdate as birthday,
ci.cst_create_date as create_date

from silver.crm_cust_info as ci
left join silver.erp_CUST_AZ12 as caz
  on ci.cst_key = caz.cid
left join silver.erp_LOC_A101 as loc
  ON ci.cst_key = loc.cid
GO


-- Create View Dimension: gold.dim_products

create view gold.dim_products as
select  
  row_number() over(order by prd_Key) as product_key,
	pr.prd_id as product_id,
	pr.prd_key as product_number,
	pr.prd_nm product_name,
	pr.cat_id as category_id ,
	px.cat as category,
	px.subcat as subcategory,
	px.maintenance,
	pr.prd_cost as cost,
	pr.prd_line as product_line,
	pr.prd_start as start_date
	
from silver.crm_prd_info pr
	left join silver.erp_PX_CAT_G1V2 as px
	on pr.cat_id = px.id
where prd_end is null
GO


-- Create Fact view: gold.fact_sales

create view gold.fact_sales as
select 
	sd.sls_ord_num as order_number,
	pr.product_key,
	cu.customer_key,
	sd.sls_order_dt as order_date,
	sd.sls_ship_dt as ship_date,
	sd.sls_due_dt as due_date,
	sd.sls_sales as sale_amount,
	sd.sls_quantity as quantity,
	sd.sls_price as price
	from silver.crm_sales_details as sd
	left join gold.dim_products  AS pr
	on sd.sls_prd_key = pr.product_number
	left join gold.dim_customers as cu
	on sd.sls_cust_id= cu.customer_id
