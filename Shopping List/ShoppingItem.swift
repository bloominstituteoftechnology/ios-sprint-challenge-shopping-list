//
//  ShoppingItem.swift
//  Shopping List
//
//  Created by Mark Gerrior on 2/28/20.
//  Copyright © 2020 Lambda School. All rights reserved.
//

import Foundation

struct ShoppingItem: Equatable, Codable {
    var itemName: String
    var onShoppingList: Bool
    
    // It's a UIImage but needs to be persitant
    // FIXME: make a computed property that initializes a UIImage from the name of the item
    var pic: Data
}
