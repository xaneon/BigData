import psycopg2
from psycopg2 import Error
from getpass import getpass

try:
    connection = psycopg2.connect(user="postgres",
                                  password=getpass(),
                                  host="127.0.0.1",
                                  port="5432",
                                  database="postgres")

    cursor = connection.cursor()

    create_table_query = """" CREATE TABLE mobile
        (ID INT PRIMARY KEY     NOT NULL,
         MODEL  TEXT             NOT NULL,
         PRICE                  REAL);"""

    cursor.execute(create_table_query)
    connection.commit()
    print("Table created.")

except:
    pass