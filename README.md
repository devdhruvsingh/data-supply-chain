📦 Global Supply Chain & Logistics Intelligence
End-to-End Data Engineering & Business Analytics Pipeline

🚀 Project Overview
This project addresses the complexities of global logistics by analyzing a dataset of 180,519 transactions. The goal was to build a robust pipeline that handles high-volume data cleaning, relational database migration, and multi-layered visualization. By uncovering patterns in shipping delays, fraudulent transactions, and profit leakage, this analysis provides a 360-degree view of supply chain health.

🛠️ Tech Stack
Languages: Python (Pandas, NumPy, OS)

Data Engineering: SQL (PostgreSQL), SQLAlchemy (High-speed Batch Processing)

BI & Visualization: Tableau Desktop, Seaborn, Matplotlib

Environment: Git, Virtual Environments (.venv), GitHub

📋 Key Features & Analysis
1. Data Engineering & ETL (Python)

Encoding & Normalization: Resolved UTF-8/ISO-8859-1 encoding conflicts and standardized 60+ inconsistent column names.

Optimized Migration: Implemented a chunked upload strategy (chunksize=10000) to migrate 180k rows into PostgreSQL without memory overflow.

Feature Engineering:

Created is_late: Binary indicator for deliveries exceeding the scheduled timeframe.

Derived profit_margin_pct: Calculated real-time efficiency per order.

Generated order_year_month: Standardized time series for trend analysis.

2. Relational Database Design (PostgreSQL)

Database Architecture: Migrated flat CSV data into a structured relational environment (supply_chain_analytics).

Advanced Querying: Developed a multi-tier SQL analysis script:

Logistics: Analyzed late delivery rates per Market and Shipping Mode.

Finance: Identified high-revenue categories with negative profit margins.

Strategy: Used Window Functions (RANK(), PARTITION BY) to find top-selling products within every category.

3. Business Intelligence (Tableau)

The interactive dashboard suite focuses on three core pillars:

Logistics Risk Map: A geographic heatmap identifying high-delay clusters (e.g., LATAM and Africa).

Product Profitability Matrix: A quadrant analysis categorizing products into "Stars," "Loss Leaders," and "Niche" items.

Shipping Distribution: Box-and-Whisker plots showing the variance between 'Scheduled' and 'Real' shipping days to identify carrier unreliability.

Fraud Monitoring: A dedicated view for SUSPECTED_FRAUD status filtered by region and category.

📁 Repository Structure
notebooks/: supply_chain_cleaning.ipynb — Data cleaning, EDA, and SQLAlchemy ETL script.

sql_queries/: analysis_queries.sql — Organized Easy, Medium, and Hard SQL business questions.

tableau/: Contains the .twbx workbook and dashboard screenshots.

requirements.txt: List of Python libraries (Pandas, Psycopg2, etc.) for replication.

.gitignore: Configured to exclude venv/, .env, and local caches.

📊 Key Findings & Business Impact
Delivery Bottlenecks: Found that "First Class" shipping has a 45% late rate in specific regions, suggesting a failure in premium service fulfillment.

Fraud Hotspots: Concentrated fraud spikes were detected in the Technology category for international orders, recommending stricter verification for those segments.

Profitability: Identified that certain high-sale products actually decreased overall net profit due to unsustainable shipping costs.

⚙️ How to Run
Clone the repo: git clone <repo-url>

Setup Environment:

Bash
python -m venv .venv
source .venv/bin/activate  # Windows: .venv\Scripts\activate
pip install -r requirements.txt
Run ETL Pipeline: Open the Jupyter notebook and run all cells to clean data and push it to your PostgreSQL server.

Execute SQL: Run sql_queries/analysis_queries.sql in pgAdmin to generate the data for reports.

Tableau: Open the file in the /tableau folder to view the interactive story.

Pro-Tips for your Portfolio:

Requirement File: Create a text file named requirements.txt in your folder and paste these:

Plaintext
pandas
numpy
sqlalchemy
psycopg2-binary
matplotlib
seaborn
