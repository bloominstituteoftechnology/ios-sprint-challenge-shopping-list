//
//  ShoppingItemController.swift
//  Shopping List
//
//  Created by Waseem Idelbi on 12/15/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import UIKit

class ShoppingItemController {
    
    //MARK: -Important properties-
    
    let itemNames = ["Apple", "Grapes", "Milk", "Muffin", "Popcorn", "Soda", "Strawberries"]
    var items: [Item] = []
    var addedItems: [Item] = []
    
    
    //MARK: -Important methods-
    
    func addItems() {
        
        for item in itemNames {
            let itemInstance = Item(name: item, itemWasAdded: UserDefaults.standard.bool(forKey: item))
            items.append(itemInstance)
        }
        
        for addedItem in items {
            if addedItem.itemWasAdded {
                addedItems.append(addedItem)
            }
        }
    }
    
    
    func save(item: Item) {
        UserDefaults.standard.set(item.itemWasAdded, forKey: item.name)
    }
    
    
}//End of class


