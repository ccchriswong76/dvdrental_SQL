/*investigate the relationship between the amount,rental_rate &return_date,rental_date*/

/*if the customer didnt return the dvd then the system will it in 0 amount*/
with t1_a0 as (
select p.customer_id,f.film_id,f.title,f.replacement_cost,
p.amount,f.rental_rate,p.payment_date,
r.rental_date,r.return_date,
extract(Day from (DATE_TRUNC('day', return_date-rental_date) + INTERVAL '1 day')) as acutal_rent_date,
f.rental_duration,
(extract(Day from (DATE_TRUNC('day', return_date-rental_date) + INTERVAL '1 day'))
-f.rental_duration) as extra_date
,(p.amount-f.rental_rate) as extra_earning
from payment p 
left join rental r on p.rental_id=r.rental_id
left join inventory i on r.inventory_id=i.inventory_id
left join film f on i.film_id=f.film_id
where p.amount=0 
order by p.customer_id 
/*ouput:1a*/
)
/*total replace cost due to not return*/
select sum(replacement_cost) as total_loss
from t1_a0;
/*ouput:1a1*/


/*amount in payment not equal rental_rate in rental */
with t1_diff as (
select p.customer_id,f.film_id,f.title,f.replacement_cost,
p.amount,f.rental_rate,p.payment_date,
r.rental_date,r.return_date,
extract(Day from (DATE_TRUNC('day', return_date-rental_date) + INTERVAL '1 day')) as acutal_rent_date,
f.rental_duration,
(extract(Day from (DATE_TRUNC('day', return_date-rental_date) + INTERVAL '1 day'))
-f.rental_duration) as extra_date
,(p.amount-f.rental_rate) as extra_earning
from payment p 
left join rental r on p.rental_id=r.rental_id
left join inventory i on r.inventory_id=i.inventory_id
left join film f on i.film_id=f.film_id
where p.amount <>rental_rate and  p.amount<>0 
order by p.customer_id 
)
/*limit 10 */
/*most likely the extra the differenct between amount and rental_rate due to the 
late return charge. However, some records of extra_earning and extra_date are not the same value
In conclusion, extra $1 per day
*/
/*output:1b << limit 10 used*/

/*find out why some records of extra_earning and extra_date are not the same value*/
, t1_diff_extra as (
select  extra_earning-extra_date as diff_extra,count(*) as count
from t1_diff
where extra_earning <> extra_date
group by 1
)
/*output:1c*/

/*the near 99.9% different is -1 but there 2 records is -3
In short, it should be rounding problem<< 
We dont have enought information to define what is the cutoff date*/
, t1_extra_diff_1 as (
/*some  record with the extra_diff with -1*/
select *,extra_earning-extra_date as diff_extra
from t1_diff
where extra_earning-extra_date =-1
limit 10
/*output:1c1*/
)

/*check the record with the extra_diff with -3*/
select *,extra_earning-extra_date as diff_extra
from t1_diff
where extra_earning-extra_date <-1;
/*output:1d*/
/*Cannot figure out the reason for now*/

