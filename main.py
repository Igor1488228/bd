import cx_Oracle

def exec(cursor, query):
    columns = []
    cursor.execute(query)
    for column in cursor.description:
        columns.append(column[0])
    print(" | ".join(columns))
    for row in cursor:
        print(row)
    print("\n")

username = 'BATIAVGNEVE'
password = 'Ehuvum228'
dsn = 'localhost/xe'

connection = cx_Oracle.connect(username, password, dsn)
cursor = connection.cursor()

first_query = """SELECT
    TRIM(c.country_name) country,
    COUNT(u.university_name) universities
FROM
    Countries   c
    LEFT JOIN Universities u ON c.country_name = u.country_name
GROUP BY
    TRIM(c.country_name)
ORDER BY
   universities DESC;"""

second_query = """SELECT
    TRIM(r.university_rank) ranks,
    COUNT(u.university_name) universities
FROM
    ranks r
    LEFT JOIN Universities_Ranks ur ON r.university_rank = ur.university_rank
    LEFT JOIN Universities u         ON u.university_name = ur.university_name
                             AND u.dynamic_year = ur.dynamic_year
                             AND u.country_name = ur.country_name
GROUP BY
    TRIM(r.university_rank)
ORDER BY
    universities DESC;


third_query = """SELECT 
    TRIM(c.country_name) country, 
    NVL(SUM(u.quality_of_faculty), 0) quality_of_faculty
FROM 
    Countries c
    LEFT JOIN Universities u ON c.country_name = u.country_name
GROUP BY 
    TRIM(c.country_name)
ORDER BY 
       quality_of_faculty DESC;"""


exec(cursor, first_query)
exec(cursor, second_query)
exec(cursor, third_query)

cursor.close()
connection.close()
