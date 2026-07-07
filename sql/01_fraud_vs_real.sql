-- Fraudulent Transactions vs. Real Transactions

SELECT
	Class,
	COUNT(*) AS num_transactions,
	SUM(Amount) AS total_amount,
	AVG(Amount) AS avg_amount
FROM transactions
GROUP BY Class;