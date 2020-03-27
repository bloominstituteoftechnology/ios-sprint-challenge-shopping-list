//
//  ShoppingModel.swift
//  Shopping List
//
//  Created by Mark Poggi on 3/27/20.
//  Copyright © 2020 Lambda School. All rights reserved.
//

import Foundation
import UIKit



struct ShoppingList {
    
    var itemName: String
    var itemAdded: Bool
    var image: UIImage
    
    init(itemName: String, itemAdded: Bool, imageName: String) {
        self.itemName = itemName
        self.itemAdded = itemAdded
        self.image = UIImage(named: imageName)!
    }
    
}
