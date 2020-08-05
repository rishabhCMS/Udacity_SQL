/* Problem 1 */

SELECT accounts.name account,
		sales_reps.name sales_rep,
		region.name region
        
        
FROM sales_reps
JOIN region
ON sales_reps.region_id = region.id
JOIN accounts
	ON sales_reps.id = accounts.sales_rep_id
	AND region.name = 'Midwest' 
	ORDER BY accounts.name


/* Problem 2 */

SELECT accounts.name account,
		sales_reps.name sales_rep,
		region.name region
        
        
FROM sales_reps
JOIN region
ON sales_reps.region_id = region.id
JOIN accounts
	ON sales_reps.id = accounts.sales_rep_id
	AND region.name = 'Midwest'
    AND sales_reps.name LIKE 'S%'
	ORDER BY accounts.name


/* Problem 3 */

SELECT accounts.name account,
		sales_reps.name sales_rep,
		region.name region
        
        
FROM sales_reps
JOIN region
ON sales_reps.region_id = region.id
JOIN accounts
	ON sales_reps.id = accounts.sales_rep_id
	AND region.name = 'Midwest'
    AND sales_reps.name LIKE '% K%'
	ORDER BY accounts.name


/* Problem 4 */

SELECT region.name region,
		accounts.name account,
        (orders.total_amt_usd / (orders.total + 0.01)) unit_price
        
FROM accounts
JOIN sales_reps
ON accounts.sales_rep_id = sales_reps.id

JOIN region
ON region.id = sales_reps.region_id

LEFT JOIN orders
ON orders.account_id = accounts.id
AND orders.standard_qty > 100


/* Problem 5 */
SELECT region.name region,
		accounts.name account,
        (orders.total_amt_usd / (orders.total + 0.01)) unit_price
        
FROM accounts
JOIN sales_reps
ON accounts.sales_rep_id = sales_reps.id

JOIN region
ON region.id = sales_reps.region_id

LEFT JOIN orders
ON orders.account_id = accounts.id
AND orders.standard_qty > 100
AND orders.poster_qty > 50
ORDER BY unit_price 


/* Problem 6 */
SELECT region.name region,
		accounts.name account,
        (orders.total_amt_usd / (orders.total + 0.01)) unit_price
        
FROM accounts
JOIN sales_reps
ON accounts.sales_rep_id = sales_reps.id

JOIN region
ON region.id = sales_reps.region_id

JOIN orders
ON orders.account_id = accounts.id
AND orders.standard_qty > 100
AND orders.poster_qty > 50
ORDER BY unit_price DESC 


/* Problem 7 */

SELECT DISTINCT a.name account,
		w.channel channel
        
FROM accounts a
JOIN web_events w
ON a.ID = w.account_id
AND a.id = 1001;


/* Problem 8 */

SELECT w.occurred_at,
		a.name,
        o.total, o.total_amt_usd
        
FROM accounts a
JOIN orders o 
ON a.id = o.account_id

JOIN web_events w 
ON a.id = w.account_id
AND YEAR(w.occurred_at) = 2015 