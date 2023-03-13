# -*- coding: utf-8 -*-
"""
Created on Fri Mar 10 17:26:51 2023

@author: neroy
"""

# create a file with test_math as prefix
from math_function import add, product

def test_add():
    assert add(9,3) == 12
    assert add(11) == 15
    assert add(3) == 7
    
def test_product():    
    assert product(9,3) == 27
    assert product(11) == 40
    assert product(3) == 12
    