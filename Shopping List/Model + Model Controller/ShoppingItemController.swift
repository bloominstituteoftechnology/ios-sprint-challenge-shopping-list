//
//  ShoppingItemController.swift
//  Shopping List
//
//  Created by Stuart on 1/25/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import UIKit

class ShoppingItemController {
    
    func changeStatus(for item: ShoppingItem) {
        guard let index = shoppingItems.index(of: item) else { return }
        
        shoppingItems[index].hasBeenAdded = !shoppingItems[index].hasBeenAdded
    }
    
    private(set) var shoppingItems: [ShoppingItem] = [
        ShoppingItem(name: "apple"),
        ShoppingItem(name: "grapes"),
        ShoppingItem(name: "milk"),
        ShoppingItem(name: "muffin"),
        ShoppingItem(name: "popcorn"),
        ShoppingItem(name: "soda"),
        ShoppingItem(name: "strawberries")
        ]
}
