//
//  ShoppingItem.swift
//  Shopping List
//
//  Created by Thomas Cacciatore on 5/10/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import  UIKit

struct  ShoppingItem: Codable, Equatable {
    var image: Data
    var itemName: String
    var hasBeenAdded: Bool
    
    init(image: Data, itemName: String, hasBeenAdded: Bool = false) {
        self.image = image
        self.itemName = itemName
        self.hasBeenAdded = hasBeenAdded
    }
}


