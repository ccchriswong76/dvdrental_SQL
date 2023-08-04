

/*Customer segmentation RFM model*/

/*sales performance in customer level*/
with payment_summary_by_customer as  (
select 
customer_id,sum(amount) as total_sales_per_customer,count(*)::NUMERIC  number_of_perchase_by_id,
round(avg(amount),2) as avg_sales,max(payment_date) as latest_payment_day
from payment
where amount <>0
group by 1
),
/*output 5a*/

/*Normalise the value*/
RFM_1 as (
select customer_id,
latest_payment_day,
/*Recency*/
extract(day from DATE_TRUNC('day', ((latest_payment_day - min(latest_payment_day) over()))+ INTERVAL '1 day')) /
extract(day from DATE_TRUNC('day', ((max(latest_payment_day) over() - min(latest_payment_day) over()))+ INTERVAL '1 day'))		
		as Normalized_latest_payment_day,
total_sales_per_customer,
/*Monetary Value*/
(total_sales_per_customer- min(total_sales_per_customer) over()) /
((max(total_sales_per_customer) over()) - (min(total_sales_per_customer) over()))		
		as Normalized_total_sales_per_customer,
/*Frequency*/
number_of_perchase_by_id,
(number_of_perchase_by_id- min(number_of_perchase_by_id) over()) /
((max(number_of_perchase_by_id) over()) - (min(number_of_perchase_by_id) over()))		
		as Normalized_number_of_perchase_by_id
from payment_summary_by_customer
)
/*output 5b*/
,
/*caculate the score in 5 level*/
RFM_2 as (
select *,
		case 
        WHEN Normalized_latest_payment_day >= 0.8 THEN 5
        WHEN Normalized_latest_payment_day >= 0.6 THEN 4
        WHEN Normalized_latest_payment_day >= 0.4 THEN 3
        WHEN Normalized_latest_payment_day >= 0.2 THEN 2
        ELSE 1 end as R,
		CASE
        WHEN Normalized_total_sales_per_customer >= 0.8 THEN 5
        WHEN Normalized_total_sales_per_customer >= 0.6 THEN 4
        WHEN Normalized_total_sales_per_customer >= 0.4 THEN 3
        WHEN Normalized_total_sales_per_customer >= 0.2 THEN 2
        ELSE 1 end as F,
		CASE
        WHEN Normalized_number_of_perchase_by_id >= 0.8 THEN 5
        WHEN Normalized_number_of_perchase_by_id >= 0.6 THEN 4
        WHEN Normalized_number_of_perchase_by_id >= 0.4 THEN 3
        WHEN Normalized_number_of_perchase_by_id >= 0.2 THEN 2
        ELSE 1 end as M
from RFM_1 
/*output 5c*/
)

/*customer segment*/
select distinct
    CASE
        WHEN r >= 4 AND f >= 4 AND m >= 4 THEN '1.Best_Customers'
        WHEN r >= 4 AND f >= 2 AND m >= 4 THEN '2.High_spending_New_Customers'
        WHEN r >= 4 AND f >= 4 AND m >= 2 THEN '3.Lowest_Spending_Active_Loyal_Customers'
        WHEN r >=2 AND f >= 4 AND m >= 4 THEN '4.Churned_Best_Customers'
        ELSE '5.Other'
    END AS customer_segment,
R,F,M,count(*) over (partition by r,f,m) as count
from RFM_2
order by 1,r desc,f desc,m desc
;
/*output 5d*/

