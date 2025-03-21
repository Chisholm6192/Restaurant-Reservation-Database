INSERT INTO restaurant_reservation.customers(CustomerID, FirstName, LastName, Email, PhoneNumber)
VALUES(1, "John", "Smith", "JohnSmith@gmail.com", "6475340987"),
(2, "Ryan", "Smith", "RyanSmith@gmail.com", "9056342354"),
(3, "Mark", "White", "MarkWhite@gmail.com", "9057659876"),
(4, "Michael", "Bishop", "MichaelBishop@gmail.com", "6472345432"),
(5, "Maya", "West", "MayaWest@gmail.com", "4165436754"),
(6, "Luke", "Wilson", "LukeWilson@icloud.com", "6478760987"),
(7, "Jack", "Jones", "JackJones@hotmail.com", "6476438710"),
(8, "Marcus", "Atkinson", "MarcusAtkinson@gmail.com", "4167630938"),
(9, "Ashley", "Black", "AshleyBlack@gmail.com", "6476570092"),
(10, "Alisha", "Simpson", "AlishaSimpson@icloud.com", "9054673254"),
(11, "Melanie", "Brown", "MelanieBrown@outlook.com", "9058889987"),
(12, "Robert", "Evans", "RobEvans@gmail.com", "6473402137"),
(13, "Alex", "Jones", "AlexJones@gmail.com", "4167763398"),
(14, "Josh", "Allen", "JoshAllen17@gmail.com", "4161787177"),
(15, "Tom", "Brady", "TomBrady12@gmail.com", "4161261212"),
(16, "Mackenzie", "David", "MackDavid@gmail.com", "6479729797"),
(17, "Lindsey", "Nagel", "LindseyNagel@outlook.com", "9056474168"),
(18, "Kyle", "Shannahan", "KyleShannahan49@gmail.com", "4164913973"),
(19, "Cameron", "Carson", "CamCarson@outlook.com", "4168760036"),
(20, "Jayden", "Daniels", "JaydenDainels@gmail.com", "6477776654");

INSERT INTO restaurant_reservation.promotions(PromotionID, Title, Promo_Description, Start_Date, End_Date, Discount_Amount, Is_Active)
VALUES
(0, "No Promo", "No Promo", "0", "0", 0.0, FALSE),
(1, "Summer Feast Deal", "20% off all dinner entrees", "20240601", "20240831", 0.20, TRUE),  
(2, "Weekend Breakfast Special", "Free coffee with any breakfast meal", "20240501", "20241231", 5.00, TRUE),  
(3, "Happy Hour", "15% off all drinks from 4-7 PM", "20240115", "20241215", 0.15, TRUE),  
(4, "Valentine's Day Special", "All entrees 25% off", "20240210", "20240215", 0.25, FALSE),  
(5, "Free Birthday Dessert", "Free dessert for birthday guests", "20240101", "20241231", 1.00, TRUE),  
(6, "Family Night Discount", "25% off for families", "20240615", "20240915", 0.25, TRUE),  
(7, "Student Discount", "10% off with valid student ID", "20240101", "20241231", 0.10, TRUE),  
(8, "Thanksgiving Discount", "30% off all menu items", "20241120", "20241128", 0.30, FALSE);  

INSERT INTO restaurant_reservation.menuitem(ItemID, ItemName, Item_Description, Category, Price, Avaliable, promotions)
VALUES
(4001, 'Chocolate Lava Cake', 'Warm chocolate cake with molten center', 'Dessert', 8.99, TRUE, 5),  
(4002, 'Tiramisu', 'Classic Italian dessert with espresso and mascarpone', 'Dessert', 7.99, TRUE, 5),  
(4003, 'New York Cheesecake', 'Creamy cheesecake with berry sauce', 'Dessert', 6.99, TRUE, 5),  
(4004, 'Apple Pie', 'Classic apple pie with cinnamon', 'Dessert', 5.99, TRUE, 5),  
(4006, 'Brownie Sundae', 'Fudge brownie with ice cream and chocolate syrup', 'Dessert', 7.49, TRUE, 5),  
(4007, 'Strawberry Shortcake', 'Fluffy cake with fresh strawberries', 'Dessert', 6.49, TRUE, 5),  
(4008, 'Mango Sticky Rice', 'Sweet mango with coconut-infused sticky rice', 'Dessert', 7.99, TRUE, 5),  
(4009, 'Panna Cotta', 'Vanilla panna cotta with berry compote', 'Dessert', 7.79, TRUE, 5),  
(4010, 'Chocolate Cake', 'White chocolate lava cake', 'Dessert', 9.49, TRUE, 5),  

(4011, 'Grilled Ribeye Steak', '12oz ribeye with garlic butter', 'Main', 29.99, TRUE, 0),  
(4012, 'BBQ Ribs', 'Slow-cooked ribs with smoky BBQ sauce', 'Main', 24.99, TRUE, 0),  
(4013, 'Salmon Fillet', 'Grilled salmon with lemon butter', 'Main', 21.99, TRUE, 0),  
(4014, 'Chicken Parmesan', 'Crispy chicken with marinara and cheese', 'Main', 18.99, TRUE, 0),  
(4015, 'Vegan Stir-Fry', 'Tofu and vegetables in teriyaki sauce', 'Main', 15.99, TRUE, 0),  
(4016, 'Lobster Tail', 'Butter-poached lobster tail', 'Main', 34.99, TRUE, 0),  
(4017, 'Shrimp Scampi', 'Garlic shrimp with linguine pasta', 'Main', 22.49, TRUE, 0),  
(4018, 'Mushroom Risotto', 'Creamy risotto with wild mushrooms', 'Main', 17.99, TRUE, 0),  
(4019, 'Filet Mignon', '8oz filet with red wine reduction', 'Main', 32.99, TRUE, 0),  
(4020, 'Beef Wellington', 'Tenderloin wrapped in puff pastry', 'Main', 36.99, TRUE, 0),  
(4021, 'Pesto Pasta', 'Penne with creamy pesto sauce', 'Main', 14.99, TRUE, 0),  
(4022, 'Fish & Chips', 'Crispy battered cod with fries', 'Main', 16.99, TRUE, 0),  
(4023, 'Korean BBQ Bowl', 'Beef bulgogi with rice and kimchi', 'Main', 18.49, TRUE, 0),  
(4024, 'Stuffed Bell Peppers', 'Quinoa and vegetable-stuffed peppers', 'Main', 13.99, TRUE, 0),  
(4025, 'Margherita Pizza', 'Fresh basil, tomato, and mozzarella', 'Main', 12.99, TRUE, 0),  
(4026, 'Pulled Pork Sandwich', 'BBQ pulled pork on brioche', 'Main', 11.99, TRUE, 0),  
(4027, 'Bison Burger', 'Juicy bison patty with cheddar', 'Main', 14.49, TRUE, 0),  
(4028, 'Eggplant Parmesan', 'Baked eggplant with marinara', 'Main', 16.49, TRUE, 0),  
(4029, 'Chicken Alfredo', 'Fettuccine with creamy Alfredo sauce', 'Main', 17.99, TRUE, 0),  
(4030, 'Seared Duck Breast', 'Duck breast with cherry glaze', 'Main', 28.99, TRUE, 0),  

(4031, 'Bruschetta', 'Grilled bread with tomato and basil', 'Appetizer', 6.99, TRUE, 0),  
(4032, 'Calamari', 'Crispy calamari with marinara', 'Appetizer', 9.99, TRUE, 0),  
(4033, 'Stuffed Mushrooms', 'Mushrooms filled with cheese', 'Appetizer', 7.49, TRUE, 0),  
(4034, 'Buffalo Wings', 'Spicy wings with ranch dip', 'Appetizer', 10.99, TRUE, 0),  
(4035, 'Spinach Artichoke Dip', 'Creamy dip with tortilla chips', 'Appetizer', 8.99, TRUE, 0),  
(4036, 'Caprese Salad', 'Tomato, mozzarella, and balsamic', 'Appetizer', 7.99, TRUE, 0),  
(4037, 'Garlic Bread', 'Toasted garlic bread with butter', 'Appetizer', 5.49, TRUE, 0),  
(4038, 'Crab Cakes', 'Two lump crab cakes with aioli', 'Appetizer', 12.49, TRUE, 0),  
(4039, 'Nachos Supreme', 'Loaded nachos with cheese and jalapeños', 'Appetizer', 11.99, TRUE, 0),  
(4040, 'French Onion Soup', 'Caramelized onions in broth', 'Appetizer', 6.99, TRUE, 0),  

(4041, 'Margarita', 'Classic lime margarita', 'Drink', 9.99, TRUE, 3),  
(4042, 'Old Fashioned', 'Whiskey, bitters, and orange', 'Drink', 10.99, TRUE, 3),  
(4043, 'Mojito', 'Rum, mint, lime, and soda', 'Drink', 8.99, TRUE, 3),  
(4044, 'Espresso Martini', 'Vodka, espresso, and coffee liqueur', 'Drink', 11.49, TRUE, 3),  
(4045, 'Pina Colada', 'Coconut rum, pineapple, and cream', 'Drink', 9.49, TRUE, 3),  
(4046, 'Lemonade', 'Fresh Squeezed lemonade', 'Drink', 4.99, TRUE, 3),  
(4047, 'Iced Tea', 'House-brewed sweet or unsweet tea', 'Drink', 3.99, TRUE, 3),  
(4048, 'Cappuccino', 'Espresso with steamed milk', 'Drink', 5.99, TRUE, 3),  
(4049, 'Red Wine', 'Cabernet Sauvignon', 'Drink', 12.99, TRUE, 3);

INSERT INTO restaurant_reservation.restaurants(RestaurantID, Location, Contact)
VALUES
(1, "Toronto", "4161234567"),
(2, "Mississauga", "4160987665"),
(3, "Brampton", "4164538821"),
(4, "Milton", "9054321122"),
(5, "Oakville", "9056332211"),
(6, "Waterloo", "6475562202"),
(7, "London", "4162230071"),
(8, "Windsor", "4167714302"),
(9, "Oshawa", "6475542745"),
(10, "Markham", "6475670012"), 
(11, "Vaughn", "6471137892"),
(12, "Guelph", "9056639982"),
(13, "Niagara Falls", "4165529826"),
(14, "Buffalo", "7164430525"),
(15, "Ottawa", "6134457612"),
(16, "Barrie", "6472218834"),
(17, "North Bay", "7056648345"),
(18, "Montreal", "514623871"),
(19, "Kingston", "6138762234"),
(20, "Burlington", "4165392986");

INSERT INTO restaurant_reservation.workers(WorkerID, FirstName, LastName, Title, Current_Location, PhoneNumber, Email)
VALUES
(1001, "James", "Cooper", "Manager", 1, "6475678901", "jcooper@gmail.com"),
(1002, "Alex", "Carter", "Chef", 1, "4161234567", "acarter@gmail.com"),
(1003, "Olivia", "Bennett", "Waitress", 1, "6472345678", "obennett@hotmail.com"),
(1004, "Ethan", "Ramirez", "Waiter", 1, "4373456789", "eramirez@yahoo.com"),
(1005, "Sophia", "Mitchell", "Hostess", 1, "4164567890", "smitchell@outlook.com"),
(1006, "Mia", "Flores", "Manager", 2, "4376789012", "mflores@hotmail.com"),
(1007, "Benjamin", "Foster", "Chef", 2, "4167890123", "bfoster@yahoo.com"),
(1008, "Isabella", "Reyes", "Waitress", 2, "6478901234", "ireyes@outlook.com"),
(1009, "Daniel", "Parker", "Waiter", 2, "4379012345", "dparker@gmail.com"),
(1010, "Emma", "Gonzales", "Hostess", 2, "4160123456", "egonzales@hotmail.com"),
(1011, "Lucas", "Rivera", "Manager", 3, "6471236789", "lrivera@yahoo.com"),
(1012, "Ava", "Sanders", "Chef", 3, "4372347890", "asanders@outlook.com"),
(1013, "Noah", "Brooks", "Waiter", 3, "4163458901", "nbrooks@gmail.com"),
(1014, "Lily", "Hernandez", "Waitress", 3, "6474569012", "lhernandez@hotmail.com"),
(1015, "Jacob", "Torres", "Hostess", 3, "4375670123", "jtorres@yahoo.com");

INSERT INTO restaurant_reservation.restaurant_tables(TableNumber, Num_Seats, Table_Status, Assigned_Waiter)
VALUES
(11, 1, "AVAILABLE", 1003),
(12, 1, "RESERVED", 1003),
(13, 1, "RESERVED", 1003),
(14, 1, "RESERVED", 1003),
(15, 1, "RESERVED", 1004),
(16, 1, "RESERVED", 1004),
(17, 1, "RESERVED", 1004),
(18, 1, "RESERVED", 1004),
(21, 2, "AVAILABLE", 1008),
(22, 2, "UNAVAILABLE", 1008),
(23, 2, "AVAILABLE", 1008),
(24, 2, "UNAVAILABLE", 1008),
(25, 2, "AVAILABLE", 1009),
(26, 2, "UNAVAILABLE", 1009),
(27, 2, "UNAVAILABLE", 1009),
(28, 2, "UNAVAILABLE", 1009),
(31, 3, "UNAVAILABLE", 1013),
(32, 3, "AVAILABLE", 1013),
(33, 3, "AVAILABLE", 1013),
(34, 3, "UNAVAILABLE", 1013),
(35, 3, "AVAILABLE", 1014),
(36, 3, "AVAILABLE", 1014),
(37, 3, "RESERVED", 1014),
(38, 3, "AVAILABLE", 1014);

INSERT INTO restaurant_reservation.orders(OrderID, TableID, TotalPrice)
VALUES
(1, 12, 50.45),
(2, 13, 96.45),
(3, 14, 91.95),
(4, 15, 68.45),
(5, 16, 83.95),
(6, 17, 76.95),
(7, 18, 30.47),
(8, 22, 141.43),
(9, 37, 93.92);

INSERT INTO restaurant_reservation.reservations(ReservationID, Customer, Reservation_Date, Reservation_Time, Table_ID, Party_Size)
VALUES
(1, 1, "20250201", "1730", 12, 4),
(2, 2, "20250201", "1800", 13, 3),
(3, 3, "20250201", "1900", 14, 4),
(4, 4, "20250202", "1700", 15, 2),
(5, 5, "20250202", "1830", 16, 2),
(6, 6, "20250202", "2000", 17, 4),
(7, 7, "20250203", "1730", 18, 4),
(8, 8, "20250203", "1830", 22, 4),
(9, 9, "20250203", "1900", 37, 4);

INSERT INTO restaurant_reservation.payment(TransactionID, Reservation, Amount, Payment_Status)
VALUES
(1, 1, 50.45, "SUCCESS"),
(2, 2, 96.45, "SUCCESS"),
(3, 3, 91.95, "SUCCESS"),
(4, 4, 68.45, "SUCCESS"),
(5, 5, 83.95, "SUCCESS"),
(6, 6, 76.95, "SUCCESS"),
(7, 7, 30.47, "SUCCESS"),
(8, 8, 141.43, "SUCCESS"),
(9, 9, 93.92, "SUCCESS");

