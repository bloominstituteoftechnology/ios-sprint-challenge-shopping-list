//
//  ShoppingItem.swift
//  Shopping List
//
//  Created by Andrew Ruiz on 7/26/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import UIKit

struct ShoppingItem {
    
    var shoppingItem: String = "Apple"
    var itemAdded: Bool
    var imageName: UIImage
    
    
    init(shoppingItem: String, itemAdded: Bool, imageName: String) {
        self.shoppingItem = shoppingItem
        self.itemAdded = itemAdded
        self.imageName = UIImage(named: imageName)!
    }
}
