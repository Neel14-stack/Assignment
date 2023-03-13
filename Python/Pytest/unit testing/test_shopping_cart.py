# -*- coding: utf-8 -*-
"""
Created on Fri Mar 10 17:53:54 2023

@author: neroy
"""

from shopping_cart import MyshoppingCart

def test_add_to_cart():
    cart = MyshoppingCart()
    cart.add_to_cart('Nike Airforce')
    assert cart.size_of_cart() == 1