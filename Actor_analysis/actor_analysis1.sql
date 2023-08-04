/*duplicate check for actor table*/

select a.actor_id,a.first_name,a.last_name
from actor a inner join
(
SELECT first_name, last_name,count(*) as count
FROM actor
group by first_name, last_name
having count(*) >1
order by count(*) desc
) b
on a.first_name=b.first_name and a.last_name=b.last_name
;
/*output 6a*/

/*Top 10 actors appear in movie by film count*/
with actor_rank_t as (
SELECT 
DENSE_RANK() OVER (ORDER BY COUNT(b.film_id) DESC) AS actor_rank,
a.actor_id,a.first_name, a.last_name, COUNT(b.film_id) AS film_count
FROM actor a
JOIN film_actor b ON a.actor_id = b.actor_id
GROUP BY a.actor_id
ORDER BY film_count DESC
) 
select *
from actor_rank_t
where actor_rank <=10 

/*output 6b*/



