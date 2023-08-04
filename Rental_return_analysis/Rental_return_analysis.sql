
/*find out the customer who overdue */

/*Customer who havent returned */
select *
from rental 
where return_date is null or rental_date is null;
/*output:4a*/

/*create a return_status */

/*create view return_status as */
select
case when return_date is null or rental_date is null then 'Havnt_return'
	 when 
	 f.rental_duration >=
	 extract(Day from (DATE_TRUNC('day', return_date-rental_date) + INTERVAL '1 day')) then 'On_time'
	 else 'Over_due'
	 end as return_status,
/*extract(Day from return_date-rental_date) as rental_duration_actual,*/
/*(return_date-rental_date) as text,*/

extract(Day from (DATE_TRUNC('day', return_date-rental_date) + INTERVAL '1 day')) AS rounded_up_rental_duration_actual,
f.rental_duration,
case when return_date is null or rental_date is null then 0
	 when extract(Day from (DATE_TRUNC('day', return_date-rental_date) + INTERVAL '1 day'))-f.rental_duration > 0 then 
	 extract(Day from (DATE_TRUNC('day', return_date-rental_date) + INTERVAL '1 day'))-f.rental_duration
	 else 0 end as day_after_due
,r.*
from rental r 
left join inventory i on r.inventory_id=i.inventory_id 
left join film f on f.film_id=i.film_id 
/*limit 10*/
;
/*DROP VIEW IF EXISTS return_status;*/

/*output:4b <limit 10 used*/


/*customer who returned later than expected */
select *
from return_status
where return_status='Over_due'
limit 10 /*view only*/
;
/*Plan to charge them late return fee*/
/*output:4c*/


