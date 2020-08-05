/* problem 1 */

SELECT a.name account_name
FROM accounts AS a
JOIN web_events AS w
ON a.id = w.account_id
ORDER BY w.occurred_at ASC
LIMIT 1;

/* problem 2 */

SELECT SUM(o.total_amt_usd) total_sales_usd,
		a.name company_name

FROM accounts a
JOIN orders o
ON a.id = o.account_id
GROUP BY a.name


/* problem 3 */


SELECT a.name account_name,
		w.channel channel_name,
        w.occurred_at
FROM accounts a
JOIN web_events w
ON a.id = w.account_id
ORDER BY w.occurred_at DESC

LIMIT 1

 
/* problem 4 */       
SELECT COUNT(channel), channel
FROM web_events
GROUP BY channel

/* problem 5 */ 

SELECT a.primary_poc as primary_contact
FROM accounts a 
JOIN web_events w
ON w.account_id = a.id
ORDER BY w.occurred_at ASC
LIMIT 1;


/* problem 6 */ 

SELECT MIN(o.total_amt_usd) , a.name

FROM accounts a
JOIN orders o
ON o.account_id = a.id
GROUP BY a.name

/* problem 7 */ 

SELECT COUNT(s.id) num_sales_reps,
		r.name
FROM sales_reps s
JOIN region r
ON r.id = s.region_id
GROUP BY r.name
ORDER BY num_sales_reps ASC