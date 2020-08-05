/* Problem 1 */
SELECT  RIGHT(website,3),COUNT( RIGHT(website,3))
FROM accounts
GROUP BY 1

/* Problem 2 */
SELECT LEFT(name,1), COUNT(LEFT(name,1))
FROM accounts
GROUP BY 1
ORDER BY 2 DESC

        /* Problem 3 */
SELECT SUM(num) num, SUM(letter)
FROM(

        SELECT CASE WHEN LEFT(UPPER(name), 1) IN ('0','1','2','3','4','5','6','7','8','9') THEN 1 ELSE 0 END AS num,
        CASE WHEN LEFT(UPPER(name), 1) IN ('0','1','2','3','4','5','6','7','8','9') THEN 0 ELSE 1 END AS letter

        FROM accounts) as t
        
/* Quiz: CONCAT, LEFT, RIGHT, and SUBSTR */
/* problem 1 */

SELECT CONCAT(s.id,'-',r.name)  EMP_ID_REGION
FROM sales_reps s
JOIN region r
ON s.region_id = r.id

/* Problem 2 */

SELECT  a.website,
		a.name, 
        CONCAT(a.lat, a.long) AS coordinate,
        	CONCAT(LEFT(a.primary_poc,1), 								RIGHT(a.primary_poc,1), '@',
                  SUBSTR(a.website,5)) EMAL
FROM accounts a