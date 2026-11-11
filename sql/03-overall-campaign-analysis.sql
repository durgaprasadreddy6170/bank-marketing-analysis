
-- BANK MARKETING ANALYSIS
-- 03: Overall Campaign Performance

USE marketing_analysis;

SELECT
    COUNT(*) AS total_customers,

    SUM(CASE
        WHEN y = 'yes' THEN 1
        ELSE 0
    END) AS subscribed_customers,

    SUM(CASE
        WHEN y = 'no' THEN 1
        ELSE 0
    END) AS unsubscribed_customers,

    ROUND(
        SUM(CASE
            WHEN y = 'yes' THEN 1
            ELSE 0
        END) * 100.0 / COUNT(*),
        2
    ) AS subscription_rate

FROM bank_campaign;
