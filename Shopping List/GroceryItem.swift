//
//  GroceryItem.swift
//  Shopping List
//
//  Created by brian vilchez on 8/23/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import Foundation
struct GroceryItem: Codable, Equatable {
    let GroceryItem:String
    let groceryItemImage: Data
    var hasBeenAdded:Bool 
    
    init(groceryItem: String,groceryitemImage:Data) {
        self.GroceryItem = groceryItem
        self.groceryItemImage = groceryitemImage
        hasBeenAdded = false
    }
}
