CREATE TABLE `restaurant_reservation`.`customers` (
	CustomerID	INT,
	FirstName	VARCHAR(25) NOT NULL,
	LastName VARCHAR(25) NOT NULL,
	Email	VARCHAR(25),
	PhoneNumber	VARCHAR(11),
	PRIMARY KEY(CustomerID)
);

CREATE TABLE `restaurant_reservation`.`restaurants` (
	RestaurantID	INT,
	Location	VARCHAR(25),
	Contact	VARCHAR(11),
	PRIMARY KEY(RestaurantID)
);

CREATE TABLE `restaurant_reservation`.`workers` (
	WorkerID INT,
	FirstName VARCHAR(25) NOT NULL,
	LastName	VARCHAR(25) NOT NULL,
	Title	VARCHAR(25) NOT NULL,
	Current_Location	INT,
	PhoneNumber	VARCHAR(11) NOT NULL,
	Email	VARCHAR(25) NOT NULL,
	PRIMARY KEY(WorkerID),
	FOREIGN KEY(Current_location) REFERENCES restaurants(RestaurantID)
);

CREATE TABLE `restaurant_reservation`.`restaurant_tables` (
	TableNumber	INT,
	Num_Seats	INT NOT NULL,
	Table_Status	VARCHAR(20) NOT NULL,
ResID	INT,
	Assigned_Waiter	INT NOT NULL,
	PRIMARY KEY(TableNumber),
	FOREIGN KEY(Assigned_Waiter) REFERENCES Workers(WorkerID),
	FOREIGN KEY(ResID) REFERENCES restaurants(RestaurantID)
);

CREATE TABLE `restaurant_reservation`.`reservations` (
	ReservationID	INT NOT NULL,
	Customer	INT NOT NULL,
	Reservation_Date	VARCHAR(8) NOT NULL,
	Reservation_Time	VARCHAR(4) NOT NULL,
	Location	INT,
	Party_Size	INT NOT NULL,
	Table_ID	INT NOT NULL,
	PRIMARY KEY(ReservationID),
	FOREIGN KEY(Table_ID) REFERENCES restaurant_tables(TableNumber),
	FOREIGN KEY(Customer) REFERENCES customers(CustomerID),
	FOREIGN KEY(Location) REFERENCES restaurants(RestaurantID)
);

CREATE TABLE `restaurant_reservation`.`promotions` (
	PromotionID	INT NOT NULL,
	Title	VARCHAR(100) NOT NULL,
	Promo_Description	VARCHAR(100),
	Start_Date	VARCHAR(8),
	End_Date	VARCHAR(8),
	Discount_Amount	DECIMAL(3, 2) NOT NULL,
	Is_Active	BOOLEAN NOT NULL,
	PRIMARY KEY(PromotionID)
);

CREATE TABLE `restaurant_reservation`.`menuitem` (
	ItemID	INT NOT NULL,
	ItemName	VARCHAR(25) NOT NULL,
	Item_Description	VARCHAR(100),
	Category	VARCHAR(25) NOT NULL,
	Price	DECIMAL(4, 2) NOT NULL,
	Avaliable BOOLEAN NOT NULL,
	Promotions INT,
	PRIMARY KEY(ItemID),
	FOREIGN KEY(Promotions) REFERENCES promotions(PromotionID)
);

CREATE TABLE `restaurant_reservation`.`orders` (
	OrderID	INT NOT NULL,
	TableID		INT NOT NULL,
	TotalPrice	DECIMAL(5, 2) NOT NULL,
	Restaurant	INT NOT NULL,
	PRIMARY KEY(TotalPrice),
	FOREIGN KEY(TableID) REFERENCES restaurant_tables(TableNumber),
	FOREIGN KEY(Restaurant) REFERENCES restaurants(RestaurantID)
);

CREATE TABLE `restaurant_reservation`.`payment` (
	TransactionID INT NOT NULL,
	LocationID	INT,
	Reservation	INT NOT NULL,
	Amount	DECIMAL(5, 2) NOT NULL,
	Payment_Status	VARCHAR(10) NOT NULL,
	PRIMARY KEY(TransactionID),
	FOREIGN KEY(Reservation) REFERENCES reservations(ReservationID),
	FOREIGN KEY(Amount) REFERENCES orders(TotalPrice),
	FOREIGN KEY(LocationID) REFERENCES restaurants(RestaurantID)
);
