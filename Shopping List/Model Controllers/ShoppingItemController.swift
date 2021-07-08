//
//  ShoppingItemController.swift
//  Shopping List
//
//  Created by Gi Pyo Kim on 9/20/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import Foundation

class ShoppingItemController {
    // MARK: Properties
    var shoppingItems: [ShoppingItem] = []
    let itemNames = ["Apple", "Grapes", "Milk", "Muffin", "Popcorn", "Soda", "Strawberries"]
    
    var addedItems: [ShoppingItem] {
        return shoppingItems.filter { $0.isAdded == true }
    }
    
    // Persistence
    private var shoppingListURL: URL? {
        let fileManager = FileManager.default
        guard let documents = fileManager.urls(for: .documentDirectory, in: .userDomainMask).first else { return nil }
        return documents.appendingPathComponent("ShoppingList.plist")
    }
    
    func saveToPersistentStore() {
        guard let url = shoppingListURL else { return }
        
        do {
            let encoder = PropertyListEncoder()
            let shoppingItemsData = try encoder.encode(shoppingItems)
            try shoppingItemsData.write(to: url)
        } catch {
            print("Error saving shopping list data: \(error)")
        }
    }
    
    func loadFromPersistentStore() {
        let fileManager = FileManager.default
        
        do {
            guard let url = shoppingListURL, fileManager.fileExists(atPath: url.path) else { return }
            let shoppingItemsData = try Data(contentsOf: url)
            let decoder = PropertyListDecoder()
            let decodedShoppingItems = try decoder.decode([ShoppingItem].self, from: shoppingItemsData)
            shoppingItems = decodedShoppingItems
            
        } catch {
            print("Error loading shopping list data: \(error)")
        }
    }
    
    // MARK: Methods
    init() {
        loadFromPersistentStore()
        if shoppingItems.count == 0 {
            for name in itemNames {
                shoppingItems.append(ShoppingItem(name: name))
            }
            saveToPersistentStore()
        }
    }
    
    func update (shoppingItem:ShoppingItem, isAdded: Bool) {
        for i in shoppingItems.indices {
            if shoppingItem.name == shoppingItems[i].name {
                shoppingItems[i].isAdded = isAdded
                saveToPersistentStore()
            }
        }
    }
}
