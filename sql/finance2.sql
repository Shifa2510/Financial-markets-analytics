USE fin_markets;
SELECT
    i.ticker,
    i.instrument_name,
    a.asset_class_name
FROM instruments i
JOIN asset_classes a
    ON i.asset_class_id = a.asset_class_id
ORDER BY a.asset_class_name, i.ticker;
SELECT
    i.ticker,
    MAX(dp.close_price) AS highest_close
FROM daily_prices dp
JOIN instruments i
    ON dp.instrument_id = i.instrument_id
GROUP BY i.ticker
ORDER BY highest_close DESC;
SELECT
    i.ticker,
    MIN(dp.close_price) AS lowest_close
FROM daily_prices dp
JOIN instruments i
    ON dp.instrument_id = i.instrument_id
GROUP BY i.ticker
ORDER BY lowest_close;
SELECT
    i.ticker,
    ROUND(AVG(dp.close_price), 2) AS average_close
FROM daily_prices dp
JOIN instruments i
    ON dp.instrument_id = i.instrument_id
GROUP BY i.ticker
ORDER BY average_close DESC;
SELECT
    i.ticker,
    YEAR(dp.trade_date) AS year,
    MONTH(dp.trade_date) AS month,
    ROUND(AVG(dp.close_price), 2) AS avg_monthly_close
FROM daily_prices dp
JOIN instruments i
    ON dp.instrument_id = i.instrument_id
GROUP BY
    i.ticker,
    YEAR(dp.trade_date),
    MONTH(dp.trade_date)
ORDER BY
    i.ticker,
    year,
    month;
    SELECT
    a.asset_class_name,
    YEAR(dp.trade_date) AS year,
    MONTH(dp.trade_date) AS month,
    ROUND(AVG(dp.close_price), 2) AS avg_monthly_close
FROM daily_prices dp
JOIN instruments i
    ON dp.instrument_id = i.instrument_id
JOIN asset_classes a
    ON i.asset_class_id = a.asset_class_id
GROUP BY
    a.asset_class_name,
    YEAR(dp.trade_date),
    MONTH(dp.trade_date)
ORDER BY
    year,
    month,
    a.asset_class_name;
    SELECT
    i.ticker,
    dp.trade_date,
    dp.close_price,
    ROUND(
        AVG(dp.close_price) OVER (
            PARTITION BY dp.instrument_id
            ORDER BY dp.trade_date
            ROWS BETWEEN 19 PRECEDING AND CURRENT ROW
        ),
        2
    ) AS moving_avg_20d
FROM daily_prices dp
JOIN instruments i
    ON dp.instrument_id = i.instrument_id
ORDER BY
    i.ticker,
    dp.trade_date;
    WITH moving_average AS (
    SELECT
        i.ticker,
        dp.trade_date,
        dp.close_price,
        AVG(dp.close_price) OVER (
            PARTITION BY dp.instrument_id
            ORDER BY dp.trade_date
            ROWS BETWEEN 19 PRECEDING AND CURRENT ROW
        ) AS moving_avg_20d
    FROM daily_prices dp
    JOIN instruments i
        ON dp.instrument_id = i.instrument_id
)

SELECT
    ticker,
    trade_date,
    ROUND(close_price, 2) AS close_price,
    ROUND(moving_avg_20d, 2) AS moving_avg_20d
FROM moving_average
ORDER BY
    trade_date DESC,
    ticker;
    WITH ranked_prices AS (
    SELECT
        i.ticker,
        dp.trade_date,
        dp.close_price,
        ROW_NUMBER() OVER (
            PARTITION BY dp.instrument_id
            ORDER BY dp.trade_date
        ) AS first_row,
        ROW_NUMBER() OVER (
            PARTITION BY dp.instrument_id
            ORDER BY dp.trade_date DESC
        ) AS last_row
    FROM daily_prices dp
    JOIN instruments i
        ON dp.instrument_id = i.instrument_id
)

SELECT
    ticker,
    MAX(CASE WHEN first_row = 1 THEN trade_date END) AS start_date,
    MAX(CASE WHEN first_row = 1 THEN close_price END) AS start_price,
    MAX(CASE WHEN last_row = 1 THEN trade_date END) AS end_date,
    MAX(CASE WHEN last_row = 1 THEN close_price END) AS end_price
FROM ranked_prices
GROUP BY ticker
ORDER BY ticker;
WITH ranked_prices AS (
    SELECT
        i.ticker,
        dp.trade_date,
        dp.close_price,
        ROW_NUMBER() OVER (
            PARTITION BY dp.instrument_id
            ORDER BY dp.trade_date
        ) AS first_row,
        ROW_NUMBER() OVER (
            PARTITION BY dp.instrument_id
            ORDER BY dp.trade_date DESC
        ) AS last_row
    FROM daily_prices dp
    JOIN instruments i
        ON dp.instrument_id = i.instrument_id
),

summary AS (
    SELECT
        ticker,
        MAX(CASE WHEN first_row = 1 THEN close_price END) AS start_price,
        MAX(CASE WHEN last_row = 1 THEN close_price END) AS end_price
    FROM ranked_prices
    GROUP BY ticker
)

SELECT
    ticker,
    ROUND(start_price, 2) AS start_price,
    ROUND(end_price, 2) AS end_price,
    ROUND(
        ((end_price - start_price) / start_price) * 100,
        2
    ) AS price_change_percent
FROM summary
ORDER BY price_change_percent DESC;