from sqlalchemy import create_engine
from sqlalchemy.orm import sessionmaker

from a_base import Restaurant, Base, MenuItem
if __name__ == '__main__':
    engine = create_engine('sqlite:///restaurantmenu.db')
    Base.metadata.bind = engine
    DBSession = sessionmaker(bind=engine)
    session = DBSession()

    #menu for urbanburger
    restaurant1 = Restaurant(name = "Urban Burger")

    session.add(restaurant1)
    session.commit()

    menuItem2 = MenuItem(name="Veggie Burger", description="Juicy grilled veggie patty", price="$7.58",course="Entree",restaurant=restaurant1)
    session.add(menuItem2)
    session.commit()