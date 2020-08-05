/* Problem 1 */
SELECT s.name AS sales_rep,
		COUNT(a.id) AS counts
FROM accounts a
JOIN sales_reps s
ON s.id = a.sales_rep_id
GROUP BY sales_rep
HAVING COUNT(a.id) >= 5

/* Problem 2 */
SELECT a.name account_name,
	COUNT(o.id) AS counts
FROM orders o
JOIN accounts a
ON o.account_id = a.id
GROUP BY account_name
HAVING COUNT(o.id) > 20

/* Problem 3 */
SELECT a.name account_name,
	COUNT(o.id) AS counts
FROM orders o
JOIN accounts a
ON o.account_id = a.id
GROUP BY account_name
HAVING COUNT(o.id) > 20
ORDER BY COUNT(o.id) DESC
LIMIT 1;


/* Problem 4 */
SELECT a.name account_name,
	SUM(o.total_amt_usd) AS total
FROM orders o
JOIN accounts a
ON o.account_id = a.id
GROUP BY account_name
HAVING SUM(o.total_amt_usd) > 30000

/* Problem 5 */
SELECT a.name account_name,
	SUM(o.total_amt_usd) AS total
FROM orders o
JOIN accounts a
ON o.account_id = a.id
GROUP BY account_name
HAVING SUM(o.total_amt_usd) < 1000


/* Problem 6 */
SELECT a.name account_name,
	SUM(o.total_amt_usd) AS total
FROM orders o
JOIN accounts a
ON o.account_id = a.id
GROUP BY account_name
HAVING SUM(o.total_amt_usd) > 0
ORDER BY total DESC
LIMIT 1;

/* Problem 7 */
SELECT a.name account_name,
	SUM(o.total_amt_usd) AS total
FROM orders o
JOIN accounts a
ON o.account_id = a.id
GROUP BY account_name
HAVING SUM(o.total_amt_usd) > 0
ORDER BY total ASC
LIMIT 1;


/* Problem 8 */
SELECT a.name,
		COUNT(w.channel) as counts
FROM web_events w
JOIN accounts a
ON a.id = w.account_id
WHERE w.channel = 'facebook'
GROUP BY a.name
HAVING COUNT(w.channel) > 6


/* Problem 9 */

SELECT a.name,
		COUNT(w.channel) as counts
FROM web_events w
JOIN accounts a
ON a.id = w.account_id
WHERE w.channel = 'facebook'
GROUP BY a.name
HAVING COUNT(w.channel) > 6
ORDER BY counts
LIMIT 1;


/* Problem 10 */
SELECT w.channel,
		COUNT(w.channel) as counts
FROM web_events w
JOIN accounts a
ON a.id = w.account_id

GROUP BY w.channel
HAVING COUNT(w.channel) > 6
ORDER BY counts DESC