//
//  ShoppingItem.swift
//  Shopping List
//
//  Created by Stuart on 1/18/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import Foundation

class ShoppingItem {
    var name: String
    var imageData: Data
    var isInShoppingList: Bool
    
    init(name: String, imageData: Data, isInShoppingList: Bool = false) {
        self.name = name
        self.imageData = imageData
        self.isInShoppingList = isInShoppingList
    }
}
