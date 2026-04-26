USE supply_chain;
SHOW TABLES;
SELECT * FROM shipments LIMIT 10;
SELECT * FROM supply_chain_clean LIMIT 10;
DESCRIBE shipments;
DESCRIBE supply_chain_clean;

SELECT *
FROM shipments
WHERE product IS NULL;
SELECT *
FROM supply_chain_clean
WHERE Availability  IS NULL;

SELECT product, COUNT(*)
FROM shipments
GROUP BY product
HAVING COUNT(*) > 1;
SELECT delivery_days, COUNT(*)
FROM shipments
GROUP BY delivery_days
HAVING COUNT(*) > 1;
SELECT Price, COUNT(*)
FROM supply_chain_clean
GROUP BY Price
HAVING COUNT(*) > 1;

SELECT DISTINCT delivery_days FROM shipments;
SELECT DISTINCT Costs FROM supply_chain_clean;
SELECT DISTINCT `net profit` FROM supply_chain_clean;
SELECT DISTINCT `Lead time` FROM supply_chain_clean;
SELECT DISTINCT `ï»¿Product type` FROM supply_chain_clean;


SELECT DISTINCT `Supplier name`
FROM supply_chain_clean
ORDER BY `Supplier name` ;

SELECT `Supplier name`, AVG(`Defect rates`) AS Avg_Defects
FROM supply_chain_clean
GROUP BY `Supplier name`
ORDER BY Avg_Defects DESC;

SELECT `ï»¿Product type`, SUM(`Revenue generated` - `Costs`) AS `Net Profit`
FROM supply_chain_clean
GROUP BY `ï»¿Product type`
ORDER BY `Net Profit` DESC;

SELECT `Shipping carriers`, AVG(`Shipping costs`) AS Avg_Cost
FROM supply_chain_clean
GROUP BY `Shipping carriers`
ORDER BY Avg_Cost ASC;

SELECT `Transportation modes`, AVG(`Costs`) AS Avg_Cost
FROM supply_chain_clean
GROUP BY `Transportation modes`
ORDER BY Avg_Cost ASC;

SELECT `SKU`, `Costs`, `Number of products sold`
FROM supply_chain_clean
ORDER BY `Costs` DESC, `Number of products sold` ASC
LIMIT 10;

SELECT `Location`, SUM(`Revenue generated` - `Costs`) AS `Net Profit`
FROM supply_chain_clean
GROUP BY `Location`
ORDER BY `Net Profit` DESC;

SELECT `SKU`, `Number of products sold`
FROM supply_chain_clean
ORDER BY`Number of products sold` DESC
LIMIT 10;

SELECT `Routes`, AVG(`Shipping times`) AS Avg_Time
FROM supply_chain_clean
GROUP BY `Routes`
ORDER BY Avg_Time ASC;

SELECT AVG(`Manufacturing lead time`) AS Avg_Manufacturing_Time
FROM supply_chain_clean;

CREATE VIEW final_supply_chain_clean AS
SELECT 
    `SKU`,
    `ï»¿Product type`,
    `Supplier name`,
    `Transportation modes`,
    `Shipping carriers`,
    `Routes`,
    `Location`,
    `Revenue generated`,
    `Costs`,
    (`Revenue generated` - `Costs`) AS `Net Profit`,
    `Number of products sold`,
    `Shipping times`,
    `Shipping costs`,
    `Manufacturing lead time`,
    `Defect rates`
FROM supply_chain_clean;



