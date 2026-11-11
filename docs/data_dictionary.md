# Data Dictionary — Bank Marketing Analysis

## 1. Dataset Overview

| Attribute | Description |
|---|---|
| Dataset | UCI Bank Marketing Dataset |
| Total Records | 45,211 |
| Original Variables | 17 |
| Target Variable | `y` |
| Target Description | Whether a customer subscribed to a term deposit |
| Data Format | CSV |
| Database | MySQL |
| Visualization | Power BI |

## 2. Original Dataset Columns

| Column | Data Type | Description |
|---|---|---|
| `age` | Integer | Age of the customer in years |
| `job` | Categorical | Customer's occupation |
| `marital` | Categorical | Marital status |
| `education` | Categorical | Education qualification |
| `default_status` | Categorical | Whether the customer has credit in default; renamed from the original `default` field |
| `balance` | Integer | Average yearly account balance in euros |
| `housing` | Categorical | Whether the customer has a housing loan |
| `loan` | Categorical | Whether the customer has a personal loan |
| `contact` | Categorical | Communication contact type |
| `day` | Integer | Last contact day of the month |
| `month` | Categorical | Last contact month |
| `duration` | Integer | Last contact duration in seconds |
| `campaign` | Integer | Number of contacts performed during the current campaign for this customer |
| `pdays` | Integer | Days since the customer was last contacted in a previous campaign; -1 in this prepared dataset represents no previous contact |
| `previous` | Integer | Number of contacts performed before the current campaign |
| `poutcome` | Categorical | Outcome of the previous marketing campaign |
| `y` | Categorical | Whether the customer subscribed to a term deposit (`yes` or `no`) |

## 3. Derived and Calculated Fields

The following fields were added or calculated during data preparation and Power BI development.

| Field | Type | Purpose |
|---|---|---|
| `age_group` / `Age Group` | Categorical | Groups customers into age ranges |
| `Contact Frequency Group` | Categorical | Groups customers according to the number of campaign contacts |
| `Contact Frequency Sort` | Integer | Controls the correct display order of contact frequency groups |
| `Loan Status Group` | Categorical | Combines housing and personal loan status into meaningful categories |
| `Month Number` | Integer | Assigns a numerical month value to support chronological sorting |
| `previously_contacted` | Categorical / Boolean | Indicates whether the customer had a previous campaign contact |
| `previous_contact_days` | Integer | Stores the previous-contact day information; confirm its exact derivation from the preparation script |

### Age Group Categories

| Category | Age Range |
|---|---|
| Below 30 | Less than 30 |
| 30–39 | 30 to 39 |
| 40–49 | 40 to 49 |
| 50–59 | 50 to 59 |
| 60+ | 60 and above |

### Contact Frequency Groups

| Category | Number of Contacts |
|---|---|
| 1 Contact | 1 |
| 2–3 Contacts | 2 to 3 |
| 4–6 Contacts | 4 to 6 |
| 7+ Contacts | 7 or more |

### Loan Status Groups

| Category | Housing Loan | Personal Loan |
|---|---|---|
| No Loans | No | No |
| Housing Only | Yes | No |
| Personal Loan Only | No | Yes |
| Both Loans | Yes | Yes |

### Month Number Mapping

| Month | Month Number |
|---|---:|
| January | 1 |
| February | 2 |
| March | 3 |
| April | 4 |
| May | 5 |
| June | 6 |
| July | 7 |
| August | 8 |
| September | 9 |
| October | 10 |
| November | 11 |
| December | 12 |

## 4. Power BI Measures

The following measures are used to calculate the dashboard's key performance indicators.

| Measure | Description |
|---|---|
| `Total Customers` | Total number of customer records |
| `Subscribed Customers` | Number of customers with `y = yes` |
| `Unsubscribed Customers` | Number of customers with `y = no` |
| `Subscription Rate` | Percentage of customers who subscribed |
| `Monthly Subscriptions` | Number of subscriptions grouped by month |

### Subscription Rate Formula

```DAX
Subscription Rate =
DIVIDE(
    [Subscribed Customers],
    [Total Customers],
    0
)
```

## 5. Target Variable

The target variable is `y`.

| Value | Meaning |
|---|---|
| yes | Customer subscribed to a term deposit |
| no | Customer did not subscribe to a term deposit |

This variable is used to calculate subscription counts and subscription rates across customer and campaign categories.

## 6. Analytical Considerations

- Subscription rate is calculated as subscribed customers divided by total customers.
- Categorical variables should be treated as categories rather than continuous numerical measurements.
- `Month Number` is used to sort month names chronologically.
- `Contact Frequency Sort` is used to maintain the correct order of contact frequency categories.
- `duration` represents call duration and is only known after a call has taken place. It should not be treated as a pre-call targeting variable.
- The analysis identifies historical associations and does not establish causation.
- The dataset is used for descriptive analysis and dashboard reporting, not as a predictive machine learning model.

---

**Dataset Source:** UCI Machine Learning Repository — Bank Marketing Dataset

https://archive.ics.uci.edu/dataset/222/bank+marketing
