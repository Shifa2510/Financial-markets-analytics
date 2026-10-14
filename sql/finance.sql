-- Start fresh
DROP DATABASE IF EXISTS fin_markets;

CREATE DATABASE fin_markets;

USE fin_markets;


-- Table 1: Asset classes
CREATE TABLE asset_classes (
    asset_class_id INT PRIMARY KEY AUTO_INCREMENT,
    asset_class_name VARCHAR(50) NOT NULL
);


-- Table 2: Financial instruments
CREATE TABLE instruments (
    instrument_id INT PRIMARY KEY AUTO_INCREMENT,
    ticker VARCHAR(10) UNIQUE NOT NULL,
    instrument_name VARCHAR(100),
    asset_class_id INT,
    FOREIGN KEY (asset_class_id)
        REFERENCES asset_classes(asset_class_id)
);


-- Table 3: Daily prices
CREATE TABLE daily_prices (
    price_id INT PRIMARY KEY AUTO_INCREMENT,
    instrument_id INT,
    trade_date DATE NOT NULL,
    open_price DECIMAL(12,4),
    high_price DECIMAL(12,4),
    low_price DECIMAL(12,4),
    close_price DECIMAL(12,4),
    volume BIGINT,
    UNIQUE (instrument_id, trade_date),
    FOREIGN KEY (instrument_id)
        REFERENCES instruments(instrument_id)
);


-- Insert asset classes
INSERT INTO asset_classes (asset_class_name)
VALUES
    ('Equity ETF'),
    ('Stock'),
    ('Commodity'),
    ('Bond');


-- Insert instruments
INSERT INTO instruments (ticker, instrument_name, asset_class_id)
VALUES
    ('SPY', 'SPDR S&P 500 ETF Trust', 1),
    ('QQQ', 'Invesco QQQ Trust', 1),
    ('AAPL', 'Apple Inc.', 2),
    ('MSFT', 'Microsoft Corporation', 2),
    ('JPM', 'JPMorgan Chase & Co.', 2),
    ('GLD', 'SPDR Gold Shares', 3),
    ('TLT', 'iShares 20+ Year Treasury Bond ETF', 4),
    ('AGG', 'iShares Core U.S. Aggregate Bond ETF', 4);


-- Check everything
SHOW TABLES;

SELECT * FROM asset_classes;

SELECT * FROM instruments;