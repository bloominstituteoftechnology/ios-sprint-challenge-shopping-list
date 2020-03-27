//
//  ShoppingModel.swift
//  Shopping List
//
//  Created by Mark Poggi on 3/27/20.
//  Copyright © 2020 Lambda School. All rights reserved.
//

import Foundation


struct ShoppingList: Codable {
    
    var itemName: String
    var itemAdded: Bool
    
    
    
    init(itemName: String, itemAdded: Bool) {
        self.itemName = itemName
        self.itemAdded = itemAdded
    }
    
}
