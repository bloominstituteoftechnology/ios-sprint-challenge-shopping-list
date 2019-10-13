//
// ShoppingItem.swift
//  Shopping List
//
//  Created by Joseph Rogers on 10/11/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import Foundation

 let itemNames = ["Apple", "Grapes", "Milk", "Muffin", "Popcorn", "Soda", "Strawberries"]

struct ShoppingItem {
    let name: String
    var inShoppingList: Bool
    let image: String
    let selectedImage: String
    
    init(name: String) {
        self.name = name
        self.inShoppingList = false
        self.image = name
        self.selectedImage = "selected\(name)"
    }
}
