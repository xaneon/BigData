from sqlalchemy import create_engine
from getpass import getpass

user = "postgres"
dbname = "postgres"
port = 5432
password = getpass()

db_string = f"postgresql+psycopg2://{user}:{password}@localhost:{port}/{dbname}"

db = create_engine(db_string)

create_query = "CREATE TABLE IF NOT EXISTS films (title text, director text, year text)"
db.execute(create_query)

insert_query = "INSERT INTO films (title, director, year) VALUES ('Doctor Strange', 'Scott Derrickson', '2016')"
db.execute(insert_query)

# read
results = db.execute("SELECT * FROM films")
for r in results:
    print(r)