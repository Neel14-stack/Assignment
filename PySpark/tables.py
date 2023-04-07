import os
import sys
from sqlalchemy import Column, ForeignKey, Integer, String
from sqlalchemy.ext.declarative import declarative_base
from sqlalchemy.orm import relationship
from sqlalchemy import create_engine

Base = declarative_base()

# class as a table name in case of ORM
class Department(Base):
    __tablename__ = 'department'

    name = Column(String(80), nullable=False)
    id = Column(Integer, primary_key=True)
    description = Column(String(250))
    # price = Column(String(8))
    # course = Column(String(250))
    # restaurant_id = Column(Integer, ForeignKey('restaurant.id'))
    # restaurant = relationship(Restaurant)

class Employee(Base):
    __tablename__ = 'employee'

    Emp_id = Column(Integer, primary_key=True)
    Emp_name = Column(String(250), nullable=False)
    Age = Column(Integer)
    salary = Column(String(10))
    City = Column(String(50))
    Dept_id = Column(Integer,ForeignKey('department.id'))
    department = relationship(Department)


if __name__ == '__main__':
    engine = create_engine('sqlite:///restaurantmenu.db')
    Base.metadata.create_all(engine)