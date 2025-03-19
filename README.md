
# PIZZA RUNNER - CASE STUDY 2

## Table of Contents
1. [How many pizzas were ordered?](#1-how-many-pizzas-were-ordered)
2. [How many unique customer orders were made?](#2-how-many-unique-customer-orders-were-made)
3. [How many successful orders were delivered by each runner?](#3-how-many-successful-orders-were-delivered-by-each-runner)
4. [How many of each type of pizza was delivered?](#4-how-many-of-each-type-of-pizza-was-delivered)
5. [How many Vegetarian and Meatlovers were ordered by each customer?](#5-how-many-vegetarian-and-meatlovers-were-ordered-by-each-customer)
6. [What was the maximum number of pizzas delivered in a single order?](#6-what-was-the-maximum-number-of-pizzas-delivered-in-a-single-order)
7. [For each customer, how many delivered pizzas had at least 1 change and how many had no changes?](#7-for-each-customer-how-many-delivered-pizzas-had-at-least-1-change-and-how-many-had-no-changes)
8. [How many pizzas were delivered that had both exclusions and extras?](#8-how-many-pizzas-were-delivered-that-had-both-exclusions-and-extras)
9. [What was the total volume of pizzas ordered for each hour of the day?](#9-what-was-the-total-volume-of-pizzas-ordered-for-each-hour-of-the-day)
10. [What was the volume of orders for each day of the week?](#10-what-was-the-volume-of-orders-for-each-day-of-the-week)



## 1. How many pizzas were ordered?
```
SELECT COUNT(DISTINCT order_id) AS pizzas_ordered 
FROM customer_orders_stagging;
```

## 2. How many unique customer orders were made?
```
SELECT COUNT(DISTINCT customer_id) AS customers 
FROM customer_orders_stagging;
```
## 3. How many successful orders were delivered by each runner?
```
SELECT COUNT(order_id) AS successful_orders
FROM pizza_runner_stagging
WHERE cancellation = 'NA';
```
## 4. How many of each type of pizza was delivered?
```
WITH delivered AS (
    SELECT order_id 
    FROM pizza_runner_stagging
    WHERE cancellation = 'NA'
)
SELECT c.pizza_id, COUNT(c.pizza_id) 
FROM delivered d
JOIN customer_orders_stagging c
ON d.order_id = c.order_id
GROUP BY c.pizza_id;
```
## 5. How many Vegetarian and Meatlovers were ordered by each customer?
```
SELECT p.pizza_name, COUNT(c.pizza_id) AS count
FROM customer_orders_stagging c
JOIN pizza_names p
ON c.pizza_id = p.pizza_id
GROUP BY c.pizza_id;
```
## 6. What was the maximum number of pizzas delivered in a single order?
```
SELECT customer_id, COUNT(pizza_id) AS count
FROM customer_orders_stagging
GROUP BY customer_id
ORDER BY count DESC
LIMIT 1;
```
## 7. For each customer, how many delivered pizzas had at least one change and how many had no changes?
```
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
```
## 8. How many pizzas were delivered that had both exclusions and extras?
```
WITH delivered_orders AS (
  SELECT order_id 
  FROM pizza_runner_stagging
  WHERE cancellation = 'NA'
)
SELECT 
  SUM(CASE WHEN c.exclusions <> 'NA' AND c.extras <> 'NA' THEN 1 ELSE 0 END) AS e_e_changes_made
FROM customer_orders_stagging c
JOIN delivered_orders d ON d.order_id = c.order_id;
```
## 9. What was the total volume of pizzas ordered for each hour of the day?
```
SELECT 
    HOUR(order_time) AS order_hour, 
    COUNT(order_id) AS total_pizzas
FROM customer_orders_stagging
GROUP BY order_hour
ORDER BY order_hour;
```
## 10.What was the volume of orders for each day of the week?
```
SELECT COUNT(order_id) AS total_orders,
       DAYNAME(order_time) AS day
FROM customer_orders_stagging
GROUP BY day
ORDER BY FIELD(day, 'Sunday', 'Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday', 'Saturday');
```

# Contributing

Feel free to submit pull requests for any improvements or alternative solutions to these queries.
