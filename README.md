# 📈 Financial Markets Analytics & Risk Dashboard

### Turning Financial Market Data into Actionable Insights

A data analytics project that combines **Python, SQL, MySQL, and Power BI** to explore financial market performance, compare asset classes, and analyze investment risk through interactive dashboards.

The project transforms historical market data into meaningful insights using data cleaning, exploratory data analysis, SQL-based data management, and interactive visualizations.

---

## 🎯 Project Overview

Financial markets generate large volumes of data every trading day. Analyzing this data helps investors understand price movements, compare assets, and evaluate potential risks.

This project builds an end-to-end financial analytics workflow that processes historical market data and presents key performance and risk indicators through an interactive Power BI dashboard.

### Key Objectives

* Analyze historical financial market performance.
* Compare the performance of selected stocks, ETFs, and other assets.
* Evaluate returns and volatility.
* Examine relationships between assets using correlation analysis.
* Visualize daily return distributions to understand market fluctuations.
* Build interactive dashboards that support data-driven exploration.

---

## 🛠️ Tech Stack

| Technology       | Purpose                                            |
| ---------------- | -------------------------------------------------- |
| Python           | Data processing, analysis, and calculations        |
| Pandas & NumPy   | Data cleaning and manipulation                     |
| Jupyter Notebook | Exploratory data analysis and workflow development |
| MySQL            | Structured storage and querying of financial data  |
| SQL              | Data retrieval and analysis                        |
| Power BI         | Interactive dashboards and data visualization      |
| Git & GitHub     | Version control and project documentation          |

---

## 📊 Dashboard Preview

The Power BI report contains three analytical pages.

### 1. Market Overview

Provides a high-level view of market performance through key indicators and historical trends.

**Highlights:**

* Current price
* Return percentage
* Volatility
* Average trading volume
* Growth of an initial $1 investment
* Date-range filtering

### 2. Asset Performance

Enables users to explore and compare the historical performance of individual financial assets.

**Highlights:**

* Asset-level performance analysis
* Historical price trends
* Interactive asset selection
* Time-based exploration

### 3. Risk & Correlation

Explores relationships between assets and provides insights into market risk.

**Highlights:**

* Asset correlation heatmap
* Daily return distribution
* Volatility analysis
* Comparison of relationships between financial instruments

---

## 📁 Project Structure

```text
Financial-markets-dashboard/
│
├── dashboard/
│   ├── finprjct.pbix
│   ├── Market overview.png
│   ├── Asset performance.png
│   └── Risk & Correlation.png
│
├── data/
│   ├── raw/
│   │   └── prices_raw.csv
│   │
│   └── clean/
│       ├── prices_clean.csv
│       ├── performance_summary.csv
│       ├── asset_correlation.csv
│       ├── correlation_matrix.csv
│       └── daily_return_distribution.csv
│
├── notebooks/
│   ├── 01_download_data.ipynb
│   ├── 02_cleaning.ipynb
│   ├── 03_load_mysql.ipynb
│   └── 04_python_analysis.ipynb
│
├── sql/
│   ├── finance.sql
│   ├── finance1.sql
│   └── finance2.sql
│
└── README.md
```

---

## 🔄 Project Workflow

### Step 1: Data Collection

Collected historical financial market data for selected instruments using Python.

### Step 2: Data Cleaning

Processed the raw dataset using Pandas, handled data quality issues, and prepared a clean dataset for analysis.

### Step 3: Database Integration

Loaded structured financial data into MySQL to support organized storage and SQL-based querying.

### Step 4: Exploratory Data Analysis

Analyzed historical prices, returns, volatility, trading volume, and relationships between assets using Python.

### Step 5: Risk & Correlation Analysis

Calculated asset correlations and prepared daily return distribution data to explore relationships and variations in market returns.

### Step 6: Power BI Visualization

Connected the analytical outputs to Power BI and developed interactive dashboards for market overview, asset performance, and risk analysis.

---

## 📈 Dataset & Analytical Scope

The project analyzes eight financial instruments:

| Ticker | Instrument                           |
| ------ | ------------------------------------ |
| AAPL   | Apple Inc.                           |
| AGG    | iShares Core U.S. Aggregate Bond ETF |
| GLD    | SPDR Gold Shares                     |
| JPM    | JPMorgan Chase & Co.                 |
| MSFT   | Microsoft Corporation                |
| QQQ    | Invesco QQQ Trust                    |
| SPY    | SPDR S&P 500 ETF Trust               |
| TLT    | iShares 20+ Year Treasury Bond ETF   |

**Dataset summary:**

* **Total records:** 10,024
* **Financial instruments:** 8
* **Historical period:** October 2021 – September 2026
* **Data frequency:** Daily market data

The dataset includes dates, tickers, opening prices, high prices, low prices, closing prices, and trading volumes.

---

## 🔍 Key Analytical Findings

### Asset Correlation

The correlation analysis identified strong historical relationships between selected instruments:

* **QQQ and SPY:** approximately 0.9503 correlation.
* **AGG and TLT:** approximately 0.9168 correlation.

These values indicate strong positive relationships within the analyzed historical dataset. Correlation measures historical co-movement; it does not establish causation or guarantee future performance.

### Investment Performance & Risk

The dashboards allow users to explore:

* Historical price movements and returns.
* Differences in asset performance.
* Volatility as a measure of price variability.
* Trading activity through average volume.
* Relationships between instruments through correlation analysis.

*These findings describe the analyzed historical period and should not be interpreted as investment advice.*

---

## 💡 Skills Demonstrated

* Data collection and preprocessing
* Exploratory data analysis (EDA)
* Data manipulation with Pandas and NumPy
* SQL querying and relational database integration
* Financial data analysis
* Return and volatility analysis
* Correlation analysis
* Interactive dashboard development
* Data visualization and storytelling
* End-to-end analytics workflow development

---

## 🚀 How to Explore the Project

1. Clone or download this repository.
2. Open the Jupyter notebooks in the `notebooks/` folder to explore the workflow.
3. Review the SQL scripts in the `sql/` folder.
4. Explore the CSV files in `data/clean/` to inspect the processed datasets.
5. Open `dashboard/finprjct.pbix` using Microsoft Power BI Desktop.
6. Review the dashboard screenshots to preview the report.

**Note:** Reproducing the complete workflow may require installing the relevant Python libraries, configuring MySQL, and setting up the appropriate database connection. The Power BI report may also require connection adjustments depending on your environment.

---

## 🔮 Future Improvements

* Integrate automated market data updates.
* Add portfolio-level risk and return metrics.
* Expand asset comparisons and historical analysis.
* Introduce additional financial indicators.
* Improve dashboard usability and reporting.
* Explore machine learning techniques for financial time-series analysis.

---

## 👩‍💻 Author

**Shifa K**
B.E. Computer Science and Engineering
Aspiring Data Analyst | AI/ML Learner

* GitHub: [Shifa2510](https://github.com/Shifa2510)
* Project Repository: [Financial Markets Analytics & Risk Dashboard](https://github.com/Shifa2510/Financial-markets-analytics)

---

⭐ If you find this project interesting, feel free to explore the notebooks, SQL scripts, and dashboard screenshots.
