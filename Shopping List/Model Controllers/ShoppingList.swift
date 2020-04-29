//
//  ShoppingModel.swift
//  Shopping List
//
//  Created by Nonye on 4/24/20.
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
