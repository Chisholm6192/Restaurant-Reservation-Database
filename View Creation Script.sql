CREATE VIEW `view_customers` AS
  SELECT *
  FROM `customers`;

CREATE VIEW `view_items` AS
  SELECT *
  FROM `menuitem`;

CREATE VIEW `view_locations` AS
  SELECT *
  FROM `restaurants`;

CREATE VIEW `view_orders` AS
  SELECT *
  FROM `orders`;

CREATE VIEW `view_payments` AS
  SELECT *
  FROM `payment`;

CREATE VIEW `view_promotions` AS
  SELECT *
  FROM `promotions`;

CREATE VIEW `view_reservations` AS
  SELECT * 
  FROM `reservations`;

CREATE VIEW `view_tables` AS
  SELECT *
  FROM `restaurant_tables`;

CREATE TABLE `view_workers` AS
  SELECT *
  FROM `workers`;

  

SELECT * FROM restaurant_reservation.view_customers;
SELECT * FROM restaurant_reservation.view_items;
SELECT * FROM restaurant_reservation.view_locations;
SELECT * FROM restaurant_reservation.view_orders;
SELECT * FROM restaurant_reservation.view_payments;
SELECT * FROM restaurant_reservation.view_promotions;
SELECT * FROM restaurant_reservation.view_reservations;
SELECT * FROM restaurant_reservation.view_tables;
SELECT * FROM restaurant_reservation.view_workers;
