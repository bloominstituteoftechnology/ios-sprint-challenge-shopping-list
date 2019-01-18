//
//  ShoppingItem.swift
//  ShoppingList Challenge
//
//  Created by Michael Flowers on 1/18/19.
//  Copyright © 2019 Michael Flowers. All rights reserved.
//

import Foundation

struct ShoppingItem {
    var item: String
    var isAdded: Bool
    
    init(item: String, isAdded: Bool = true){
        self.item = item
        self.isAdded = isAdded
    }
}
