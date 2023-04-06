from sqlalchemy import create_engine
from sqlalchemy.orm import sessionmaker

from a_base import Restaurant, Base, MenuItem
if __name__ == '__main__':
    engine = create_engine('sqlite:///restaurantmenu.db')
    Base.metadata.bind = engine
    DBSession = sessionmaker(bind=engine)
    