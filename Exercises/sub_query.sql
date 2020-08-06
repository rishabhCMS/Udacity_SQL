SELECT AVG(num_of_events) as avg_num_of_events,
		channel
FROM 
(SELECT DATE_TRUNC('day', occurred_at) AS day,
		channel,
        COUNT(*) AS num_of_events
FROM web_events
GROUP BY 1,2) AS sub
GROUP BY 2