from sqlalchemy import Column, ForeignKey, Integer, String
from sqlalchemy.ext.declarative import declarative_base
from sqlalchemy.orm import relationship
from sqlalchemy import create_engine
from sqlalchemy.orm import sessionmaker
from a_base import MenuItem

if __name__ == '__main__':
    engine = create_engine('sqlite:///restaurantmenu.db',echo = True)
    Session = sessionmaker(bind = engine)
    session = Session()
    result = session.query(MenuItem).all()
    result = result[:5]
    for row in result:
        print("Name: ",row.name, "Description: ",row.description,"Restaurant ID: ",row.restaurant_id)
