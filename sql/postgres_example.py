import psycopg2

try:
    connection = psycopg2.connect(user="sysadmin",
                                  password="asdffdsa",
                                  host="127.0.0.1",
                                  port="5432",
                                  database="postgrew_db")
    cursor = connection.cursor()
    print(connection.get_dsn_parameters(), "\n")

    cursor.execute("SELECT version();")
    record = cursor.fetchone()
    print("You are connection to - ", record, "\n")

except (Error, psycopg2.Error) as error:
    print("Error: ", error)
finally:
    if connection:
        cursor.close()
        connection.close()
        print("PostgreSQL connection is closed")
