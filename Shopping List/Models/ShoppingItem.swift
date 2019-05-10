//
//  ShoppingItem.swift
//  Shopping List
//
//  Created by Jordan Davis on 5/10/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import Foundation

struct ShoppingItem: Codable, Equatable {
    var name: String
    var imageData: Data
    var isOnList: Bool
    
    init(name: String, imageData: Data, isOnList: Bool) {
        self.name = name
        self.imageData = image
        self.isOnList = isOnList
    }
}
