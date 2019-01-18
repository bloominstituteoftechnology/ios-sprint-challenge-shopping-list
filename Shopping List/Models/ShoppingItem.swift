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
    
    
    init(item: String, imageName: String, isAdded: Bool) {
        self.item = item
        self.image = UIImage(named: imageName)!
        self.isAdded = isAdded
    }
    
}
