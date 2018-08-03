//
//  ShoppingItemController.swift
//  Shopping List
//
//  Created by Vuk Radosavljevic on 8/3/18.
//  Copyright © 2018 Lambda School. All rights reserved.
//

import Foundation

class ShoppingItemController {
    
    
    private (set) var shoppingList = [
        ShoppingItem(name: "apple", imageName: "apple"),
        ShoppingItem(name: "grapes", imageName: "grapes"),
        ShoppingItem(name: "milk", imageName: "milk"),
        ShoppingItem(name: "muffin", imageName: "muffin"),
        ShoppingItem(name: "popcorn", imageName: "popcorn"),
        ShoppingItem(name: "soda", imageName: "soda"),
        ShoppingItem(name: "strawberries", imageName: "strawberries")
    ]
    
    func switchAddedToShoppingList(item: ShoppingItem) {
        guard let index = shoppingList.index(of: item) else {return}
        shoppingList[index].addedToShoppingList = !shoppingList[index].addedToShoppingList
    }
    

}
