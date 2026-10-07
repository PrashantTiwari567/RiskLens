-- overall_totals
SELECT
            COUNT(*) AS transactions,
            SUM(fraud) AS fraud_transactions,
            100.0 * SUM(fraud) / COUNT(*) AS fraud_rate_percent
        FROM transactions;

-- split_summary
SELECT
            split,
            COUNT(*) AS transactions,
            SUM(fraud) AS fraud_transactions,
            MIN(step) AS first_step,
            MAX(step) AS last_step
        FROM transactions
        GROUP BY split
        ORDER BY CASE split
            WHEN 'train' THEN 1
            WHEN 'validation' THEN 2
            ELSE 3
        END;

-- training_category
SELECT
            category,
            COUNT(*) AS transactions,
            SUM(fraud) AS fraud_transactions,
            100.0 * SUM(fraud) / COUNT(*) AS fraud_rate_percent
        FROM transactions
        WHERE split = 'train'
        GROUP BY category
        ORDER BY category;

-- training_step
SELECT
            step,
            COUNT(*) AS transactions,
            SUM(fraud) AS fraud_transactions,
            100.0 * SUM(fraud) / COUNT(*) AS fraud_rate_percent
        FROM transactions
        WHERE split = 'train'
        GROUP BY step
        ORDER BY step;

-- training_amount
SELECT
            fraud,
            COUNT(*) AS transactions,
            AVG(amount) AS mean_amount,
            MIN(amount) AS min_amount,
            MAX(amount) AS max_amount
        FROM transactions
        WHERE split = 'train'
        GROUP BY fraud
        ORDER BY fraud;