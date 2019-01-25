//
//  ShoppingItem.swift
//  Shopping List
//
//  Created by Stuart on 1/25/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import UIKit

struct ShoppingItem: Equatable {
    var image: UIImage
    var name: String
    var hasBeenAdded: Bool
    
    init(name: String, hasBeenAdded: Bool = false) {
        self.image = UIImage(named: name)!
        self.name = name
        self.hasBeenAdded = hasBeenAdded
    }
}
