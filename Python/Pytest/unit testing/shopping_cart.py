# -*- coding: utf-8 -*-
"""
Created on Fri Mar 10 17:48:40 2023

@author: neroy
"""

# Shopping cart
# step1 create a project file myshoppingcart.py

from typing import List

class MyshoppingCart:
    def __init__(self,max_size : int) -> None:
        self.items: List[str] = []
        self.max_size = max_size
        pass
    
    def add_to_cart(self,item:str):
        self.items.append(item)
        #try change max_size - 1, max_size - 2
        # unit test will still pass
    
# =============================================================================
#         if self.size_of_cart() == self.max_size:
#             raise OverflowError("cannot add more items")
#         self.items.append(item)
#     
# =============================================================================
    
    def size_of_cart(self) -> int:
        return len(self.items)
        pass
    
    def get_items(self) -> List[str]:
        return self.items
        pass
    
    def get_total_price(self, price_map):
        pass