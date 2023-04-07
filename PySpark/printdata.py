from sqlalchemy import Column, ForeignKey, Integer, String
from sqlalchemy.ext.declarative import declarative_base
from sqlalchemy.orm import relationship
from sqlalchemy import create_engine
from sqlalchemy.orm import sessionmaker
from tables import Employee

if __name__ == '__main__':
    engine = create_engine('sqlite:///restaurantmenu.db',echo = True)
    Session = sessionmaker(bind = engine)
    session = Session()
    result = session.query(Employee).all()
    result = result[:5]
    for row in result:
        print("Name: ",row.Emp_name, "Age: ",row.Age,"Salary: ",row.salary,"city: ",row.City,"department: ",row.department.name)
