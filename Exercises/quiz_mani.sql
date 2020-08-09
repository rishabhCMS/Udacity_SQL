
/* Problem 6 */
SELECT AVG(t4.total_amt_usd_per_order)
	FROM(SELECT * 
		FROM(SELECT t1.id, t1.name, (t1.sum_total_amt)/(t2.count_) AS total_amt_usd_per_order 
			FROM(SELECT a.id, a.name , SUM(o.total_amt_usd) sum_total_amt
				FROM accounts a
				JOIN orders o
				ON o.account_id = a.id
				GROUP BY 1,2) AS t1

			JOIN (SELECT a.id, a.name , COUNT(*) count_
				FROM accounts a
				JOIN orders o
				ON o.account_id = a.id
				GROUP BY 1,2) AS t2
			ON t2.id = t1.id) AS t3
		WHERE t3.total_amt_usd_per_order > (SELECT AVG(o.total_amt_usd) FROM orders o)) AS t4

/* Problem 5,  304846.969000000000*/ 

SELECT AVG(t1.sum_) lifetime_avg
FROM	(SELECT  a.name, SUM(o.total_amt_usd) sum_
		FROM orders o
		JOIN accounts a 
		ON a.id = o.account_id
		GROUP BY 1
		ORDER BY 2 DESC
		LIMIT 10) AS t1

/* Problem 4 */




