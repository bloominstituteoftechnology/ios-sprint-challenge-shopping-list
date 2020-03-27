//
//  ShoppingItem.swift
//  Shopping List
//
//  Created by Bling Morley on 3/27/20.
//  Copyright © 2020 Lambda School. All rights reserved.
//

import Foundation
import UIKit

struct ShoppingItem {
    var name: String
    var hasBeenAdded: Bool
    var image: UIImage
    
    init(name: String, hasBeenAdded: Bool = false) {
        self.name = name
        self.hasBeenAdded = hasBeenAdded
        self.image = UIImage(named: name) 
    }
    
    
    
}
