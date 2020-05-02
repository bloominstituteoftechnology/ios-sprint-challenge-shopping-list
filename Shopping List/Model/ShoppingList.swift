//
//  ShoppingList.swift
//  Shopping List
//
//  Created by Bohdan Tkachenko on 5/2/20.
//  Copyright © 2020 Lambda School. All rights reserved.
//

import Foundation
import UIKit

struct ShoppingItem {
    
    var name: String
    var hasBeenAdded: Bool
    var image: UIImage
    
    init(name: String, imageName: String, hasBeenAdded: Bool = false) {
        self.name = name
        self.image = UIImage(named: imageName)!
        self.hasBeenAdded = hasBeenAdded
    }
}
