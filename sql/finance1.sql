USE fin_markets;
SELECT COUNT(*) AS total_price_records
FROM daily_prices;
SELECT *
FROM daily_prices
LIMIT 10;
SELECT 
    i.ticker,
    COUNT(*) AS price_records
FROM daily_prices dp
JOIN instruments i
    ON dp.instrument_id = i.instrument_id
GROUP BY i.ticker
ORDER BY i.ticker;