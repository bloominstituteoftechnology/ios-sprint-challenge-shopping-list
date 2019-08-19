//
//  ItemController.swift
//  Shopping List
//
//  Created by Aaron on 8/18/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import Foundation

class ItemController {
    
    let cell = ShoppingListCollectionViewCell()
    
    var shoppingItems: [ShoppingItem] {
        
    var items =  [
        
        ShoppingItem(name: "Apple", addedToList: true, image: "Apple"),
        ShoppingItem(name: "Grapes", addedToList: true, image: "Grapes"),
        ShoppingItem(name: "Milk", addedToList: true, image: "Milk"),
        ShoppingItem(name: "Muffin", addedToList: true, image: "Muffin"),
        ShoppingItem(name: "Popcorn", addedToList: true, image: "Popcorn"),
        ShoppingItem(name: "Soda", addedToList: true, image: "Soda"),
        ShoppingItem(name: "Strawberries", addedToList: true, image: "Strawberries")

        ]
 return items
        }
    
    
    
    
}

