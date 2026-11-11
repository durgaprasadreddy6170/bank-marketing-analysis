
-- BANK MARKETING ANALYSIS
-- 05: Customer Segmentation Analysis

USE marketing_analysis;

-- 1. Subscription rate by age group
SELECT
    CASE
        WHEN age < 30 THEN 'Below 30'
        WHEN age BETWEEN 30 AND 39 THEN '30-39'
        WHEN age BETWEEN 40 AND 49 THEN '40-49'
        WHEN age BETWEEN 50 AND 59 THEN '50-59'
        ELSE '60+'
    END AS age_group,

    COUNT(*) AS total_customers,

    SUM(CASE WHEN y = 'yes' THEN 1 ELSE 0 END)
        AS subscribed_customers,

    ROUND(
        AVG(CASE WHEN y = 'yes' THEN 1.0 ELSE 0 END) * 100,
        2
    ) AS subscription_rate

FROM bank_campaign
GROUP BY age_group
ORDER BY
    CASE age_group
        WHEN 'Below 30' THEN 1
        WHEN '30-39' THEN 2
        WHEN '40-49' THEN 3
        WHEN '50-59' THEN 4
        WHEN '60+' THEN 5
    END;


-- 2. Subscription rate by occupation
SELECT
    job,
    COUNT(*) AS total_customers,
    SUM(CASE WHEN y = 'yes' THEN 1 ELSE 0 END)
        AS subscribed_customers,
    ROUND(
        AVG(CASE WHEN y = 'yes' THEN 1.0 ELSE 0 END) * 100,
        2
    ) AS subscription_rate
FROM bank_campaign
GROUP BY job
ORDER BY subscription_rate DESC;


-- 3. Subscription rate by marital status
SELECT
    marital,
    COUNT(*) AS total_customers,
    SUM(CASE WHEN y = 'yes' THEN 1 ELSE 0 END)
        AS subscribed_customers,
    ROUND(
        AVG(CASE WHEN y = 'yes' THEN 1.0 ELSE 0 END) * 100,
        2
    ) AS subscription_rate
FROM bank_campaign
GROUP BY marital
ORDER BY subscription_rate DESC;


-- 4. Subscription rate by education
SELECT
    education,
    COUNT(*) AS total_customers,
    SUM(CASE WHEN y = 'yes' THEN 1 ELSE 0 END)
        AS subscribed_customers,
    ROUND(
        AVG(CASE WHEN y = 'yes' THEN 1.0 ELSE 0 END) * 100,
        2
    ) AS subscription_rate
FROM bank_campaign
GROUP BY education
ORDER BY subscription_rate DESC;
