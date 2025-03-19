 create table customer_orders_stagging
 like customer_orders;
 
 select * from customer_orders_stagging
 
insert customer_orders_stagging 
select * 
from customer_orders;

select * from customer_orders_stagging
-- dealing with missing values
-- is to replace the values with no exclusion
-- update the table with null 
-- use coalesce


SET SQL_SAFE_UPDATES = 0;

UPDATE customer_orders_stagging 
SET exclusions = NULL 
WHERE trim(exclusions) = '' OR exclusions = 'null' OR exclusions IS NULL;

SELECT COALESCE(exclusions, 'no exclusion') as exclusions
FROM customer_orders_stagging;



UPDATE customer_orders_stagging
SET exclusions = 'NA'
WHERE exclusions IS NULL;

select * from customer_orders_stagging;

select extras,coalesce(extras,'NA') from customer_orders_stagging

update customer_orders_stagging
set extras= null
WHERE trim(extras) = '' OR extras = 'null' OR extras IS NULL;

select extras,coalesce(extras,'NA') AS extras FROM customer_orders_stagging

update customer_orders_stagging
set extras = 'NA'
where extras is null;

select * from customer_orders_stagging





















