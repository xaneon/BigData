from sqlalchemy import create_engine
from getpass import getpass
from sqlalchemy import Column, String, Integer, Date
# from base import Base

user = "pyuser"
password = getpass()
port = 3306
dbname = "sqlalchemy"

engine = create_engine(f"mysql+mysqlconnector://{user}:{password}@localhost:{port}/{dbname}",
                       echo=True)

