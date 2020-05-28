//
//  ShoppingItem.swift
//  Shopping List
//
//  Created by Ciara Beitel on 8/23/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import Foundation

struct ShoppingItem: Codable {
    var itemName: String
    var addedToList: Bool
    var image: String
    
    init(itemName: String, addedToList: Bool = false, image: String) {
        self.itemName = itemName
        self.addedToList = addedToList
        self.image = image
    }
}
