
-- BANK MARKETING ANALYSIS
-- 06: Campaign Effectiveness Analysis

USE marketing_analysis;


-- 1. Subscription rate by contact method

SELECT
    contact,
    COUNT(*) AS total_customers,
    SUM(CASE WHEN y = 'yes' THEN 1 ELSE 0 END)
        AS subscribed_customers,
    ROUND(
        AVG(CASE WHEN y = 'yes' THEN 1.0 ELSE 0 END) * 100,
        2
    ) AS subscription_rate
FROM bank_campaign
GROUP BY contact
ORDER BY subscription_rate DESC;


-- 2. Subscription rate by previous campaign outcome

SELECT
    poutcome AS previous_campaign_outcome,
    COUNT(*) AS total_customers,
    SUM(CASE WHEN y = 'yes' THEN 1 ELSE 0 END)
        AS subscribed_customers,
    ROUND(
        AVG(CASE WHEN y = 'yes' THEN 1.0 ELSE 0 END) * 100,
        2
    ) AS subscription_rate
FROM bank_campaign
GROUP BY poutcome
ORDER BY subscription_rate DESC;


-- 3. Subscription rate by current campaign contact frequency

SELECT
    CASE
        WHEN campaign = 1 THEN '1 Contact'
        WHEN campaign BETWEEN 2 AND 3 THEN '2-3 Contacts'
        WHEN campaign BETWEEN 4 AND 6 THEN '4-6 Contacts'
        ELSE '7+ Contacts'
    END AS contact_frequency,
    COUNT(*) AS total_customers,
    SUM(CASE WHEN y = 'yes' THEN 1 ELSE 0 END)
        AS subscribed_customers,
    ROUND(
        AVG(CASE WHEN y = 'yes' THEN 1.0 ELSE 0 END) * 100,
        2
    ) AS subscription_rate
FROM bank_campaign
GROUP BY contact_frequency
ORDER BY
    CASE contact_frequency
        WHEN '1 Contact' THEN 1
        WHEN '2-3 Contacts' THEN 2
        WHEN '4-6 Contacts' THEN 3
        WHEN '7+ Contacts' THEN 4
    END;


-- 4. Subscription rate by housing and personal loan status

SELECT
    CASE
        WHEN housing = 'no' AND loan = 'no'
            THEN 'No Loans'
        WHEN housing = 'yes' AND loan = 'no'
            THEN 'Housing Only'
        WHEN housing = 'no' AND loan = 'yes'
            THEN 'Personal Loan Only'
        ELSE 'Both Loans'
    END AS loan_status_group,

    COUNT(*) AS total_customers,

    SUM(CASE WHEN y = 'yes' THEN 1 ELSE 0 END)
        AS subscribed_customers,

    ROUND(
        AVG(CASE WHEN y = 'yes' THEN 1.0 ELSE 0 END) * 100,
        2
    ) AS subscription_rate

FROM bank_campaign
GROUP BY loan_status_group
ORDER BY subscription_rate DESC;
