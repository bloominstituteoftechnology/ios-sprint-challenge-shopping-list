//
//  ShoppingItem.swift
//  Shopping List
//
//  Created by Jesse Ruiz on 9/20/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import UIKit

struct ShoppingItem {
    var name: String
    var image: UIImage
    var hasBeenAdded: Bool
    
    init(name: String, imageName: String, hasBeenAdded: Bool = false) {
        self.name = name
        self.image = UIImage(named: imageName)!
        self.hasBeenAdded = false
    }
}
