//
//  ShoppingItem.swift
//  Shopping List
//
//  Created by Gavin Murphy on 10/11/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import Foundation

struct ShoppingItem {
    
    var name: String
    var image: UIImage
    var itemAdded: Bool = false
    
    init(name: String, imageName: String, itemAdded: Bool) {
        self.name = name
        self.image = UIImage(named: imageName)!
        self.itemAdded = itemAdded
    }
}

