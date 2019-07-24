import os
import time
from sqlalchemy import create_engine, MetaData, Table, Column, Integer, String

fname = "test.db"

os.remove(f"{fname}")

time.sleep(.5)

db = create_engine(f"sqlite:///{fname}", echo=False)

metadata = MetaData(db)

# create the database
users = Table("users", metadata,
              Column("user_id", Integer, primary_key=True),
              Column("name", String(40)),
              Column("age", Integer),
              Column("password", String))
users.create()

# insert some users
i = users.insert()
i.execute(name="Mary", age=30, password="secret")
user_dicts = ({"name": "John", "age": 42},
              {"name": "Susan", "age": 57},
              {"name": "Carl", "age": 33})
i.execute(*user_dicts)

s = users.select()
rs = s.execute()

row = rs.fetchone()
print(row)  # the whole row
print("ID", row[0])
print("Name:", row["name"])
print("Age:", row.age)
print("Password:", row[users.c.password])

for row in rs:
    print(row.name, "is", row.age, "years old")

