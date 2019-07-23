from sqlalchemy import create_engine, MetaData, Table, Column, Integer, String

# engine = create_engine("sqlite:///:memory", echo=True)
# engine = create_engine("sqlite:///test.db", echo=True)
db = create_engine("sqlite:///test.db", echo=False)

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


