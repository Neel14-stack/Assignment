from sqlalchemy import create_engine
from sqlalchemy.orm import sessionmaker

from tables import Employee, Base, Department
if __name__ == '__main__':
    engine = create_engine('sqlite:///restaurantmenu.db')
    Base.metadata.bind = engine
    DBSession = sessionmaker(bind=engine)
    session = DBSession()

    #menu for urbanburger
    department1 = Department(name = "Data Insights")

    session.add(department1)
    session.commit()

    employee1 = Employee(Emp_name="David", Age=25, salary="20,000",City="Hyderbad",department=department1)
    session.add(employee1)
    session.commit()

    employee2 = Employee(Emp_name="Blue", Age=26, salary="40,000",City="Pune",department=department1)
    session.add(employee2)
    session.commit()

    employee3 = Employee(Emp_name="Drakula", Age=45, salary="60,000",City="Karnatak",department=department1)
    session.add(employee2)

    session.commit()