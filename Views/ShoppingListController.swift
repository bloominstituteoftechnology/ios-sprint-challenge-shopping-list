//
//  ShoppingListController.swift
//  Shopping List
//
//  Created by Lambda_School_Loaner_167 on 8/24/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import Foundation


//"Apples", "Grapes", "Milk", "Muffin", "Popcorn", "Soda",  "Strawberries"],



class  ShoppingListController {
    var shoppingListItems: [shoppingItem] {
        
        let result = [
        shoppingItem(nameOfShoppingItems: "Apples", addedShoppingItems: false),
        shoppingItem(nameOfShoppingItems: "Grapes", addedShoppingItems: false),
        shoppingItem(nameOfShoppingItems: "Milk", addedShoppingItems: false),
        shoppingItem(nameOfShoppingItems: "Muffin", addedShoppingItems: false),
        shoppingItem(nameOfShoppingItems: "Popcorn", addedShoppingItems: false),
        shoppingItem(nameOfShoppingItems: "Soda", addedShoppingItems: false),
        shoppingItem(nameOfShoppingItems: "Strawberries", addedShoppingItems: false),
        
    ]
        
        return result
}
    
    
}
