--First 

SELECT
    TRIM(c.country_name) country,
    COUNT(u.university_name) universityes
FROM
    Countries   c
    LEFT JOIN Universityes u ON c.country_name = u.country_name
GROUP BY
    TRIM(c.country_name)
ORDER BY
   universityes DESC;


--Second 

SELECT
    TRIM(p.university_position) rank,
    COUNT(u.university_name) universityes
FROM
    rank p
    LEFT JOIN Universityes_Rank up ON p.university_position = up.university_position
    LEFT JOIN Universityes u         ON u.university_name = up.university_name
                             AND u.dynamic_year = up.dynamic_year
                             AND u.country_name = up.country_name
GROUP BY
    TRIM(p.university_position)
ORDER BY
    universityes DESC;


--Third 

SELECT 
    TRIM(c.country_name) country, 
    NVL(SUM(u.universityes), 0) universityes
FROM 
    Countries c
    LEFT JOIN Universityes u ON c.country_name = u.country_name
GROUP BY 
    TRIM(c.country_name)
ORDER BY 
    fans DESC;
    
