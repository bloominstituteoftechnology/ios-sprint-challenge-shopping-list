//
//  ShoppingItemController.swift
//  Shopping List
//
//  Created by admin on 7/26/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import Foundation

class ShoppingItemController {
    var items: [ShoppingItem] {
        
        let itemNames = ["Apple", "Grapes", "Milk", "Muffin", "Popcorn", "Soda", "Strawberries"]
        
        let showItems = UserDefaults.standard.bool(forKey: .showItemsKey)
    }
    return itemNames
}
