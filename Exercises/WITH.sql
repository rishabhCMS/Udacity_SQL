/* Problem 1 */

WITH t1 AS ( SELECT s.name sales_rep_name,
            		r.name region,
            		SUM(o.total_amt_usd) as tot_amt_sum
		
            FROM accounts a
            JOIN orders o
            ON o.account_id = a.id
            JOIN sales_reps s
            ON s.id = a. sales_rep_id
            JOIN region r
            ON r.id = s.region_id
           	GROUP BY 1,2),
            
        t2 AS (SELECT MAX(tot_amt_sum) AS total_max,region
               FROM t1
               GROUP BY 2)
SELECT t1.sales_rep_name, t1.region, t2.total_max
FROM t1
JOIN t2 
ON t1.region = t2.region AND t1.tot_amt_sum = t2.total_max


