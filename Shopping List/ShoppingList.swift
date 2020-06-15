//
//  ShoppingList.swift
//  Shopping List
//
//  Created by Craig Belinfante on 6/14/20.
//  Copyright © 2020 Lambda School. All rights reserved.
//

import UIKit


struct ShoppingList {
    
    var name: String
    var image: UIImage
    var itemAdded: Bool
 
    init (name: String, imageName: UIImage , itemAdded: Bool = false) {
        self.name = name
        self.image = imageName
        self.itemAdded = itemAdded
    }
}

