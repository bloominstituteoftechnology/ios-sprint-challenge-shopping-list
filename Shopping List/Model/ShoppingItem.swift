//
//  ShoppingItem.swift
//  Shopping List
//
//  Created by John Kouris on 8/17/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import UIKit

struct ShoppingItem: Equatable, Codable {
    var name: String
    var hasBeenAdded: Bool
    var image: String
    
    init(name: String, hasBeenAdded: Bool = false, imageName: String) {
        self.name = name
        self.hasBeenAdded = hasBeenAdded
        self.image = imageName
    }
}
