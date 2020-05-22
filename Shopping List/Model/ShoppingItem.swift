//
//  ShoppingItem.swift
//  Shopping List
//
//  Created by Violet Lavender Love on 5/22/20.
//  Copyright © 2020 Lambda School. All rights reserved.
//

import UIKit

struct ShoppingItem {
    
    let name: String
    var hasBeenAdded: Bool
    
    var image: UIImage 
    
    init(name: String, hasBeenAdded: Bool, imageName: String) {
        self.name = name
        self.hasBeenAdded = hasBeenAdded
        self.image = UIImage(named: imageName)!
    }
}

