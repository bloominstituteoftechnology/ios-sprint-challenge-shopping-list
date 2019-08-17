//
//  ShoppingItem.swift
//  Shopping List
//
//  Created by John Kouris on 8/17/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import UIKit

struct ShoppingItem {
    var name: String
    var hasBeenAdded: Bool
    var image: UIImage
    
    init(name: String, hasBeenAdded: Bool, imageName: String) {
        self.name = name
        self.hasBeenAdded = hasBeenAdded
        self.image = UIImage(named: imageName)!
    }
}
