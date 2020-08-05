

/* Problem 1*/
SELECT DATE_PART('Year', o.occurred_at) AS Year,
		SUM(o.total_amt_usd)
FROM orders o
GROUP BY 1
ORDER BY 2 DESC
/* Problem 2*/ 
SELECT DATE_PART('Month', o.occurred_at) AS Month,
		SUM(o.total_amt_usd)
FROM orders o
GROUP BY 1
ORDER BY 2 DESC
LIMIT 1;

/* Problem 3 */
SELECT DATE_PART('Year', o.occurred_at) AS Year,
		SUM(o.total) orders_total
FROM orders o
GROUP BY 1
ORDER BY 2 DESC
LIMIT 1;


/* Problem 4 */

SELECT DATE_PART('Month', o.occurred_at) AS Month,
		SUM(o.total) orders_total
FROM orders o
GROUP BY 1
ORDER BY 2 DESC
LIMIT 1;

/* Problem 5 */
  SELECT DATE_PART('Year', o.occurred_at) AS Year,
  DATE_PART('Month', o.occurred_at) AS Month,
  a.name,
          SUM(o.gloss_amt_usd) gloss_toatl_usd
  FROM orders o
  JOIN accounts a
  ON o.account_id = a.id
  GROUP BY 1,2,3
  HAVING a.name = 'Walmart'
  ORDER BY 4 DESC