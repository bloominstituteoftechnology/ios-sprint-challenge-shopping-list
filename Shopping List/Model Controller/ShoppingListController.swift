//
//  ShoppingListController.swift
//  Shopping List
//
//  Created by Sameera Roussi on 5/3/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import UIKit

class ShoppingListController {
    
    // MARK: - Properties
    
    let pickedItemsKey: String = "PickedItemsKey"
    
    var pickedItems: [Bool] = []

    var shoppingItems = [
        ShoppingItem(imageName: "apple", itemName: "apple", itemOrdered: false),
        ShoppingItem(imageName: "grapes", itemName: "grapes", itemOrdered: false),
        ShoppingItem(imageName: "milk", itemName: "milk", itemOrdered: false),
        ShoppingItem(imageName: "muffin", itemName: "muffin", itemOrdered: false),
        ShoppingItem(imageName: "popcorn", itemName: "popcorn", itemOrdered: false),
        ShoppingItem(imageName: "soda", itemName: "soda", itemOrdered: false),
        ShoppingItem(imageName: "strawberries", itemName: "strawberries", itemOrdered: false),
        ]
    
    func saveItemOrdered() {
        // Clear the UserDefaults for the pickedItemsKey
        UserDefaults.standard.set(nil, forKey: pickedItemsKey)
        pickedItems = []
        
        // Get the items ordered
        for items in shoppingItems {
            pickedItems.append(items.itemOrdered)
        }
        
        //Now saved the shopping items
        UserDefaults.standard.set(pickedItems, forKey: pickedItemsKey)
    }
    
    func restoreItemOrdered() {
        if let savedItems = UserDefaults.standard.array(forKey: pickedItemsKey) {
            for index in 0 ..< shoppingItems.count {
                shoppingItems[index].itemOrdered = savedItems[index] as! Bool
            }
        } else {
            return
        }
    }

}
