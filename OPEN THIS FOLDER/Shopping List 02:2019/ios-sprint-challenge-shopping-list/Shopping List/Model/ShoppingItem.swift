//
//  ShoppingItem.swift
//  Shopping List
//
//  Created by J-Skenandore on 2/24/20.
//  Copyright © 2020 Lambda School. All rights reserved.
//

import UIKit

class ShoppingItem {
    var name: String
    var image: UIImage
    var addedToShoppingList: Bool = false
    
    init(name: String, imageName: String) {
        self.name = name
        self.image = UIImage(named: imageName)!
    }
}
