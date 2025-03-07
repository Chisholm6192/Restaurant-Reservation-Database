import mysql.connector

mydb = mysql.connector.connect(
    host="localhost",
    user="root",
    password="Winterhawks1",
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
    query = str(input("ENTER QUERY: "))
    print('\n')

    try: mycursor.execute(query)
    except: print("FAILED TO EXECUTE QUERY")

    if query.strip().upper().startswith("SELECT"):
        results = mycursor.fetchall()
        columns = [desc[0] for desc in mycursor.description]
        print("QUERY RESULTS: ")
        print(" | ".join(columns))
        print("-" * (len(" | ".join(columns)) + 5))

        for row in results:
            print(" | ".join(str(item) for item in row))

        print('\n')

    else:
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
            """table_name = str(input("WHICH TABLE WOULD YOU LIKE TO POPULATE: "))
            print('\n')

            #gets list of columns from table
            mycursor.execute(f"SHOW COLUMNS FROM {table_name}")
            columns = [col[0] for col in mycursor.fetchall()]

            values = []
            for col in columns:
                #takes input for value to add to each column
                value = input(f"ENTER VALUE FOR {col}: ")
                values.append(value)"""
            
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
            """query = str(input("ENTER QUERY: "))
            print('\n')

            try: mycursor.execute(query)

            except: print("FAILED TO EXECUTE QUERY")"""
            execute_query()


        command = get_input()

        



#mycursor.execute(command)
