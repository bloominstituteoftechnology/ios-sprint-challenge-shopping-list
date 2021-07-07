//
//  ShoppingList.swift
//  Shopping List
//
//  Created by Bobby Keffury on 8/17/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import Foundation

class ShoppingListController {
    
    var groceryItems: [GroceryItem] = []
    
    let itemNames = ["Apple", "Grapes", "Milk", "Muffin", "Popcorn", "Soda", "Strawberries"]
    
    var addedItems: [GroceryItem] {
        var array: [GroceryItem] = []
        for item in groceryItems {
            if item.wasAdded == true {
                array.append(item)
            }
        }
        
        return array
    }
    
    
    
   
    
    private var persistentFileURL: URL? {
        let fileManager = FileManager.default
        
        guard let documents = fileManager.urls(for: .documentDirectory, in: .userDomainMask).first else { return nil }
        
        return documents.appendingPathComponent("items.plist")
    }
    
    init () {
        
        let userDefaults = UserDefaults.standard
        
        if userDefaults.bool(forKey: "didStartApplication") {
            loadFromPersistentStore()
        } else {
            createGroceryItem()
        }
        
    }
    
    func updateItem (_ groceryItem: GroceryItem) {
        guard let index = groceryItems.firstIndex(of: groceryItem) else { return }
        var item = groceryItem
        item.wasAdded = !item.wasAdded
        groceryItems[index] = item
        saveToPersistentStore()
    }
    
    
    func createGroceryItem() {
        
        for name in itemNames {
            var groceryItem = GroceryItem(name)
            groceryItems.append(groceryItem)
        }
        
        let userDefaults = UserDefaults.standard
        userDefaults.set(true, forKey: "didStartApplication")
        saveToPersistentStore()
    }
    
    
    private func saveToPersistentStore() {
        guard let url = persistentFileURL else { return }
        
        do {
            let encoder = PropertyListEncoder()
            let data = try encoder.encode(groceryItems)
            try data.write(to: url)
        } catch {
            print("Error saving item data: \(error)")
        }
        
    }
    
    private func loadFromPersistentStore() {
        let fileManager = FileManager.default
        guard let url = persistentFileURL,
            fileManager.fileExists(atPath: url.path) else { return }
        
        do {
            let data = try Data(contentsOf: url)
            let decoder = PropertyListDecoder()
            groceryItems = try decoder.decode([GroceryItem].self, from: data)
        } catch {
            print("Error loading item data: \(error)")
        }
        
    }

    
    
}
