--This is a genral query !
SELECT * FROM goverment_spending_



--This query shows the maximum of goverment_expenditure from each country.
SELECT YEAR, entity, government_expenditure,year
FROM goverment_spending_
WHERE government_expenditure IN 
(SELECT max(government_expenditure) 
FROM goverment_spending_ GROUP BY entity) order by government_expenditure desc;
-- The top 5 countries with highest govermnet spending are Kuwait, Kiribati, Tuvalu, Iraq, Israel.







--This query shows the minimum of goverment_expenditure from each country.
SELECT YEAR, entity, government_expenditure,year
FROM goverment_spending_
WHERE government_expenditure IN 
(SELECT min(government_expenditure) 
FROM goverment_spending_ GROUP BY entity) order by government_expenditure asc; 
--The top 5 countries with lowest goverment spending are UAE, Nicaragua, Romania, Belarus, Poland







-- This shows the average of goverment expenditure from each country
SELECT entity ,round(AVG(government_expenditure),2) average_spending_per_country 
FROM goverment_spending_
GROUP BY entity
ORDER BY  average_spending_per_country DESC;
-- The top 5 countries with highest average are Kiribati, Tuvalu, Iraq,  Kuwait, Bosnia and Herzegovina







--This shows the sum of goverment expenditure per country
select entity, round(sum(government_expenditure),2) sum_per_country
from goverment_spending_
group by entity
order by sum(government_expenditure) desc;

/* Top 5 countires with highest goverment expenditure are: 
United Kingdom	4490.54
Italy	4209.51
Austria	3830.89
Belgium	3762.16
Finland	3620.41*/





--THIS QUERY SHOWS THE DIFFERENCE BETWEEN MAX AND MIN EXPENDITURE OF EACH COUNTRY.
SELECT entity, MAX(government_expenditure) - MIN(government_expenditure) dif
FROM goverment_spending_
GROUP BY entity
ORDER BY dif DESC;




-- This shows the count of each year from every country, example afganistan reported 9 years of data.
SELECT entity, YEAR ,COUNT(*) OVER(PARTITION BY entity)
FROM goverment_spending_;





--This shows the difference between the first year of reporting data and 2011, Example kuwait has the largest difference of 53 
WITH cte AS (
    SELECT entity,
    round(FIRST_VALUE(government_expenditure)
    OVER(PARTITION BY entity),2)
    first_val
    ,round(LAST_VALUE(government_expenditure) 
    OVER(PARTITION BY entity),2)
    last_val,
    YEAR
    FROM goverment_spending_
)
SELECT 
entity,
first_val,
last_val,
first_val - last_val  dif
FROM cte
ORDER BY dif DESC


-- So I think this is enough is, I have explored the date well
-- If you have any oppurtunity for me contact here 91+ 9229584261   