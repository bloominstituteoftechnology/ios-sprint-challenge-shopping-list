//
//  ShoppingItemController.swift
//  Shopping List
//
//  Created by Waseem Idelbi on 12/15/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import Foundation


class ShoppingItemController {
    

let itemNames = ["Apple", "Grapes", "Milk", "Muffin", "Popcorn", "Soda", "Strawberries"]

var Items: [Item] = []

    func addItem() {
        
        for item in itemNames {
            let itemInstance = Item(name: item, itemWasAdded: false)
            Items.append(itemInstance)
        }
        PropertyListEncoder
    }
}
