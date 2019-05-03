//
//  ShoppingItem.swift
//  Shopping List
//
//  Created by Thomas Cacciatore on 5/3/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import UIKit

struct ShoppingItem: Codable, Equatable {
    var image: Data
    var itemName: String
    var addedToList: Bool
    
    init(image: Data, itemName: String, addedToList: Bool = false) {
       
        self.image = image
        self.itemName = itemName
        self.addedToList = addedToList
    }
}
