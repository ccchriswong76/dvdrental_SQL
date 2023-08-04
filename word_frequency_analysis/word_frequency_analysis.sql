/*film description word frequency analysis*/

/*transform the data type of fulltext from tsvector to text and 
make it to arrary for breaking dow the word to row*/
with lexeme_table as 
(
SELECT film_id,fulltext,unnest(string_to_array(fulltext::text, ' ')) AS item ,
	substring(unnest(string_to_array(fulltext::text, ' ')), 2, 
			  position(':' in unnest(string_to_array(fulltext::text, ' ')) ) - 3) AS lexeme
FROM film
/*limit 10*/
) 
/*ouput:3a<<< limit 10 used*/

/*what lexeme appear most*/
select lexeme,count(*) as appear_count
from lexeme_table 
group by 1
order by appear_count desc 
;
/*one of the top result: 
"mad":165 */
/*ouput:3b*/

/*Find any insight if the full text with "mad" */
SELECT name,count(*) as lexeme_by_cat
from film f 
left join film_category fc on f.film_id= fc.film_id 
left join category c on fc.category_id=c.category_id
WHERE fulltext @@ to_tsquery('mad')
group by 1 
order by 2 desc
;
/*ouput:3c*/



