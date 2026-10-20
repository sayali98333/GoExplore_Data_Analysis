# GoExplore: Self-Service Sales Analytics Dashboard

An end-to-end analytics project that takes raw CSV sales data through Google Sheets and BigQuery into an interactive Data Studio (Looker Studio) dashboard for GoExplore's CEO and department heads.

**Dashboard preview:** The full report is available as a PDF The full report is available as a PDF [Data_Studio_Reporti.pdf](Data_Studio_Reporti.pdf)
GoExplore is a camping and hiking supplier operating across 21 markets, with 289 retailers and 149,257 transactions.

The goal is a self-service dashboard that lets the CEO (Sabah) and department heads explore revenue, units sold, retailer performance and expansion options without writing any SQL.

## Tech Stack

| Tool | Purpose |
|---|---|
| Google Sheets | Data exploration and BigQuery connection |
| Google BigQuery | Data warehouse and SQL |
| SQL | Joins and KPI calculation |
| Google Data Studio (Looker Studio) | Interactive dashboard |

## Data Pipeline

### Stage 1: Google Sheets (data exploration)

- Uploaded the 4 raw CSV files, explored columns and structure, and identified key business questions
- Mapped the relationships between tables
- Connected Google Sheets to BigQuery

| File | Rows | Description |
|---|---|---|
| GoExplore_daily_sales.csv | 149,257 | All sales transactions |
| GoExplore_products.csv | 244 | Product catalogue |
| GoExplore_retailers.csv | 289 | Retailer information |
| GoExplore_methods.csv | 7 | Order method types |

**Table relationships**

- `daily_sales` → Products via `Product number`
- `daily_sales` → Retailers via `Retailer code`
- `daily_sales` → Methods via `Order method code`

### Stage 2: BigQuery (data warehouse and SQL)

- Created the dataset `goexplore` and loaded all 4 tables
- Wrote analytical queries on products, retailers and countries
- Built the dashboard query `retailer_product_dashboard`, which feeds the dashboard

| Table | Rows | Key columns |
|---|---|---|
| daily_sales | 149,257 | Date, Quantity, Unit sale price |
| Products | 244 | Product line, Product type, Product brand |
| Retailers | 289 | Retailer name, Type, Country |
| methods | 7 | Order method type |


**Metrics calculated**

| Metric | Field | Definition |
|---|---|---|
| Revenue | `revenue` | SUM of Quantity × Unit sale price |
| Units sold | `units_sold` | SUM of Quantity |
| Average selling price | `average_selling_price` | Revenue ÷ units sold |

### Stage 3: Data Studio dashboard

- Connected the BigQuery query to Data Studio
- Built 3 pages for different stakeholders
- Added date, retailer type and country filters, scorecards, bar and donut charts, a country revenue map and ranked tables

## Dashboard Pages

| Page | Audience | Content |
|---|---|---|
| Executive Overview | CEO | Revenue, units sold, selling price, revenue and units by country, average selling price by country, revenue map, product share |
| Retailer & Product Performance | Head of Retail | Revenue and revenue per store by retailer type, revenue by product line, top products, filters |
| Market Expansion Readiness | Leadership | Screening of four European markets with ranking and recommendation |

## Dashboard Data

### Page 1: Executive Overview

| Metric | Value |
|---|---|
| Revenue | 1.3bn |
| Units sold | 19.8m |
| Average selling price | 63.22 € (revenue ÷ units) |

**Revenue and units sold by country (top 9 by revenue):** United States, United Kingdom, Germany, Korea, Canada, Switzerland, Japan, Mexico, Netherlands. The United States leads at 197.2m revenue, the highest on the country map (lowest: 5.7m).

**Highest average selling price by country:** Singapore, Brazil, Spain, Belgium, China, Netherlands, Mexico, Switzerland, Italy.

**Product share of revenue:** Hailstorm 20.9%, Star 8.1%, Epoch 7.7%, followed by Canyon Mule, Extreme, Relax, Granite, Xray and Trakker (4–7% each). Others: 30.6%.

**Product share of units sold:** Granite 11.9%, TrailChef 9.3%, Relax 8.5%, Course Pro 8.2%, Firefly 7.3%, followed by Sun, Trakker, Extreme and BugShield (about 5% each). Others: 35.5%.

### Page 2: Retailer & Product Performance

**Filters:** date range (24 Aug 2015 – 11 Jul 2017), retailer type, country

| Metric | Value |
|---|---|
| Average selling price | 63.22 € |
| Active stores | 289 |

**Retailer revenue and store performance**

| Retailer type | Revenue | Avg. revenue per store |
|---|---|---|
| Department Store | 433.7m | 11.41m € |
| Outdoors Shop | 324.2m | 3.56m € |
| Golf Shop | 221.3m | 6.71m € |
| Sports Store | 148.8m | 1.91m € |
| Warehouse Store | 69m | 5.31m € |
| Eyewear Store | 53.6m | 2.23m € |
| Direct Marketing | 829.1k | 69.09k € |

**Revenue by product line (highest to lowest):** Personal Accessories, Camping Equipment, Golf Equipment, Mountaineering Equipment, Outdoor Protection.

**Top products by revenue**

| Product | Product line | Revenue | Units sold | Avg. selling price |
|---|---|---|---|---|
| Hailstorm Titanium Woods | Golf Equipment | 56,751,799 | 47,535 | 1,193.90 |
| TX | Personal Accessories | 49,911,739 | 260,804 | 191.38 |
| Star Lite | Camping Equipment | 46,460,916 | 132,201 | 351.44 |
| Hailstorm Titanium Irons | Golf Equipment | 44,250,743 | 51,509 | 859.09 |
| Hailstorm Steel Woods | Golf Equipment | 37,309,869 | 53,373 | 699.04 |

### Page 3: Market Expansion Readiness

Screening of four potential European expansion markets using population and GDP per capita.

| Metric | Czech Republic | Poland | Portugal | Norway |
|---|---|---|---|---|
| Population | 10.5M | 38M | 10.3M | 5.4M |
| GDP per capita | €25.2K | €18.9K | €24.3K | €80.1K |
| Market screening score | 66.7 | 50.0 | 33.3 | 50.0 |

**Ranking:** 1. Czech Republic (66.7), 2. Poland (50.0), 3. Norway (50.0), 4. Portugal (33.3)

**Score:** 50% population + 50% GDP per capita. It is a simple screening indicator and does not measure actual hiking-equipment demand.

**Recommendation:** Czech Republic ranks highest on the combination of population and GDP per capita. Poland offers the largest population, while Norway has by far the highest purchasing power but a smaller customer base.

## Key Insights

- The United States is the top market at about 197m revenue.
- Personal Accessories is the largest product line by revenue.
- Department Stores generate the most revenue (433.7m) and the highest revenue per store (11.41m €).
- Golf Equipment takes 3 of the top 5 products by revenue.
- Hailstorm accounts for 20.9% of product revenue, and Granite leads in units sold (11.9%).
- In the expansion screening, Czech Republic ranks first, Poland has the largest population and Norway the highest GDP per capita.

## Business Goals

- Track revenue, units sold and average selling price
- Identify top-performing products, retailers and markets
- Evaluate European expansion candidates
- Let non-technical users explore the data on their own

## What I Learned

- Joining multiple tables in SQL and calculating business metrics
- Debugging BigQuery errors (project, location and table-name case sensitivity)
- Building interactive dashboards for different stakeholders
- Using external data (population and GDP per capita) for a market screening
- Starting with business questions before building charts
