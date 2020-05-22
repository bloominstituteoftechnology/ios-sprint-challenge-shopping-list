//
//  ShoppingItem.swift
//  Shopping List
//
//  Created by Ian Becker on 5/22/20.
//  Copyright © 2020 Lambda School. All rights reserved.
//

import UIKit

struct ShoppingItem {
    var groceryItem: String
    var hasBeenAdded: Bool
    var image: UIImage
    
    init(groceryItem: String, hasBeenAdded: Bool, imageName: String) {
        self.groceryItem = groceryItem
        self.hasBeenAdded = hasBeenAdded
        self.image = UIImage(named: imageName)!
    }
}
