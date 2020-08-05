/* problem 1*/
SELECT a.name, AVG(o.standard_qty) avg_standard_qty,
		AVG(o.gloss_qty) avg_gloss_qty,
        AVG(o.poster_qty) avg_poster_qty
       
FROM accounts a
JOIN orders o
ON o.account_id = a.id

GROUP BY a.name


/* problem 2*/

SELECT a.name, AVG(o.standard_amt_usd) avg_standard_amt_usd,
		AVG(o.gloss_amt_usd) avg_gloss_amt_usd,
        AVG(o.poster_amt_usd) avg_poster_amt_usd
       
FROM accounts a
JOIN orders o
ON o.account_id = a.id

GROUP BY a.name


/* problem 3*/


SELECT s.name,
		w.channel,
		COUNT(w.channel)
        
FROM sales_reps s
JOIN accounts a
ON s.id = a.sales_rep_id
JOIN web_events w
ON w.account_id = a.id
GROUP BY s.name, w.channel