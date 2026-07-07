SELECT
    CASE
        WHEN CAST(Amount AS REAL) < 10 THEN '1. under $10'
        WHEN CAST(Amount AS REAL) < 50 THEN '2. $10-50'
        WHEN CAST(Amount AS REAL) < 100 THEN '3. $50-100'
        WHEN CAST(Amount AS REAL) < 500 THEN '4. $100-500'
        WHEN CAST(Amount AS REAL) < 1000 THEN '5. $500-1000'
        ELSE '6. $1000+'
    END AS amount_bucket,
    COUNT(*) AS total_txns,
    SUM(Class) AS fraud_txns,
    ROUND(100.0 * SUM(Class) / COUNT(*), 4) AS fraud_rate_pct
FROM transactions
GROUP BY amount_bucket
ORDER BY amount_bucket;
