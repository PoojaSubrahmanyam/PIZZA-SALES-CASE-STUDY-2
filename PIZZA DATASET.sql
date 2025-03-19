-- Create Schema
DROP DATABASE IF EXISTS `pizza_runner`;
CREATE DATABASE `pizza_runner`;
USE `pizza_runner`;

-- Drop and Create `runners` Table
DROP TABLE IF EXISTS `runners`;
CREATE TABLE `runners` (
    `runner_id` INT PRIMARY KEY AUTO_INCREMENT,
    `registration_date` DATE
);

INSERT INTO `runners` (`runner_id`, `registration_date`) VALUES
(1, '2021-01-01'),
(2, '2021-01-03'),
(3, '2024-01-08'),
(4, '2021-01-15');

-- Drop and Create `customer_orders` Table
DROP TABLE IF EXISTS `customer_orders`;
CREATE TABLE `customer_orders` (
    `order_id` INT,
    `customer_id` INT,
    `pizza_id` INT,
    `exclusions` VARCHAR(10),
    `extras` VARCHAR(10),
    `order_time` DATETIME
);

INSERT INTO `customer_orders` 
(`order_id`, `customer_id`, `pizza_id`, `exclusions`, `extras`, `order_time`) VALUES
(1, 101, 1, '', '', '2020-01-01 18:05:02'),
(2, 101, 1, '', '', '2020-01-02 19:45:32'),
(3, 102, 1, '', '', '2020-01-02 23:51:23'),
(4, 102, 2, '', NULL, '2020-01-02 23:55:23'),
(5, 103, 1, '4', '', '2020-01-04 20:15:46'),
(6, 103, 2, '', NULL, '2020-01-04 20:23:46'),
(7, 104, 1, NULL, '1', '2020-01-08 21:00:29'),
(8, 101, 2, '', '1', '2020-01-08 22:03:13'),
(9, 102, 1, '', '2', '2020-01-09 18:51:20'),
(10, 103, 1, '4', '1,5', '2020-01-10 11:22:59'),
(11, 104, 1, '', '', '2020-01-10 18:34:29');

-- Drop and Create `runner_orders` Table
DROP TABLE IF EXISTS `runner_orders`;
CREATE TABLE `runner_orders` (
    `order_id` INT,
    `runner_id` INT,
    `pickup_time` DATETIME,
    `distance` VARCHAR(10),
    `duration` VARCHAR(15),
    `cancellation` VARCHAR(50)
);

INSERT INTO `runner_orders` (`order_id`, `runner_id`, `pickup_time`, `distance`, `duration`, `cancellation`) VALUES
(1, 1, '2025-01-01 18:20:00', '20 km', '30 minutes', NULL),
(2, 1, '2025-01-02 19:50:00', '13.4 km', '22 mins', NULL),
(3, 2, '2025-01-02 23:55:00', '23.4 km', '40 minutes', NULL),
(4, 2, '2025-01-04 14:10:00', '25 km', '25 minutes', NULL),
(5, 3, '2025-01-05 21:15:00', '8 km', '18 minutes', NULL),
(6, 3, NULL, NULL, NULL, 'Restaurant Cancellation'),
(7, 1, '2025-01-07 22:00:00', '12 km', '14 minutes', NULL),
(8, 2, '2025-01-09 11:30:00', '9.5 km', '12 minutes', NULL),
(9, 2, NULL, NULL, NULL, 'Customer Cancellation'),
(10, 3, '2025-01-11 19:00:00', '10 km', '12 minutes', NULL);

-- Drop and Create `pizza_names` Table
DROP TABLE IF EXISTS `pizza_names`;
CREATE TABLE `pizza_names` (
    `pizza_id` INT PRIMARY KEY,
    `pizza_name` VARCHAR(50) NOT NULL
);

INSERT INTO `pizza_names`
(`pizza_id`, `pizza_name`)
VALUES
(1, 'Meatlovers'),
(2, 'Vegetarian');

-- Drop and Create `pizza_recipes` Table
DROP TABLE IF EXISTS `pizza_recipes`;
CREATE TABLE `pizza_recipes` (
    `pizza_id` INT,
    `toppings` VARCHAR(50)
);

INSERT INTO `pizza_recipes` 
(`pizza_id`, `toppings`) VALUES
(1, '1,2,3,4,5,6,8,10'),
(2, '7,8,9,10,11,12');

-- Drop and Create `pizza_toppings` Table
DROP TABLE IF EXISTS `pizza_toppings`;
CREATE TABLE `pizza_toppings` (
    `topping_id` INT PRIMARY KEY,
    `topping_name` VARCHAR(50)
);

INSERT INTO `pizza_toppings` 
(`topping_id`, `topping_name`) VALUES
(1, 'Bacon'),
(2, 'BBQ Sauce'),
(3, 'Beef'),
(4, 'Cheese'),
(5, 'Chicken'),
(6, 'Mushrooms'),
(7, 'Onions'),
(8, 'Salami'),
(9, 'Green Peppers'),
(10, 'Black Olives'),
(11, 'Tomatoes'),
(12, 'Tomato Sauce');
