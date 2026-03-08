# 🏗️ SQL Data Warehouse – Sales Analytics

A production-grade data warehouse built with SQL Server, implementing a **Bronze → Silver → Gold** pipeline architecture for end-to-end sales analytics.

---

## 📌 Project Overview

This project demonstrates the design and implementation of a modern SQL-based Data Warehouse for sales analytics. It integrates data from two source systems (CRM and ERP), processes it through a multi-layer transformation pipeline, and delivers clean analytical datasets for business reporting.

---

## 🏛️ Architecture

The warehouse follows a three-layer medallion architecture:

![Data Warehouse Architecture](docs/data_warehouse.png)

---

## 📂 Project Structure

```
sql_warehouse_learning/
│
├── datasets/
│   ├── source_crm/               # CRM source files
│   │   ├── cust_info.csv
│   │   ├── prd_info.csv
│   │   └── sales_details.csv
│   │
│   └── source_erp/               # ERP source files
│       ├── CUST_AZ12.csv
│       ├── LOC_A101.csv
│       └── PX_CAT_G1V2.csv
│
├── scripts/
│   ├── init.database.sql         # Database initialization
│   │
│   ├── bronze/
│   │   ├── ddl_bronze.sql        # Table definitions
│   │   └── proc_load_bronze.sql  # Load procedure
│   │
│   ├── silver/
│   │   ├── ddl_silver.sql        # Table definitions
│   │   └── proc_load_silver.sql  # Transform & load procedure
│   │
│   └── gold/
│       ├── ddl_gold.sql          # Star schema definitions
│       └── reporting_views.sql   # Pre-built analytical views
│
├── queries/
│   ├── basic_sales_metrics.sql
│   ├── customer_analysis.sql
│   ├── product_analysis.sql
│   └── time_analysis.sql
│
├── tests/
│   ├── check_silver.sql          # Silver layer data quality tests
│   └── check_gold.sql            # Gold layer validation tests
│
└── docs/
    ├── dataflow.png
    ├── star_schema.png
    └── business_questions.md
```

---

## 📊 Data Sources

### CRM System (`datasets/source_crm/`)
| File | Description |
|---|---|
| `cust_info.csv` | Customer master data |
| `prd_info.csv` | Product catalog |
| `sales_details.csv` | Sales transactions |

### ERP System (`datasets/source_erp/`)
| File | Description |
|---|---|
| `CUST_AZ12.csv` | ERP customer records |
| `LOC_A101.csv` | Location / geography data |
| `PX_CAT_G1V2.csv` | Product category mappings |

---

## 🌟 Data Model (Star Schema)

The Gold layer is modeled as a **Star Schema** for optimized analytical querying:

```
                    ┌──────────────┐
                    │  dim_date    │
                    └──────┬───────┘
                           │
┌──────────────┐    ┌──────┴───────┐    ┌──────────────┐
│ dim_customers│────│  fact_sales  │────│ dim_products │
└──────────────┘    └─────────────┘    └──────────────┘
```

| Table | Type | Description |
|---|---|---|
| `fact_sales` | Fact | Core sales transactions |
| `dim_customers` | Dimension | Customer attributes |
| `dim_products` | Dimension | Product attributes |
| `dim_date` | Dimension | Date/time hierarchy |

---

## 📈 Analytics Queries

Pre-built queries covering four analytical domains:

**Sales Metrics** (`basic_sales_metrics.sql`)
- Total revenue and order counts
- Average order value
- Sales trends over time

**Customer Analysis** (`customer_analysis.sql`)
- Top customers by revenue
- Purchase frequency and behavior
- Customer segmentation

**Product Analysis** (`product_analysis.sql`)
- Best-selling products
- Revenue contribution by category
- Product performance rankings

**Time Analysis** (`time_analysis.sql`)
- Monthly and quarterly trends
- Seasonal sales patterns
- Year-over-year comparisons

---

## 🚀 How to Run

Follow these steps in order:

```bash
# 1. Initialize the database
scripts/init.database.sql

# 2. Load raw data into Bronze layer
scripts/bronze/proc_load_bronze.sql

# 3. Clean and transform into Silver layer
scripts/silver/proc_load_silver.sql

# 4. Build the Gold analytics layer
scripts/gold/ddl_gold.sql
```

After setup, run queries from the `queries/` directory or connect Power BI to the Gold layer views.

---

## ✅ Data Quality Testing

Tests are located in the `tests/` directory:

| Test File | Scope |
|---|---|
| `check_silver.sql` | Validates cleaning, type consistency, null checks |
| `check_gold.sql` | Validates star schema integrity and business logic |

---

## 🛠️ Technologies Used

- **SQL Server** – Database engine
- **T-SQL** – Stored procedures and transformations
- **Power BI** – Dashboard and reporting layer
- **Star Schema** – Gold layer data modeling
- **Medallion Architecture** – Bronze / Silver / Gold pipeline

---

## 🔮 Future Improvements

- [ ] Automated ETL scheduling (SQL Server Agent / Azure Data Factory)
- [ ] Expanded analytical datasets (returns, inventory, forecasting)
- [ ] Embedded Power BI dashboards
- [ ] Data quality monitoring and alerting
- [ ] Incremental load support for large datasets

---

## 💡 Key Skills Demonstrated

| Area | Detail |
|---|---|
| Data Warehouse Design | Medallion architecture, layer separation |
| ETL Development | Stored procedures, incremental loading |
| Data Modeling | Star schema with fact and dimension tables |
| SQL Transformation | Cleaning, deduplication, type standardization |
| Analytical Querying | Metrics, segmentation, trend analysis |
| Data Quality | Automated test scripts per layer |
