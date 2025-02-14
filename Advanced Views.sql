use restaurant_reservation;

CREATE VIEW TotalCustomerReservations AS
SELECT 
    customers.CustomerID,
    CONCAT(customers.FirstName, ' ', customers.LastName) AS CustomerName,
    (SELECT COUNT(reservations.ReservationID) 
     FROM reservations 
     WHERE reservations.Customer = customers.CustomerID) AS TotalReservations
FROM customers;

CREATE VIEW RestaurantSales AS
SELECT 
    restaurants.Location,
    r.TotalSales
FROM restaurants
INNER JOIN (
    SELECT 
        orders.Restaurant,
        SUM(orders.TotalPrice) AS TotalSales
    FROM orders
    GROUP BY orders.Restaurant
) AS r
ON restaurants.RestaurantID = r.Restaurant;

CREATE VIEW ActivePromotionItems AS
SELECT 
    menuitem.ItemName,
    menuitem.Category,
    menuitem.Price,
    promotions.Title AS PromotionTitle
FROM menuitem
INNER JOIN promotions ON menuitem.Promotions = promotions.PromotionID
WHERE promotions.PromotionID IN (
    SELECT PromotionID 
    FROM promotions 
    WHERE Is_Active = TRUE
);

SELECT * FROM TotalCustomerReservations;
SELECT * FROM RestaurantSales;
SELECT * FROM ActivePromotionItems;
