import psycopg2
from getpass import getpass

try:
    connection = psycopg2.connect(user="postgres",
                                  password=getpass(),
                                  host="127.0.0.1",
                                  port="5432",
                                  database="postgres")
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
