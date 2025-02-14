/* Find the total revenue and average order prices for each restaurant */
SELECT restaurants.Location, 
       SUM(orders.TotalPrice) AS TotalRevenue, 
       AVG(orders.TotalPrice) AS AvgOrderPrice
FROM restaurant_reservation.orders
JOIN restaurant_reservation.restaurants ON orders.Restaurant = restaurants.RestaurantID
GROUP BY restaurants.Location
ORDER BY TotalRevenue DESC;

/* Find employees who haven’t served a table */
SELECT WorkerID, FirstName, LastName
FROM restaurant_reservation.workers
EXCEPT
SELECT DISTINCT workers.WorkerID, workers.FirstName, workers.LastName
FROM restaurant_reservation.workers
JOIN restaurant_reservation.restaurant_tables ON workers.WorkerID = restaurant_tables.Assigned_Waiter;

/* Find the most popular reservation time */
SELECT Reservation_Time, COUNT(*) AS ReservationCount,
       PERCENT_RANK() OVER (ORDER BY COUNT(*) DESC) AS PopularityRank
FROM restaurant_reservation.reservations
GROUP BY Reservation_Time
ORDER BY ReservationCount DESC;

/* Find customers who have spent more than the average spent by all customers */
SELECT customers.FirstName, customers.LastName, SUM(payment.Amount) AS TotalSpent
FROM restaurant_reservation.customers
JOIN restaurant_reservation.reservations ON customers.CustomerID = reservations.Customer
JOIN restaurant_reservation.payment ON reservations.ReservationID = payment.ReserveID
GROUP BY customers.CustomerID, customers.FirstName, customers.LastName
HAVING TotalSpent > (SELECT AVG(Amount) FROM restaurant_reservation.payment);

/* List the reservations that were made by customers who have the same last name */
SELECT reservations.ReservationID, customers.FirstName, customers.LastName, reservations.Reservation_Date, reservations.Reservation_Time
FROM restaurant_reservation.reservations
JOIN restaurant_reservation.customers ON reservations.Customer = customers.CustomerID
JOIN restaurant_reservation.customers c2 ON customers.LastName = c2.LastName AND customers.CustomerID <> c2.CustomerID
ORDER BY customers.LastName, reservations.Reservation_Date;

/* Find employees and their assigned restaurant hierarchy */
WITH RECURSIVE EmployeeHierarchy AS (
    SELECT workers.WorkerID, workers.FirstName, workers.LastName, workers.Title, restaurants.Location AS Restaurant, 1 AS Level
    FROM restaurant_reservation.workers
    JOIN restaurant_reservation.restaurants ON workers.Current_Location = restaurants.RestaurantID
    UNION ALL
    SELECT workers.WorkerID, workers.FirstName, workers.LastName, workers.Title, restaurants.Location, EmployeeHierarchy.Level + 1
    FROM restaurant_reservation.workers
    JOIN EmployeeHierarchy ON workers.Current_Location = EmployeeHierarchy.WorkerID
    JOIN restaurant_reservation.restaurants ON workers.Current_Location = restaurants.RestaurantID
)
SELECT * FROM EmployeeHierarchy;

/* Find the top 3 most reserved and least reserved tables */
WITH TableReservations AS (
    SELECT Table_ID, COUNT(*) AS ReservationCount
    FROM restaurant_reservation.reservations
    GROUP BY Table_ID
),
RankedTables AS (
    SELECT Table_ID, ReservationCount,
           RANK() OVER (ORDER BY ReservationCount DESC) AS MostReservedRank,
           RANK() OVER (ORDER BY ReservationCount ASC) AS LeastReservedRank
    FROM TableReservations
)
SELECT Table_ID, ReservationCount, 'Most Reserved' AS Category
FROM RankedTables
WHERE MostReservedRank <= 3

UNION ALL

SELECT Table_ID, ReservationCount, 'Least Reserved' AS Category
FROM RankedTables
WHERE LeastReservedRank <= 3;