//
//  ShoppingItemController.swift
//  Shopping List
//
//  Created by Vuk Radosavljevic on 8/3/18.
//  Copyright © 2018 Lambda School. All rights reserved.
//

import Foundation

class ShoppingItemController {
    
    //MARK: - PROPERTIES
    var itemsThatAreAdded: Int {
        var count = 0
        for item in shoppingList {
            if item.addedToShoppingList {
                count += 1
            }
        }
        return count
    }
    
    
    private (set) var shoppingList = [
        ShoppingItem(name: "apple", imageName: "apple"),
        ShoppingItem(name: "grapes", imageName: "grapes"),
        ShoppingItem(name: "milk", imageName: "milk"),
        ShoppingItem(name: "muffin", imageName: "muffin"),
        ShoppingItem(name: "popcorn", imageName: "popcorn"),
        ShoppingItem(name: "soda", imageName: "soda"),
        ShoppingItem(name: "strawberries", imageName: "strawberries")
    ]
    
    var addedShoppingList: [ShoppingItem] {
        return shoppingList.filter { $0.addedToShoppingList }
    }
    
    var notAddedShoppingList: [ShoppingItem] { return shoppingList.filter { !$0.addedToShoppingList}}
    
    var sortedShoppingList: [ShoppingItem] {
        return addedShoppingList + notAddedShoppingList
    }
    
    //MARK: - METHODS
    func switchAddedToShoppingList(item: ShoppingItem) {
        guard let index = shoppingList.index(of: item) else {return}
        shoppingList[index].addedToShoppingList = !shoppingList[index].addedToShoppingList
    }
    
}
