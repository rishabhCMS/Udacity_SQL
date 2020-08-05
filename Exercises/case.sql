/* Problem 1 */
SELECT id, account_id, total_amt_usd,
		CASE WHEN total_amt_usd < 3000 THEN 'Small'
        WHEN total_amt_usd >= 3000 THEN 'Large'
        END AS level_Of_order
FROM orders


/* Problem 2 */

SELECT CASE 
			WHEN total >= 2000 THEN 'atleast 2000'
            WHEN total > 1000 AND total < 2000 THEN 'Between 1000 and 2000'
            WHEN total <= 1000 THEN 'Less than 1000' END AS level,
            COUNT(*) num_orders
FROM orders
GROUP BY 1

/* Problem 3 */


SELECT a.name,
SUM(o.total_amt_usd) ,
CASE WHEN SUM(o.total_amt_usd) > 200000 THEN 'greater than 200,000'
        WHEN SUM(o.total_amt_usd) <= 200000 AND SUM(o.total_amt_usd) >=100000 THEN '200,000 and 100,000'
        WHEN SUM(o.total_amt_usd) < 100000 THEN 'under 100000' END AS level

FROM accounts a
JOIN orders o
ON a.id = o.account_id
GROUP by 1
ORDER BY 2 DESC
