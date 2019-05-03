//
//  ShoppingItem.swift
//  Shopping List
//
//  Created by Alex Perse on 5/3/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import Foundation

struct ShoppingItem: Codable, Equatable {
    var imageData: Data
    var title: String
    var addedToShoppingList: Bool = false
    
    init(imageData: Data, title: String, addedToShoppingList: Bool) {
        self.imageData = imageData
        self.title = title
        self.addedToShoppingList = addedToShoppingList
    }
}


