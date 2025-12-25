# sql-data-warehouse-project
Modern Data Warehouse with SQL Server (Learning Project)
 Project Overview:
  This is a learning-focused project aimed and was a part of the SQL course on Udemy with "Data with Baraa" at understanding how to design and build a modern data warehouse using SQL Server.
  The project covers core data warehousing concepts, including ETL processes, data modeling, and analytics, using hands-on SQL development.

The goal is to gain practical experience with real-world data warehouse architectures rather than to build a production-ready system.

Learning Objectives:
  Understand data warehouse architecture (Bronze, Silver, Gold layers)
  Implement ETL pipelines using SQL
  Design dimension and fact tables using a star schema
  Perform data transformations and cleansing
  Write analytical SQL queries for reporting and insights

Architecture Overview
  The project follows a layered data warehouse architecture:

🔹 Bronze Layer

  Raw data ingestion
  Minimal transformations
  Source-system aligned structure

🔹 Silver Layer

  Cleaned and standardized data
  Data quality checks
  Business logic applied

🔹 Gold Layer

  Final fact and dimension tables
  Star schema design
  Optimized for analytics and reporting

 Tools & Technologies:

  SQL Server
  TSQL
  SQL Server Management Studio (SSMS)

Data Modeling:
  Star schema design
  Fact tables for transactional data
  Dimension tables for descriptive attributes
  Surrogate keys and relationships

ETL Process:
  Data extraction from source tables
  Transformation using SQL (joins, aggregations, date functions)
  Loading data into Silver and Gold layers
  Use of views for analytical access

Analytics & Reporting:

  Aggregations and KPIs
  Window functions
  Date-based analysis
  Customer and product-level insights

 Project Structure
    /bronze
    /silver
    /gold
    /scripts

Key Learnings:
  Practical understanding of data warehouse concepts
  Writing efficient and readable SQL queries
  Importance of schema design for analytics
  Handling real-world SQL challenges (joins, aliases, date functions)

