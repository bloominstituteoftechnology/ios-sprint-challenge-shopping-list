//
//  ItemController.swift
//  Shopping List
//
//  Created by Lambda_School_loaner_226 on 11/15/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import UIKit

class ItemController
{
        
    var items: [ShoppingItem]
    {
        var shoppingCart = [ShoppingItem(name: "Apple"),
                            ShoppingItem(name: "Grapes"),
                            ShoppingItem(name: "Milk"),
                            ShoppingItem(name: "Muffin"),
                            ShoppingItem(name: "Popcorn"),
                            ShoppingItem(name: "Soda"),
                            ShoppingItem(name: "Strawberries")]
        
        return shoppingCart
    }
}
