//
//  ShoppingItemController.swift
//  Shopping List
//
//  Created by Jeffrey Carpenter on 5/3/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import Foundation
import UIKit

class ShoppingItemController {
    
    var shoppingItems: [ShoppingItem] = []
    let itemNames = ["apple", "grapes", "milk", "muffin", "popcorn", "soda", "strawberries"]
    
    init() {
        
        // TODO: Only fun this for loop on the first run of the application.
        for item in itemNames {
            guard let imageData = UIImage(named: item)?.pngData() else {
                print("Error getting image data: could not find image named \(item)")
                return
            }
            let newShoppingItem = ShoppingItem(name: item, image: imageData)
            shoppingItems.append(newShoppingItem)
        }
    }
    
    // MARK: - CRUD methods
    // TODO: make a better name for update method
    func update(shoppingItem: ShoppingItem) {
        
        guard let index = shoppingItems.firstIndex(of: shoppingItem) else {
            print("Error updating ShoppingItem: \(shoppingItem.name) was not found in the array.")
            return
        }
        
        shoppingItems[index].isInCart = !shoppingItems[index].isInCart
    }
    
    // MARK: - Read/Write Methods
    func loadFromPersistentStore() {
        
    }
    
    func saveToPersistentStore() {
        
    }
}
