//
//  ShoppingItemController.swift
//  Shopping List
//
//  Created by Stuart on 1/18/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import Foundation
import UIKit

class ShoppingItemController {
    
    private(set) var items: [ShoppingItem] = []
    private var hasLaunchedKey = "hasLaunchedKey"
    
    // MARK:- Initializer
    init() {
        let hasLaunched = UserDefaults.standard.bool(forKey: hasLaunchedKey)
        
        if !hasLaunched {
            // Default shopping items
            let itemNames = ["apple", "grapes", "milk", "muffin", "popcorn", "soda", "strawberries"]
            
            for item in itemNames {
                createShoppingItem(with: item, image: UIImage(named: item) ?? UIImage())
            }
    }
    
    
    // MARK:- CRUD methods
    
    func createShoppingItem(with name: String, image: UIImage) {
        guard let imageData = UIImagePNGRepresentation(image) else { return }
        
        let item = ShoppingItem(name: name, imageData: imageData)
        items.append(item)
        
    }
    
    // Update an existing shopping item object
    func update(item: ShoppingItem, isInShoppingList: Bool) {
        
        guard let index = items.index(of: item) else { return }
        
        let tempItem = ShoppingItem(name: item.name, imageData: item.imageData, isInShoppingList: isInShoppingList)
        
        items.remove(at: index)
        items.insert(tempItem, at: index)
        
    }

        var addedItems: [ShoppingItem] {
            return items.filter { $0.isInShoppingList }
        }
        
        var notAddedItems: [ShoppingItem] {
            return items.filter { !$0.isInShoppingList }
        }
    }
}
