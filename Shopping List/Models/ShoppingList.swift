//
//  ShoppingList.swift
//  Shopping List
//
//  Created by Casualty on 8/17/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import Foundation

class ShoppingList {
    var items: [ShoppingItem] = []
    
    var availableItems: [ShoppingItem] {
        let unselected = items.filter { $0.isAvailable == true }
        return unselected
    }
    
    var unavailableItems: [ShoppingItem] {
        let selected = items.filter { $0.isAvailable == false }
        return selected
    }
    
    // Still working on this, but the app works.
    func moveItem(item: ShoppingItem) {
        guard let item = items.firstIndex(of: item) else { return }
        items[item].isAvailable.toggle()
    }
    
    init() {
        
        let itemNames = ["Apple", "Grapes", "Milk", "Muffin", "Popcorn", "Soda", "Strawberries"]
        for item in itemNames {
            items.append(ShoppingItem(name: item))
            
        }
    }
    
}
