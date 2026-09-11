# E-Commerce Sales & Customer Analytics

## 📊 Project Overview

This project analyzes e-commerce sales, customer behavior, product
performance, and delivery performance using **PostgreSQL and Microsoft
Power BI**.

The objective was to transform raw e-commerce data into an interactive
dashboard and identify actionable business insights related to revenue,
customers, products, geography, order fulfillment, and delivery
performance.

## 🎯 Business Objectives

-   Analyze revenue, orders, customers, and average order value.
-   Identify the states contributing the most revenue and customers.
-   Identify the highest-revenue product categories.
-   Analyze repeat versus one-time customers.
-   Measure customer activity over time.
-   Evaluate order fulfillment and delivery performance.
-   Identify important sales trends and periods of high activity.

## 🛠️ Tools & Technologies

-   **PostgreSQL** --- data cleaning, validation, joins, aggregations,
    and SQL analysis
-   **Power BI** --- data modeling, DAX measures, interactive
    dashboards, and visualization
-   **DAX** --- KPI calculations and customer/order analysis
-   **CSV/Excel** --- source data preparation and product data import

## 📁 Dataset

The project uses the **Brazilian E-Commerce Public Dataset by Olist**.

Main tables used:

-   customers
-   orders
-   order_items
-   products

The main customer/order/order-item data was analyzed through PostgreSQL,
while the product data was also loaded from CSV into Power BI.

## 🔄 Project Workflow

Raw E-Commerce Data
        ↓
Data Cleaning & Quality Checks
        ↓
PostgreSQL
        ↓
JOINs & SQL Analysis
        ↓
Power BI Data Model
        ↓
DAX Measures
        ↓
Interactive Dashboard
        ↓
Business Insights


## 🧹 Data Preparation

Data-quality checks included:

-   Identifying duplicate records
-   Checking missing/null values
-   Reviewing key identifiers
-   Joining related tables using appropriate keys
-   Validating the resulting datasets before visualization

Core Power BI relationships:


customers
    1
    |
    *
orders
    1
    |
    *
order_items


The product table was connected through `product_id`.

## 🔗 SQL Analysis

PostgreSQL was used for exploratory analysis and validation.

Analysis included:

-   Total orders
-   Total unique customers
-   Product revenue
-   Average order value
-   Repeat customer rate
-   Revenue by customer state
-   Revenue per customer
-   Revenue by product category
-   Order-status distribution
-   Average delivery time
-   Late delivery rate
-   Average delay for late orders
-   Monthly revenue
-   Month-over-month revenue growth

SQL results were compared with Power BI measures to validate the
dashboard.

## 📐 Key DAX Metrics

The Power BI report includes:

-   **Total Customers**
-   **Total Orders**
-   **Product Revenue**
-   **Average Order Value**
-   **Orders per Customer**
-   **Repeat Customer Rate**
-   **Average Delivery Days**
-   **Average Delivery Delay**
-   **Late Delivery Rate**
-   **Monthly Active Customers**

# 📊 Dashboard

## Page 1 --- Executive Overview

Provides an overall view of:

-   Revenue and order KPIs
-   Revenue trend over time
-   Order-status distribution
-   Top product categories
-   Revenue by customer state
-   Top-performing states

**Business question:** How is the e-commerce business performing
overall?

## Page 2 --- Customer & Order Analysis

Focuses on:

-   Customer count
-   Orders per customer
-   Average order value
-   Repeat customer rate
-   Top states by customer count
-   Monthly active customers
-   Repeat versus one-time customers
-   Average delivery time by state
-   Average delivery delay
-   Late delivery rate

**Business question:** Who are the customers, how do they purchase, and
how is delivery performing?

# 💡 Key Business Insights

### 1. São Paulo is the dominant market

São Paulo generated approximately **R\$5.20M** in product revenue and
had nearly **40K customers**, making it the strongest market by revenue
and customer volume.

### 2. Repeat purchasing is relatively low

Only approximately **3.1% of customers were repeat customers**, while
the average was around **1.03 orders per customer**. This suggests an
opportunity to improve customer retention and repeat purchases.

### 3. Beauty & Health leads product revenue

The `beleza_saude` category generated approximately **R\$1.26M**, making
it the highest-revenue product category in the analysis.

### 4. Overall order fulfillment is strong

Approximately **97.02% of orders were delivered**, indicating a high
overall delivery completion rate.

### 5. Late deliveries remain an operational opportunity

Approximately **8.12% of orders were delivered after the estimated
delivery date**. Late orders averaged approximately **8.87 days of
delay**.

### 6. Revenue grew significantly through 2017

Monthly revenue increased from approximately **R\$120K in January 2017
to more than R\$500K by May 2017**, followed by several months
approaching or exceeding R\$1M during 2018.

### 7. Revenue and revenue per customer tell different stories

São Paulo dominates total revenue largely because of its much larger
customer base. Some smaller states showed higher revenue per customer,
but these results should be interpreted cautiously because of smaller
customer populations.

## 📈 Analytical Considerations

Very large month-over-month growth percentages appeared when a month
with extremely low revenue was used as the comparison period. For
example, December 2016 had only a very small amount of recorded revenue.

Therefore, the unusually large January 2017 percentage increase was
treated as a **low-base anomaly**, rather than being presented as
meaningful business growth.

This demonstrates the importance of considering **data volume and
context when interpreting percentage-based metrics**.
