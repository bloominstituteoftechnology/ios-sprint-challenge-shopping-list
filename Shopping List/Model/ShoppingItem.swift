//
//  ShoppingItem.swift
//  Shopping List
//
//  Created by Lisa Sampson on 5/3/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import Foundation

struct ShoppingItem: Equatable, Codable {
    
    var image: String
    var item: String
    var isAdded: Bool
    
    init(image: String,  item: String, isAdded: Bool = false) {
        self.image = image
        self.item = item
        self.isAdded = isAdded
    }
}
