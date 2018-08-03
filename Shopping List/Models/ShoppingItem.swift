//
//  ShoppingItem.swift
//  Shopping List
//
//  Created by David Oliver Doswell on 8/3/18.
//  Copyright © 2018 Lambda School. All rights reserved.
//

import Foundation

// initialize a data model that conforms to `Equatable` and `Codable`

struct ShoppingItem: Equatable, Codable {
    var itemImage: Data
    var itemName: String
    var hasBeenAdded: Bool = false
    
    init(itemImage: Data, itemName: String, hasBeenAdded: Bool = false) {
        self.itemImage = itemImage
        self.itemName = itemName
    }
}

struct ShoppingList {
    let itemNames = ["apple", "grapes", "milk", "muffin", "popcorn", "soda", "strawberries"]
}

