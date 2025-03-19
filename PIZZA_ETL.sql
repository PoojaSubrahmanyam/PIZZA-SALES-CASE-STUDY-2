-- How many pizzas were ordered?
select count(distinct order_id) as pizzas_ordered from customer_orders_stagging
-- How many unique customer orders were made?
 SELECT count(distinct customer_id) as  customers from customer_orders_stagging
-- How many successful orders were delivered by each runner?
select count(P.order_id) from pizza_runner_stagging P
WHERE  P.cancellation ="NA";
-- How many of each type of pizza was delivered?
WITH DELIVERED AS ( 
SELECT P.ORDER_ID FROM pizza_runner_stagging P 
  WHERE P.CANCELLATION='NA')
  
SELECT C.PIZZA_ID,COUNT(C.PIZZA_ID) FROM 
DELIVERED D
JOIN customer_orders_stagging C
ON D.ORDER_ID = C.ORDER_ID
GROUP BY C.PIZZA_ID
-- How many Vegetarian and Meatlovers were ordered by each customer?
SELECT P.PIZZA_NAME,COUNT(C.PIZZA_ID) AS COUNT
FROM CUSTOMER_ORDERS_STAGGING C
JOIN PIZZA_NAMES P
ON C.PIZZA_ID = P.PIZZA_ID
GROUP BY C.PIZZA_ID
-- What was the maximum number of pizzas delivered in a single order?
SELECT CUSTOMER_ID,COUNT(PIZZA_ID) AS COUNT FROM CUSTOMER_ORDERS_STAGGING
GROUP BY CUSTOMER_ID
ORDER BY COUNT DESC
LIMIT 1
-- For each customer, how many delivered pizzas had at least 1 change and how many had no changes?
WITH delivered_orders AS (
  SELECT order_id 
  FROM pizza_runner_stagging
  WHERE cancellation = 'NA'
)
SELECT 
  SUM(CASE WHEN c.exclusions = 'NA' THEN 1 ELSE 0 END) AS no_change,
  SUM(CASE WHEN c.exclusions <> 'NA' THEN 1 ELSE 0 END) AS changes_made
FROM customer_orders_stagging c
JOIN delivered_orders d ON d.order_id = c.order_id;
-- How many pizzas were delivered that had both exclusions and extras?
WITH delivered_orders AS (
  SELECT order_id 
  FROM pizza_runner_stagging
  WHERE cancellation = 'NA'
)
SELECT 
  SUM(CASE WHEN c.exclusions <> 'NA' and c.extras<>'NA' THEN 1 ELSE 0 END) AS E_Echanges_made
FROM customer_orders_stagging c
JOIN delivered_orders d ON d.order_id = c.order_id;

-- What was the total volume of pizzas ordered for each hour of the day?
SELECT 
    HOUR(order_time) AS order_hour, 
    COUNT(order_id) AS total_pizzas
FROM 
    customer_orders_stagging
GROUP BY 
    order_hour
ORDER BY 
    order_hour;
-- What was the volume of orders for each day of the week?
 SELECT COUNT(order_id),DAYNAME(ORDER_TIME) AS DAY FROM customer_orders_stagging
 GROUP BY DAY
ORDER BY FIELD(day, 'Sunday', 'Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday', 'Saturday');
 
 
 
 
 
 
 
 
 
