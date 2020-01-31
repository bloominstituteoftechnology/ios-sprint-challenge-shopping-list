//
//  ShoppingList.swift
//  Shopping List
//
//  Created by Malik Barnes on 1/31/20.
//  Copyright © 2020 Lambda School. All rights reserved.
//

import Foundation

struct ShoppingItem {
    var name: String
    var hasBeenAdded: Bool
    var image: UIImage
    
    init(name: String, hasBeenAdded: Bool = false, imageName: String) {
        self.name = name
        self.hasBeenAdded = hasBeenAdded
        self.image = UIImage(named. imageName)!
    }
}
