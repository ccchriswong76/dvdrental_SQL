/*pre query*/
/*month lookup table*/
/*method 1*/
with month as (
SELECT ARRAY['jan:1', 'feb:2', 'mar:3', 'apr:4', 'may:5', 'jun:6', 'jul:7', 'aug:8', 'sep:9', 'oct:10', 'nov:11', 'dec:12'] AS month_array
)
select
  split_part(unnest(month_array), ':', 1) AS month,
  split_part(unnest(month_array), ':', 2) AS value
from month;
/*method 2*/
SELECT 'jan' AS month, 1 AS value
UNION ALL
SELECT 'feb' AS month, 2 AS value
UNION ALL
SELECT 'mar' AS month, 3 AS value;
/*method 3*/
SELECT *
FROM (VALUES
  ('jan', 1),
  ('feb', 2),
  ('mar', 3)
) AS month_value(month, value);
/*output 7a*/
/**/

/*check movie language*/
select l.name as language,release_year,count(*) as film_count
from film f
left join language l on f.language_id = l.language_id
group by 1,2
;
/*result: all of the movies are in English Language and release in 2006.*/
/*output 7b*/

/*I assume the records of rental table should be same as payment table*/
/*however, there are 1452 records cant be found in payment */
/*Possible reasons: customers had returned the dvd but havnt paid or the data entry havnt updated*/
select *
from rental
where rental_id not in (select rental_id
from payment );
/*output 7c*/



