//
//  Item.swift
//  Shopping List
//
//  Created by Iyin Raphael on 8/10/18.
//  Copyright © 2018 Lambda School. All rights reserved.
//

import Foundation

struct Item: Equatable, Codable {
    
    var name: String
    var itemImage: Data
    var isAdded: Bool
    
    init(name: String, itemImage: Data, isAdded: Bool = false){
        self.name = name
        self.itemImage = itemImage
        self.isAdded = isAdded
    }
}
