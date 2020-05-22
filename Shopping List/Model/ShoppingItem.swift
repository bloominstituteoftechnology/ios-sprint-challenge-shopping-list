//
//  ShoppingItem.swift
//  Shopping List
//
//  Created by Bryan Cress on 5/22/20.
//  Copyright © 2020 Lambda School. All rights reserved.
//

import UIKit

struct ShoppingItem {
    var name: String
    var addedToCart: Bool = false
    var image: UIImage
    
    init(name: String, addedToCart: Bool, imageName: String) {
        self.name = name
        self.addedToCart = addedToCart
        self.image = UIImage(named: imageName)!
    }
}
