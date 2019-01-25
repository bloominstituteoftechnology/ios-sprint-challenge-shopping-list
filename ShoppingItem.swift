//
//  ShoppingItem.swift
//  Shopping List
//
//  Created by Stuart on 1/25/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import UIKit

struct shoppingItem {
    var image: UIImage
    var name: String
    var hasBeenAdded: Bool
    
    init(image: UIImage, name: String, hasBeenAdded: Bool = false) {
        self.image = image
        self.name = name
        self.hasBeenAdded = hasBeenAdded
    }
}
