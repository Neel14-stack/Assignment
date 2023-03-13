# -*- coding: utf-8 -*-
"""
Created on Fri Mar 10 17:53:54 2023

@author: neroy
"""

from shopping_cart import MyshoppingCart
# =============================================================================
# 
# def test_add_to_cart():
#     cart = MyshoppingCart(5)
#     cart.add_to_cart('Nike Airforce1')
#     # debugging the code in python using assert
#     assert cart.size_of_cart() == 1
# =============================================================================
    

def test_when_item_added_then_cart_contains_item():
    cart = MyshoppingCart(5)
    cart.add_to_cart("neel")
    # test if product is in cart.get_itms()
    #print('Nike Airforce1' in cart.get_items())
    assert "neel" in cart.get_items()
    
# =============================================================================
# 
# def test_when_add_more_than_max_items_should_fail():
#     # 5 is maximum item
#     cart = MyshoppingCart(5)
#     with pytest.raises(OverflowError):
#         for _ in range(7):
#             cart.add_to_cart('Nike Airforce1')
# 
# =============================================================================
        