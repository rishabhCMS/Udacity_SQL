WITH t1 AS(WITH land_table AS (SELECT *
		    FROM land_area
		    WHERE year = '1990'),
               forest_table AS (SELECT *
		       FROM forest_area
		       WHERE year = '1990' )
			SELECT 	r.region,
					SUM(l.total_area_sq_mi*2.59) total_area_sqkm,
				SUM(f.forest_area_sqkm) total_forest_area_sqkm,
					ROUND(
						cast((SUM(f.forest_area_sqkm)/(SUM(l.total_area_sq_mi*2.59)))*100
						AS NUMERIC),2  
					 ) AS prcnt_area 

			FROM land_table l 
			INNER JOIN forest_table f
			ON f.country_name = l.country_name
			INNER JOIN regions r
			ON r.country_code = f.country_code
			GROUP BY 1
			ORDER BY 4 DESC),
           
     t2 AS (WITH land_table AS (SELECT *
		    FROM land_area
		    WHERE year = '2016'  ),
      		forest_table AS (SELECT *
		       FROM forest_area
		       WHERE year = '2016')
			SELECT 	r.region,
					SUM(l.total_area_sq_mi*2.59) total_area_sqkm,
				SUM(f.forest_area_sqkm) total_forest_area_sqkm,
					ROUND(
						cast((SUM(f.forest_area_sqkm)/(SUM(l.total_area_sq_mi*2.59)))*100
						AS NUMERIC),2  
					 ) AS prcnt_area 

			FROM land_table l 
			INNER JOIN forest_table f
			ON f.country_name = l.country_name
			INNER JOIN regions r
			ON r.country_code = f.country_code
			GROUP BY 1
			ORDER BY 4 DESC)
            
SELECT t1.region, t1.prcnt_area prcnt_area_1990, t2.prcnt_area prcnt_area_2016,
		t1.prcnt_area - t2.prcnt_area diff
FROM t1
JOIN t2
ON t1.region = t2.region
ORDER BY 1 DESC