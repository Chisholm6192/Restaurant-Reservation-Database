import mysql.connector

mydb = mysql.connector.connect(
    host="localhost",
    user="root",
    password="*******",
    database="restaurant_reservation"
)

mycursor = mydb.cursor()

print("Database Management System")

def get_input():
    print("---------------------------------")
    print("Choose one of the following options:")

    while True:
        print(" 1: DROP TABLE | 2: CREATE TABLE | 3: POPULATE TABLE | 4: QUERY | 5: EXIT")
        try: 
            command = int(input("Enter Command: ")) #get selection from user
            print('\n')

        except: print("\nPLEASE CHOOSE ONE OF THE FOLLOWING COMMANDS: ") #if input is not correct type

        #error handling for input
        if command in range(1,5): break #go to next stage of program
        elif command == 5: quit() #exit
        else: print("PLEASE CHOOSE ONE OF THE FOLLOWING COMMANDS: ") #invalid selection, try again

    return command

def create_table():
    """
    Helper function to create a table using given input for name, variables and keys
    Returns:
    table_name (string) - name of table to be created
    columns (list) - names of columns to be added to table
    """

    table_name = str(input("ENTER NAME OF TABLE TO CREATE: "))
    columns = []

    while True:
        col_name = input("ENTER COLUMN NAME: (OR TYPE 'EXIT' TO FINISH): ") #name of column to create

        if col_name.upper() == 'EXIT':
            break

        col_type = input("ENTER COLUMN DATA TYPE (ex. INT, VARCHAR(10)): ") #select type
        is_primary = input("PRIMARY KEY? (YES/NO): ")
        print('\n')

        column_def = f'{col_name}   {col_type.upper()}' 
        if is_primary.upper() == 'YES':
            column_def += " PRIMARY KEY"

        columns.append(column_def) #add column definition to script

    return table_name, columns

def insert_data():
    """
    Helper function to insert data into a specified table
    Returns:
    table_name (string) - name of the table to insert into
    colums (list) - names of columns to be inserted to
    values (list) - values to be inserted into each column
    """
    table_name = str(input("ENTER NAME OF TABLE: "))
    print('\n')

    #gets list of columns from table
    mycursor.execute(f"SHOW COLUMNS FROM {table_name}")
    columns = [col[0] for col in mycursor.fetchall()]

    values = []
    for col in columns:
        #takes input for value to add to each column
        value = input(f"ENTER VALUE FOR {col}: ")
        values.append(value)

    return values, columns, table_name

def execute_query():
    #List of advanced queries to choose from
    print("WHICH QUERY WOULD YOU LIKE TO RUN: ")
    print(" 1: Find Total Revenue and Average Order Prices for Each Restaurant Location")
    print(" 2: Find Employees Who Haven't Served a Table")
    print(" 3: Find The Most Popular Reservation Time")
    print(" 4: Find Customers Who Have Spent More Than The Average Spent By All Customers")
    print(" 5: List the Reservations That Were Made By Customers Who Have the Same Last Name")
    print(" 6: Find Employees and Their Assigned Restaurant Hierarchy")
    print(" 7: Find the Top 3 Most Reserved and Least Reserved Tables")
    print(" 8: ENTER CUSTOM QUERY")
    print('\n')

    selection = int(input("SELECT QUERY: "))

    
    if(selection == 1): query = "SELECT Location, SUM(orders.TotalPrice) AS TotalRevenue, AVG(orders.TotalPrice) AS AvgOrderPrice FROM orders JOIN restaurants ON Restaurant = RestaurantID GROUP BY Location ORDER BY TotalRevenue DESC;"
    elif(selection == 2): query = "SELECT WorkerID, FirstName, LastName FROM restaurant_reservation.workers EXCEPT SELECT DISTINCT workers.WorkerID, workers.FirstName, workers.LastName FROM restaurant_reservation.workers JOIN restaurant_reservation.restaurant_tables ON workers.WorkerID = restaurant_tables.Assigned_Waiter;"
    elif(selection == 3): query = "SELECT Reservation_Time, COUNT(*) AS ReservationCount, PERCENT_RANK() OVER (ORDER BY COUNT(*) DESC) AS PopularityRank FROM restaurant_reservation.reservations GROUP BY Reservation_Time ORDER BY ReservationCount DESC;"
    elif(selection == 4): query = "SELECT customers.FirstName, customers.LastName, SUM(payment.Amount) AS TotalSpent FROM restaurant_reservation.customers JOIN restaurant_reservation.reservations ON customers.CustomerID = reservations.Customer JOIN restaurant_reservation.payment ON reservations.ReservationID = payment.ReserveID GROUP BY customers.CustomerID, customers.FirstName, customers.LastName HAVING TotalSpent > (SELECT AVG(Amount) FROM restaurant_reservation.payment);"
    elif(selection == 5): query = "SELECT reservations.ReservationID, customers.FirstName, customers.LastName, reservations.Reservation_Date, reservations.Reservation_Time FROM restaurant_reservation.reservations JOIN restaurant_reservation.customers ON reservations.Customer = customers.CustomerID JOIN restaurant_reservation.customers c2 ON customers.LastName = c2.LastName AND customers.CustomerID <> c2.CustomerID ORDER BY customers.LastName, reservations.Reservation_Date;"
    elif(selection == 6): query = "WITH RECURSIVE EmployeeHierarchy AS (SELECT workers.WorkerID, workers.FirstName, workers.LastName, workers.Title, restaurants.Location AS Restaurant, 1 AS Level FROM restaurant_reservation.workers JOIN restaurant_reservation.restaurants ON workers.Current_Location = restaurants.RestaurantID UNION ALL SELECT workers.WorkerID, workers.FirstName, workers.LastName, workers.Title, restaurants.Location, EmployeeHierarchy.Level + 1 FROM restaurant_reservation.workers JOIN EmployeeHierarchy ON workers.Current_Location = EmployeeHierarchy.WorkerID JOIN restaurant_reservation.restaurants ON workers.Current_Location = restaurants.RestaurantID) SELECT * FROM EmployeeHierarchy;"
    elif(selection == 7): query = "WITH TableReservations AS (SELECT Table_ID, COUNT(*) AS ReservationCount FROM restaurant_reservation.reservations GROUP BY Table_ID), RankedTables AS (SELECT Table_ID, ReservationCount, RANK() OVER (ORDER BY ReservationCount DESC) AS MostReservedRank, RANK() OVER (ORDER BY ReservationCount ASC) AS LeastReservedRank FROM TableReservations) SELECT Table_ID, ReservationCount, 'Most Reserved' AS Category FROM RankedTables WHERE MostReservedRank <= 3 UNION ALL SELECT Table_ID, ReservationCount, 'Least Reserved' AS Category FROM RankedTables WHERE LeastReservedRank <= 3;"
    if(selection == 8): query = str(input("ENTER QUERY: "))
    
    print('\n')

    try: mycursor.execute(query)
    except: print("FAILED TO EXECUTE QUERY")    

    #constructs a table to display query results
    results = mycursor.fetchall()
    columns = [desc[0] for desc in mycursor.description]
    print("QUERY RESULTS: ")
    print(" | ".join(columns))
    print("-" * (len(" | ".join(columns)) + 5))

    for row in results:
        print(" | ".join(str(item) for item in row))

    print('\n')
    mydb.commit()
    print("QUERY EXECUTED SUCCESSFULLY")

    return

command = get_input()

if command in range(1,5): #if choice is valid
    while(command != 5):
        if(command == 1): #if DROP is selected
            table_name = str(input("ENTER NAME OF TABLE TO DROP: "))
            print('\n')

            try: #if table exists
                mycursor.execute(f'DROP TABLE {table_name}')
                print("TABLE SUCCESSFULLY DROPPED")

            except: print("FAILED TO DROP TABLE")
            print('\n')

        elif(command == 2): #if CREATE is selected
            table_name, columns = create_table()

            try:
                mycursor.execute(f"CREATE TABLE IF NOT EXISTS {table_name} ({', '.join(columns)});")
                print("TABLE SUCCESSFULLY CREATED")

            except: print("FAILED TO CREATE TABLE")
            print('\n')

        elif(command == 3): #if POPULATE is chosen
            values, columns, table_name = insert_data()

            if(len(values) == len(columns)): #number of data entries must match number of columns
                try: #if table exists
                    insert_string = (f"INSERT INTO {table_name} ({', '.join(columns)}) VALUES ({', '.join(['%s'] * len(columns))})")
                    mycursor.execute(insert_string, tuple(values))
                    mydb.commit()

                    print("SUCCESSFULLY POPULATED TABLE")

                except: print('FAILED TO POPULATE TABLE')

            print('\n')

        elif(command == 4):
            execute_query()


        command = get_input()
