//
//  ShoppingItem.swift
//  Shopping List
//
//  Created by Nathanael Youngren on 1/18/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import UIKit

struct ShoppingItem: Equatable, Codable {
    var image: String
    var name: String
    var isAdded: Bool
    
    init(image: String, name: String, isAdded: Bool = false) {
        self.image = image
        self.name = name
        self.isAdded = isAdded
    }
}


