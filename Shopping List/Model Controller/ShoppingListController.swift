//
//  ShoppingListController.swift
//  Shopping List
//
//  Created by Sammy Alvarado on 5/1/20.
//  Copyright © 2020 Lambda School. All rights reserved.
//

import Foundation

class ShoppingListItems {
    var items: [ShoppingItem] {
        
       var items = [
        ShoppingItem(didSelectItemAt: Bool, itemImage: "Apple", itemNames: "apple"),
        ShoppingItem(didSelectItemAt: Bool, itemImage: "Grapes", itemNames: "grapes"),
        ShoppingItem(didSelectItemAt: Bool, itemImage: "Milk", itemNames: "milk"),
        ShoppingItem(didSelectItemAt: Bool, itemImage: "Muffin", itemNames: "muffin"),
        ShoppingItem(didSelectItemAt: Bool, itemImage: "Popcorn", itemNames: "popcorn"),
        ShoppingItem(didSelectItemAt: Bool, itemImage: "Soda", itemNames: "soda"),
        ShoppingItem(didSelectItemAt: Bool, itemImage: "Strawberries", itemNames: "strawberries"),
        ]
        if UserDefaults.standard.bool(forKey: <#T##String#>)
    }
}
