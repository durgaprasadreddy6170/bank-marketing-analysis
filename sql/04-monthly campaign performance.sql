
SELECT
    month,
    COUNT(*) AS total_customers,

    SUM(CASE
        WHEN y = 'yes' THEN 1
        ELSE 0
    END) AS subscribed_customers,

    ROUND(
        SUM(CASE WHEN y = 'yes' THEN 1 ELSE 0 END)
        * 100.0 / COUNT(*), 2
    ) AS subscription_rate

FROM bank_campaign

GROUP BY month

ORDER BY subscription_rate DESC;
