//
//  ShoppingItem.swift
//  Shopping List
//
//  Created by Kobe McKee on 5/3/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import Foundation
import UIKit

struct ShoppingItem {
    
    
    init(itemName: String, imageName: String, addedToShoppingList: Bool = false) {
        self.itemName = itemName
        self.image = UIImage(named: imageName)!
        self.addedToShoppingList = addedToShoppingList
        
    }
    
    
    var itemName: String
    var image: UIImage
    var addedToShoppingList: Bool
}

