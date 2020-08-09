/* Problem 1 */
SELECT primary_poc, 
CONCAT(	
    LEFT(primary_poc, POSITION(' ' IN primary_poc)),
  '.',
    SUBSTR(primary_poc,  (STRPOS(primary_poc, ' '))+1),
  '@',
    name, '.com')
FROM accounts




/* PRoblem 2 */
SELECT primary_poc, 
CONCAT(	
    LEFT(primary_poc, (POSITION(' ' IN primary_poc))-1),
  '.',
    SUBSTR(primary_poc,  (STRPOS(primary_poc, ' '))+1),
  '@',
    REPLACE(name,' ',''), '.com')
FROM accounts

/* Problem 3 */
WITH t1 as (SELECT name, primary_poc,
            LEFT(primary_poc, POSITION(' ' IN primary_poc) -1 ) AS fname,
            SUBSTR(primary_poc, STRPOS(primary_poc,' ') +1) AS lname
           FROM accounts),

	t2 AS(SELECT LOWER(LEFT(t1.fname,1)) fst_letter_fname,
           LOWER(RIGHT(t1.fname,1)) lst_letter_fname,
           LOWER(LEFT(t1.lname,1)) fst_letter_lname,
           LOWER(RIGHT(t1.lname,1)) lst_letter_lname,
          LENGTH(t1.fname) len_fname,
          LENGTH(t1.lname) len_lname,
          UPPER(REPLACE(name,' ','')) company
           FROM t1)