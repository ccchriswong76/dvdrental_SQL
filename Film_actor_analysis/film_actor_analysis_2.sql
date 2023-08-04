select *
from film ;
/*backgroud: the replacement cost generally use to calculate the possible return*/
/*asuume the unit of rental_duration is "day"*/
/*using round up for the breakeven_day */
with film_revenue_analysis as (
select film_id,title,
rental_duration,
replacement_cost,rental_rate,
round(replacement_cost/rental_rate,2) as breakeven_time_of_rental,
round(rental_rate/replacement_cost,2) as Rate_of_return,
ceil(round(replacement_cost/rental_rate,2)*rental_duration) as breakeven_day
from film
order by Rate_of_return desc,breakeven_day 
/*we can see how much we can earn in each film*/
/*output 8a*/
)

/*average KPI in film level*/ 
,avg_Flim_KPI as (
select 
round((avg(rental_duration)),2) as avg_rental_duration,
round((avg(replacement_cost)),2) as avg_replacement_cost,
round((avg(rental_rate)),2) as avg_rental_rate,
round((avg(breakeven_time_of_rental)),2) as avg_breakeven_time_of_rental,
round((avg(Rate_of_return)),2) as avg_Rate_of_return,
round((avg(breakeven_day)),2) as avg_breakeven_day
from film_revenue_analysis

/*output 8b*/
) 
, revenue_by_film as (
select distinct f.film_id,sum(f.rental_rate) over(partition by f.film_id) as total_sales_excepted_by_film,
count(*) over(partition by f.film_id) as total_count_by_film
from rental r 
left join inventory i on r.inventory_id=i.inventory_id
left join film f on i.film_id=f.film_id
order by 2 desc
/*output 8c*/
),
revenue_by_film2 as (
/*revenue_by_film_with_extra_info*/
select frs.*,rbf.total_sales_excepted_by_film,rbf.total_count_by_film
from revenue_by_film rbf
left join film_revenue_analysis frs on rbf.film_id=frs.film_id
order by total_sales_excepted_by_film desc
/*output 8d*/
),
actor_list as (
/*actor list each film*/
SELECT film_id,STRING_AGG((first_name ||' '||last_name), ', ') AS actor_list
FROM film_actor fa left join actor a on fa.actor_id=a.actor_id
GROUP BY film_id
/*output 8e*/
)
/*join actor list in film info*/
,revenue_by_film3 as (
select 
rank () over (order by total_sales_excepted_by_film desc ) as rank,
rbf2.*,al.actor_list
from revenue_by_film2 rbf2 left join actor_list al on rbf2.film_id=al.film_id
/*output 8f*/
)
/*actor ranking*/
select fa.actor_id,first_name||' '||last_name as actor_name,
ceil(avg(t3.rank)) as avg_rank,
max(t3.rank)  as max_rank,
min(t3.rank)  as min_rank,
count(*) as film_c
from film_actor fa 
left join revenue_by_film3 t3 on fa.film_id=t3.film_id
left join actor a on fa.actor_id=a.actor_id 
where t3.film_id is not null
group by fa.actor_id,actor_name
order by avg_rank
/*ouput 8g*/
;


