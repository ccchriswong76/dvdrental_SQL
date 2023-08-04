/*The proportion of the customer by store and active status*/ 
SELECT store_id,active ,COUNT(*) AS count_by_store_active, 
CAST((COUNT(*) * 100.00 / (select count(*) from customer)) AS DECIMAL(10, 2)) AS percentage
FROM customer
group by 1,2
;
/*output:2a*/

/*check the email validity*/

/*breakdown the firstname, last name ,email domain*/
with email_temp as (
SELECT  first_name,last_name,email,SUBSTRING(email FROM 1 FOR POSITION('.' IN email)-1) AS given_name_by_email,
SUBSTRING(email, POSITION('.' IN email)+1,POSITION('@' IN email)-POSITION('.' IN email)-1)  AS sur_name_by_email,
SUBSTRING(email FROM POSITION('@' IN email)+1) AS email_domain
FROM customer
/*output:2b*/	
)

/*check the domain*/
select distinct email_domain
from email_temp;
/*output:2c*/	

/*check the eamil address componsition with the customer name */
with email_temp as (
SELECT  first_name,last_name,email,SUBSTRING(email FROM 1 FOR POSITION('.' IN email)-1) AS given_name_by_email,
SUBSTRING(email, POSITION('.' IN email)+1,POSITION('@' IN email)-POSITION('.' IN email)-1)  AS sur_name_by_email,
SUBSTRING(email FROM POSITION('@' IN email)+1) AS email_domain
FROM customer
)
select *
from email_temp
where lower(first_name) <> lower(given_name_by_email) or upper(last_name)<>upper(sur_name_by_email)
;
/*return 0 record which means the email address is fine*/
/*no ouput to return*/