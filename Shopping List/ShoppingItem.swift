//
//  ShoppingItem.swift
//  Shopping List
//
//  Created by Moses Robinson on 1/18/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import UIKit

struct ShoppingItem: Equatable {
    
    let name: String
    let image: UIImage
    var isAdded: Bool
    
    init(name: String, image: UIImage, isAdded: Bool = false) {
        (self.name, self.image, self.isAdded) = (name, image, isAdded)
    }
}
