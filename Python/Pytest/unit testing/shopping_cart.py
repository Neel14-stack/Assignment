# -*- coding: utf-8 -*-
"""
Created on Fri Mar 10 17:48:40 2023

@author: neroy
"""

# Shopping cart
# step1 create a project file myshoppingcart.py

from typing import List

class MyshoppingCart:
    def __init__(self) -> None:
        self.items: List[str] = []
        pass
    
    def add_to_cart(self,item:str):
        self.items.append(item)
        pass
    
    def size_of_cart(self) -> int:
        return len(self.items)
        pass
    
    def get_items(self) -> List[str]:
        pass
    
    def get_total_price(self, price_map):
        pass