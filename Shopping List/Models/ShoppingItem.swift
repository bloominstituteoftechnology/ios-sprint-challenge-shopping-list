//
//  ShoppingItem.swift
//  Shopping List
//
//  Created by Chris Price on 12/14/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import Foundation

class ShoppingItem: Codable {
    var itemName: String
    var wasAdded: Bool = false
    
    init(itemName: String) {
        self.itemName = itemName
    }
}


