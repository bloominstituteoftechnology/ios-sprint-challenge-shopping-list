//
//  ShoppingListController.swift
//  Shopping List
//
//  Created by Zack Larsen on 11/15/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import Foundation

class ShoppingListController {
     let itemNames = ["Apple", "Grapes", "Milk", "Muffin", "Popcorn", "Soda", "Strawberries"]
    
    }
var newShoppingItem: [ShoppingItem] = []

func addToShoppingItem(_ shoppingItem: ShoppingItem) {
    newShoppingItem.append(shoppingItem)
}

//persistence

private var persistentFileURL: URL? {
        let fileManager = FileManager.default
        
        guard let documentsDir = fileManager.urls(for: .documentDirectory, in: .userDomainMask).first else { return nil }
        
        return documentsDir.appendingPathComponent("itemNames.plist")
    }
    
    func saveToPersistentStore() {
        
        let encoder = PropertyListEncoder()
        
        do {
            let shoppingItem = try encoder.encode(newShoppingItem)
            
            guard let fileURL = persistentFileURL else { return }
            
            try shoppingItem.write(to: fileURL)
            
        } catch let shoppingItemError {
            print("Error saving stars: \(shoppingItemError)")
        }
    }
    
    func loadFromPersistentStore() {
        
        let fileManager = FileManager.default
        
        guard let fileURL = persistentFileURL,
            fileManager.fileExists(atPath: fileURL.path) else { return }
        
        do {
            let shoppingItem = try Data(contentsOf: fileURL)
            let decoder = PropertyListDecoder()
            newShoppingItem = try decoder.decode([ShoppingItem].self, from: shoppingItem)
        } catch {
            print("Error loading shopping item: \(error)")
    }
}


