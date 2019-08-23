//
//  ShoppingList.swift
//  Shopping List
//
//  Created by Uptiie on 6/14/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import Foundation
import UIKit

class ShoppingList {
    var itemNames = ["Apples", "Grapes", "Milk", "Muffin", "Popcorn", "Soda", "Strawberries"]
    var isAdded: Bool
    
    init(itemNames: String, isAdded: Bool = false) {
        self.itemNames = [itemNames]
        self.isAdded = isAdded
    }
    
    struct PropertyListEncoder {
        
    }
}
