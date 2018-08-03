//
//  ShoppingItem.swift
//  Shopping List
//
//  Created by David Oliver Doswell on 8/3/18.
//  Copyright © 2018 Lambda School. All rights reserved.
//

import Foundation

struct ShoppingItem: Equatable, Codable {
    var itemImage: Data
    var itemName: String
    var hasBeenAdded: Bool = false
    
    init(itemImage: Data, itemName: String, hasBeenAdded: Bool = false) {
        self.itemImage = itemImage
        self.itemName = itemName
    }
}
