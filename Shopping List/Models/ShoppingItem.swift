//
//  ShoppingItem.swift
//  Shopping List
//
//  Created by Scott Bennett on 9/14/18.
//  Copyright © 2018 Lambda School. All rights reserved.
//

import Foundation

struct ShoppingItem: Equatable, Codable {
    var itemName: String
    var addToList: Bool
    var imageData: Data
    
    init(itemName: String, addedToList: Bool, imageData: Data) {
        self.itemName = itemName
        self.addToList = false
        self.imageData = imageData
    }
}
