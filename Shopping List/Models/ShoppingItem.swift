//
//  ShoppingItem.swift
//  Shopping List
//
//  Created by Vijay Das on 1/18/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import UIKit

struct ShoppingItem {
    
    var item: String
    var image: UIImage
    var isAdded: Bool
    
    
    init(item: String, image: UIImage, isAdded: Bool) {
        self.item = item
        self.image = image
        self.isAdded = isAdded
    }
    
}
