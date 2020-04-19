--1
select country, count(university_name) as count_cntry
from university
GROUP BY country
order by count_cntry DESC;
--2
select  round((count(university.university_name)/298) * 100, 2) as rate
    ,NVL(countryes.country, 0) as country
from university
RIGHT join country
on country.university_name = university.university_name
GROUP by NVL(countryes.country, 0)
order by countryes DESC;

select count(universityes.university_name) as count_un
            , years.university_years as all_years
            from university
            INNER JOIN years
            on years.university_name = university.university_name

GROUP by years.university_years
ORDER by count_un DESC;
