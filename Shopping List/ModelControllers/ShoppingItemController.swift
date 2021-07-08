//
//  ShoppingItemController.swift
//  Shopping List
//
//  Created by Carolyn Lea on 8/3/18.
//  Copyright © 2018 Lambda School. All rights reserved.
//

import Foundation

class ShoppingItemController
{
    //private(set) var shoppingItems: [ShoppingItem] = []
    
    private(set) var shoppingItems: [ShoppingItem] = [
        ShoppingItem(itemName: "apple", iconName: "apple"),
        ShoppingItem(itemName: "grapes", iconName: "grapes"),
        ShoppingItem(itemName: "milk", iconName: "milk"),
        ShoppingItem(itemName: "muffin", iconName: "muffin"),
        ShoppingItem(itemName: "popcorn", iconName: "popcorn"),
        ShoppingItem(itemName: "soda", iconName: "soda"),
        ShoppingItem(itemName: "strawberries", iconName: "strawberries")
    ]
    
    var selectedItems: [ShoppingItem]
    {
        return shoppingItems.filter({ $0.itemAdded == true })
    }
    
    var unselectedItems: [ShoppingItem]
    {
        return shoppingItems.filter ({ $0.itemAdded == false })
    }
    
    func updateItemAdded(for shoppingItem: ShoppingItem)
    {
        guard let index = shoppingItems.index(of: shoppingItem) else {return}
        shoppingItems[index].itemAdded = !shoppingItems[index].itemAdded
    }
    
}
