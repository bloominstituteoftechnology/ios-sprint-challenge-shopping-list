//
//  ShoppingItem.swift
//  Shopping List
//
//  Created by macbook on 9/20/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import Foundation

class ShoppingItem: Codable {
    var name: String
    var isAdded: Bool = false
    //var imageData: Data
    
    init(name: String, isAdded: Bool) {
        self.name = name
        self.isAdded = isAdded
        //self.imageData = imageData
    }
}


