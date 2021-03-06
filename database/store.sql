/*
--- Relational Database project ---
--- Author: Faaiz Ahmed ---
--- Matrikel Nummer: 11148258 ---
--- Project: Online Store like Amazon ---
*/

# DDL- Data definition language
# CREATE,ALTER,DROP
# Droping Tables


DROP TABLE IF EXISTS brands;
DROP TABLE IF EXISTS categories;
DROP TABLE IF EXISTS orders;
DROP TABLE IF EXISTS order_item;
DROP TABLE IF EXISTS product;
DROP TABLE IF EXISTS users;


CREATE TABLE `users` (
  `user_id` int NOT NULL,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL
);

ALTER TABLE `users`
  ADD PRIMARY KEY (`user_id`),
  MODIFY `user_id` int NOT NULL AUTO_INCREMENT;


CREATE TABLE `brands` (
  `brand_id` int NOT NULL,
  `brand_name` varchar(255) NOT NULL,
  `brand_active` int NOT NULL DEFAULT 0,
  `brand_status` int NOT NULL DEFAULT 0
);

ALTER TABLE `brands`
  ADD PRIMARY KEY (`brand_id`),
  MODIFY `brand_id` int NOT NULL AUTO_INCREMENT;



CREATE TABLE `categories` (
  `categories_id` int NOT NULL,
  `categories_name` varchar(255) NOT NULL,
  `categories_active` int NOT NULL DEFAULT 0,
  `categories_status` int NOT NULL DEFAULT 0
);

ALTER TABLE `categories`
  ADD PRIMARY KEY (`categories_id`),
  MODIFY `categories_id` int NOT NULL AUTO_INCREMENT;


CREATE TABLE `orders` (
  `order_id` int NOT NULL,
  `order_date` date NOT NULL,
  `client_name` varchar(255) NOT NULL,
  `client_contact` varchar(255) NOT NULL,
  `sub_total` varchar(255) NOT NULL,
  `vat` varchar(255) NOT NULL,
  `total_amount` varchar(255) NOT NULL,
  `discount` varchar(255) NOT NULL,
  `grand_total` varchar(255) NOT NULL,
  `paid` varchar(255) NOT NULL,
  `due` varchar(255) NOT NULL,
  `payment_type` int NOT NULL,
  `payment_status` int NOT NULL,
  `payment_place` int NOT NULL,
  `gstn` varchar(255) NOT NULL,
  `order_status` int NOT NULL DEFAULT 0,
  `user_id` int NOT NULL,
  CONSTRAINT `fk_user_id`
    FOREIGN KEY (`user_id`)
    REFERENCES `users` (`user_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE
);

ALTER TABLE `orders`
  ADD PRIMARY KEY (`order_id`),
  MODIFY `order_id` int NOT NULL AUTO_INCREMENT;


CREATE TABLE `product` (
  `product_id` int NOT NULL,
  `product_name` varchar(255) NOT NULL,
  `product_image` text NOT NULL,
  `brand_id` int NOT NULL,
  `categories_id` int NOT NULL,
  `quantity` varchar(255) NOT NULL,
  `rate` varchar(255) NOT NULL,
  `active` int NOT NULL DEFAULT 0,
  `status` int NOT NULL DEFAULT 0,
   CONSTRAINT `fk_product_brands1`
    FOREIGN KEY (`brand_id`)
    REFERENCES `store`.`brands` (`brand_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
   CONSTRAINT `fk_product_categories1`
    FOREIGN KEY (`categories_id`)
    REFERENCES `store`.`categories` (`categories_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
);



ALTER TABLE `product`
  ADD PRIMARY KEY (`product_id`),
  MODIFY `product_id` int NOT NULL AUTO_INCREMENT;


CREATE TABLE `order_item` (
  `order_item_id` int NOT NULL,
  `order_id` int NOT NULL DEFAULT 0,
  `product_id` int NOT NULL DEFAULT 0,
  `quantity` varchar(255) NOT NULL,
  `rate` varchar(255) NOT NULL,
  `total` varchar(255) NOT NULL,
  `order_item_status` int NOT NULL DEFAULT 0,
  CONSTRAINT `fk_order_item_product1`
    FOREIGN KEY (`product_id`)
    REFERENCES `product` (`product_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_order_item_orders1`
    FOREIGN KEY (`order_id`)
    REFERENCES `orders` (`order_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
);

ALTER TABLE `order_item`
  ADD PRIMARY KEY (`order_item_id`),
  MODIFY `order_item_id` int NOT NULL AUTO_INCREMENT;



# DML- Data Manipulation language
# INSERT,UPDATE,DELETE

INSERT INTO `brands` (`brand_id`, `brand_name`, `brand_active`, `brand_status`) VALUES
(1, 'Samsung', 1, 1),
(2, 'Apple', 1, 1),
(3, 'Google', 1, 1),
(4, 'Huawei', 1, 1),
(5, 'LG', 2, 1),
(6, 'HP', 1, 1),
(7, 'Dell', 1, 1);

INSERT INTO `categories` (`categories_id`, `categories_name`, `categories_active`, `categories_status`) VALUES
(1, 'Mobiles', 1, 1),
(2, 'Laptops', 1, 1);

INSERT INTO `users` (`user_id`, `username`, `password`, `email`) VALUES
(1, 'admin', '21232f297a57a5a743894a0e4a801fc3', '');

INSERT INTO `orders` (`order_id`, `order_date`, `client_name`, `client_contact`, `sub_total`, `vat`, `total_amount`, `discount`, `grand_total`, `paid`, `due`, `payment_type`, `payment_status`, `payment_place`, `gstn`, `order_status`, `user_id`) VALUES
(1, '2021-03-22', 'Faaiz Ahmed', '012768465', '200.00', '36.00', '236.00', '0', '236.00', '0', '236.00', 2, 3, 2, '36.00', 1, 1);

INSERT INTO `product` (`product_id`, `product_name`, `product_image`, `brand_id`, `categories_id`, `quantity`, `rate`, `active`, `status`) VALUES
(1, 'Samsung Galaxy s10', '../assests/images/stock/17868608666044cd27cb3dd.jpg', 1, 1, '9', '200', 1, 1),
(2, 'iPhone 11', '../assests/images/stock/4838989776044d04567229.jpg', 2, 1, '15', '250', 1, 1),
(3, 'Huawei P30', '../assests/images/stock/16823540716044d20c9c192.jpg', 4, 1, '20', '150', 1, 1),
(4, 'Dell Latitude 5490', '../assests/images/stock/10218159986044d6df2486f.jpg', 7, 2, '9', '400', 1, 1);


INSERT INTO `order_item` (`order_item_id`, `order_id`, `product_id`, `quantity`, `rate`, `total`, `order_item_status`) VALUES
(1, 1, 1, '1', '200', '200.00', 1);










