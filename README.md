# Bank Marketing Analysis | SQL, Python & Power BI

## Project Overview

This project analyzes a bank's direct marketing campaign data to understand customer subscription behaviour and evaluate campaign effectiveness.

The objective is to identify customer segments with higher term-deposit subscription rates, evaluate campaign performance, and derive actionable insights that can support data-driven marketing decisions.

The analysis uses 45,211 customer records from the UCI Bank Marketing dataset.

## Business Objectives

- Measure overall customer subscription performance.
- Identify customer segments with higher subscription rates.
- Analyze the relationship between customer demographics and subscription behaviour.
- Evaluate the effectiveness of contact methods and campaign frequency.
- Examine the outcomes of previous marketing campaigns.
- Build an interactive dashboard for business reporting.

## Tools & Technologies

- **Python:** Data preparation and cleaning.
- **MySQL:** Data storage, querying, aggregation and analysis.
- **Power BI:** Interactive dashboards, KPIs, DAX measures and visual reporting.
- **Excel/CSV:** Dataset handling.

## Dataset

**Source:** UCI Machine Learning Repository — Bank Marketing Dataset.

The dataset contains information about customers of a Portuguese banking institution and its telephone-based marketing campaigns.

- Records: 45,211
- Original attributes: 16 input variables and 1 target variable
- Target variable: `y` (whether the customer subscribed to a term deposit)

Source: https://archive.ics.uci.edu/dataset/222/bank+marketing

Dataset citation: Moro, S., Rita, P., & Cortez, P. (2014). *Bank Marketing*. UCI Machine Learning Repository. DOI: 10.24432/C5K306.

## Project Workflow

1. **Data Preparation:** Prepared the dataset for analysis and reporting.
2. **SQL Analysis:** Loaded the data into MySQL and performed customer, subscription and campaign analysis.
3. **Exploratory Analysis:** Compared subscription rates across demographic and campaign-related categories.
4. **Dashboard Development:** Built a three-page Power BI dashboard with KPI cards, charts and synchronized month filtering.
5. **Business Insights:** Interpreted the results and identified potential opportunities to improve campaign performance.

## Key Performance Indicators

| KPI | Result |
|---|---:|
| Total Customers | 45,211 |
| Subscribed Customers | 5,289 |
| Unsubscribed Customers | 39,922 |
| Overall Subscription Rate | 11.70% |

## Key Findings

### Customer Analysis
- Students recorded a subscription rate of 28.68%.
- Retired customers recorded a subscription rate of 22.79%.
- Single customers recorded a subscription rate of 14.95%.
- Customers with tertiary education recorded a subscription rate of 15.01%.

### Campaign Effectiveness
- Cellular contact recorded a subscription rate of 14.92%.
- Customers with a successful previous campaign outcome recorded a subscription rate of 64.73%.
- Customers contacted once during the current campaign recorded a subscription rate of 14.60%.
- Subscription rates declined as the number of contacts during the current campaign increased.

### Customer Financial and Loan Characteristics
- Customers without housing or personal loans recorded an 18.22% subscription rate.
- Customers with both housing and personal loans recorded a 6.07% subscription rate.

## Power BI Dashboard

The report contains three pages:

1. **Campaign Overview:** Overall KPIs, monthly subscription rates and monthly subscription volumes.
2. **Customer Analysis:** Subscription rates by age group, marital status, occupation, education and existing loan status.
3. **Campaign Effectiveness:** Subscription rates by contact method, previous campaign outcome and contact frequency.

The report includes synchronized month filtering across all three pages.

## Business Recommendations

- Evaluate customer segments with higher observed subscription rates for future campaign planning.
- Investigate the effectiveness of cellular communication compared with other contact methods.
- Use previous campaign outcomes as an input when reviewing customer engagement strategies.
- Review repeated-contact strategies, as observed subscription rates decrease with higher contact frequency.
- Monitor campaign performance using consistent KPIs and interactive reporting.

## Important Analytical Considerations

The findings describe associations in the historical dataset and do not establish causation.

Call duration is recorded after the call and should not be treated as a pre-call targeting variable. The analysis is descriptive and does not claim to be a predictive machine learning model.

## Project Deliverables

- MySQL analysis scripts
- Prepared dataset
- Power BI report
- Dashboard screenshots
- Project documentation

## Author

Data Analyst Portfolio Project