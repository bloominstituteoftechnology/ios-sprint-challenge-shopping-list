//
//  ShoppingItem.swift
//  Shopping List
//
//  Created by Vijay Das on 1/25/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import UIKit

struct ShoppingItem: Equatable, Codable {
    
    // Properties
    
    var image: String
    var name: String
    var isAdded: Bool
    
    // initializer
    
    init(image: String, name: String, isAdded: Bool = false) {
        self.image = image
        self.name = name
        self.isAdded = isAdded
        
        
    }
    
    
}
