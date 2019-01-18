//
//  ShoppingItem.swift
//  Shopping List
//
//  Created by Vijay Das on 1/18/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import UIKit

struct ShoppingItem: Codable {
    
    var item: String
    var imageData: Data
    var isAdded: Bool
    
    
    init(item: String, imageData: Data, isAdded: Bool) {
        self.item = item
        self.imageData = imageData
        self.isAdded = isAdded
    }
    
}
