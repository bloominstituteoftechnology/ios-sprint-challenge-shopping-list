//
//  ShoppingItem.swift
//  Shopping List
//
//  Created by Dustin Koch on 1/18/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import UIKit

struct ShoppingItem {
    var image: UIImage
    var nameOfItem: String
    var addedToCart: Bool
    
    init(image: String, nameOfItem: String, addedToCart: Bool = true) {
        self.image = UIImage(named: image)!
        self.nameOfItem = nameOfItem
        self.addedToCart = addedToCart
    }
}
