//
//  ShoppingList.swift
//  Shopping List
//
//  Created by Rob Vance on 5/1/20.
//  Copyright © 2020 Lambda School. All rights reserved.
//

import Foundation


struct ShoppingList: Codable, Equatable {
    var itemName: String
    var addedItem: Bool
    
    init(itemName: String) {
        self.itemName = itemName
        addedItem = false
    }
}
