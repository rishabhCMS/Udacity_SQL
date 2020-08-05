/* Problem 1 */

SELECT SUM(poster_qty) as total_poster_qty
FROM orders



/* Problem 2 */

SELECT SUM(standard_qty) as total_standard_qty
FROM orders


/* Problem 4 */


SELECT SUM(total_amt_usd) as total_amt_usd_sum
FROM orders

/* Problem 5 */


SELECT SUM(total_amt_usd)/ SUM(standard_qty) as total_amt_usd_sum
FROM orders