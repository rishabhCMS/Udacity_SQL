SELECT AVG(num_of_events) as avg_num_of_events,
		channel
FROM 
(SELECT DATE_TRUNC('day', occurred_at) AS day,
		channel,
        COUNT(*) AS num_of_events
FROM web_events
GROUP BY 1,2) AS sub
GROUP BY 2


SELECT  T3.name, T3.channel, T2.max_count
FROM(SELECT a.id ID, a.name, w.channel, count(*)
          FROM web_events w
          JOIN accounts a
          ON w.account_id = a.id
          GROUP BY 1,2,3) AS T3

JOIN
	(SELECT T1.id ,T1.name, MAX(T1.count_) max_count		

	FROM
          (SELECT a.id , a.name, w.channel, count(*) count_
          FROM web_events w
          JOIN accounts a
          ON w.account_id = a.id
          GROUP BY 1,2,3
          ORDER BY 1, 2) AS T1
	GROUP BY 1,2 ) AS T2

ON T3.id = T2.id
WHERE T3.name = T2.name AND T3.channel = T2.channel

