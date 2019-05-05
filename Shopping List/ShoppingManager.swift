//
//  ShoppingManager.swift
//  Shopping List
//
//  Created by Mitchell Budge on 5/5/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import Foundation

class ShoppingManager {
    var shoppingList: [ShoppingItem] = []
    
    var selectedItems: [ShoppingItem] {
        return shoppingList.filter { $0.hasBeenAdded == true }
    }
}
