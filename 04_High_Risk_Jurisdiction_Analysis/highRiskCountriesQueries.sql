USE highrisk;
-- **Questions to Answer with SQL:**
-- HIGH RISK COUNTIES: 'Iran', 'North Korea', 'Afghanistan', 'Syria', 'Iraq, 'Yemen', 'Somalia', 'Venezuela', 'Panama', 'Cayman Islands', 'Russia'

-- 1. What is the total number of transactions and the total amount for transactions involving at least one high-risk country?
SELECT
	sourcecountry,
	COUNT(transactionid) AS total_transactions,
    SUM(Amount) AS total_amount
FROM highriskcountries
WHERE sourcecountry IN ('Iran', 'North Korea', 'Afghanistan', 'Syria', 'Iraq',
    'Yemen', 'Somalia', 'Venezuela', 'Panama', 'Cayman Islands', 'Russia')
    OR destinationcountry IN ('Iran', 'North Korea', 'Afghanistan', 'Syria', 'Iraq',
    'Yemen', 'Somalia', 'Venezuela', 'Panama', 'Cayman Islands', 'Russia')
GROUP BY sourcecountry
ORDER BY sourcecountry;

-- 2. How much money has been sent *from* each high-risk country?
SELECT 
	sourcecountry,
    ROUND(SUM(Amount)/1000000, 2) AS total_money_sent_in_millions
FROM highriskcountries
WHERE sourcecountry IN ('Iran', 'North Korea', 'Afghanistan', 'Syria', 'Iraq',
    'Yemen', 'Somalia', 'Venezuela', 'Panama', 'Cayman Islands', 'Russia')
GROUP BY sourcecountry
ORDER BY sourcecountry;
	
-- 3. How much money has been sent *to* each high-risk country?
SELECT
	destinationcountry,
    ROUND(SUM(Amount)/1000000,2) AS total_money_sent_in_millions
FROM highriskcountries
WHERE destinationcountry IN ('Iran', 'North Korea', 'Afghanistan', 'Syria', 'Iraq',
    'Yemen', 'Somalia', 'Venezuela', 'Panama', 'Cayman Islands', 'Russia')
GROUP BY destinationcountry
ORDER BY destinationcountry;

-- 4. Which 5 customers have sent the most money to high-risk countries in total?
SELECT 
	customerid,
    SUM(amount) AS money_sent
FROM highriskcountries
WHERE destinationcountry IN ('Iran', 'North Korea', 'Afghanistan', 'Syria', 'Iraq',
    'Yemen', 'Somalia', 'Venezuela', 'Panama', 'Cayman Islands', 'Russia')
GROUP BY customerid
ORDER BY money_sent DESC
LIMIT 5;

-- 5. What is the average transaction amount for transactions involving high-risk countries versus those not involving high-risk countries?
-- Avearge transaction amount for transaction involving high-risk countries 
SELECT
	'High-Risk' AS risk_group,
	ROUND(AVG(Amount),0) AS avg_transaction_amount
FROM highriskcountries
WHERE sourcecountry IN ('Iran', 'North Korea', 'Afghanistan', 'Syria', 'Iraq',
    'Yemen', 'Somalia', 'Venezuela', 'Panama', 'Cayman Islands', 'Russia')
OR destinationcountry IN ('Iran', 'North Korea', 'Afghanistan', 'Syria', 'Iraq',
    'Yemen', 'Somalia', 'Venezuela', 'Panama', 'Cayman Islands', 'Russia')

UNION ALL

-- Avearge transaction amount for transaction involving high-risk countries 
SELECT
	'Non-High-Risk' AS risk_group,
	ROUND(AVG(Amount),0) AS avg_transaction_amount
FROM highriskcountries
WHERE sourcecountry NOT IN ('Iran', 'North Korea', 'Afghanistan', 'Syria', 'Iraq',
    'Yemen', 'Somalia', 'Venezuela', 'Panama', 'Cayman Islands', 'Russia')
AND destinationcountry NOT IN ('Iran', 'North Korea', 'Afghanistan', 'Syria', 'Iraq',
    'Yemen', 'Somalia', 'Venezuela', 'Panama', 'Cayman Islands', 'Russia');
    
-- 6. List all transactions to 'North Korea' with an amount greater than $50,000.
SELECT
	transactionid,
    amount,
    destinationcountry
FROM highriskcountries
WHERE destinationcountry = 'North Korea'
AND amount > 50000;


-- 7. How many transactions occurred each month in 2023 that involved 'Iran' as either the source or destination country?
SELECT
	MONTH(date) AS month,
	COUNT(transactionid) AS total_transactions
FROM highriskcountries
WHERE (sourcecountry = 'Iran' OR destinationcountry = 'Iran') 
	AND year(date) = '2023'
GROUP BY MONTH(date)
ORDER BY month;

-- 8. Which destination countries receive the most money from 'Panama'? List the top 3.
SELECT
	destinationcountry,
    ROUND(SUM(amount)/1000000, 2) AS total_received_in_millions
FROM highriskcountries
WHERE sourcecountry = 'Panama'
GROUP BY destinationcountry
ORDER BY total_received_in_millions DESC
LIMIT 3;

-- 9. Identify any customers who have conducted transactions with more than one high-risk country. List the customer and the number of distinct high-risk countries they've transacted with.
SELECT
	customerid,
    COUNT(DISTINCT sourcecountry) AS country_count
FROM highriskcountries
GROUP BY Customerid
HAVING country_count > 1
ORDER BY country_count desc;
    