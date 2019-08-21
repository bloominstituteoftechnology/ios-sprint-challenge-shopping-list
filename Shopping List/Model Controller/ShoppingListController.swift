//
//  ShoppingItemController.swift
//  Shopping List
//
//  Created by Jessie Ann Griffin on 8/18/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import Foundation

let shoppingListKey = "shoppingListKey"

class ShoppingListController {
    
    private(set) var shoppingItems: [ShoppingItem] = []
    
    let itemNames = ["Apple", "Grapes", "Milk", "Muffin", "Popcorn", "Soda", "Strawberries"]
    
    let userDefaults = UserDefaults.standard
        
    private var shoppingListURL: URL? {
        let fileManager = FileManager.default
        guard let documents = fileManager.urls(for: .documentDirectory, in: .userDomainMask).first else { return nil }
        return documents.appendingPathComponent("ShoppingList.plist")
    }
    
    var addedItems: [ShoppingItem] {
        return shoppingItems.filter { $0.added == true }
    }

    init() {
        let userDefault = UserDefaults.standard.bool(forKey: shoppingListKey)
        // if it's true it means the app has been run before
        if userDefault {
            loadFromPersistentStore() // populates array from saved data
        } else {
            createShoppingList() // creates array
        }
    }
    
    func updateIsAdded(item: ShoppingItem) {
        
        guard let index = shoppingItems.firstIndex(of: item) else { return }
        var changedItem = shoppingItems[index]
//        if !changedItem.added {
//            changedItem.added = true
//        } else {
//            changedItem.added = false
//        }
        changedItem.added = !changedItem.added
        shoppingItems[index] = changedItem
        saveToPersistentStore()
    }
    
    private func createShoppingList() {
        
        for item in itemNames {
            let newItem = ShoppingItem(name: item)
            shoppingItems.append(newItem)
        }
        saveToPersistentStore()
        userDefaults.set(true, forKey: shoppingListKey) // this saves the "key" info that this function has already been run once
    }
    
    private func saveToPersistentStore() {
        guard let url = shoppingListURL else { return }
        
        do {
            let encoder = PropertyListEncoder()
            let listData = try encoder.encode(shoppingItems)
            try listData.write(to: url)
        } catch {
            print("Error saving shopping list data: \(error)")
        }
    }
    // method to load data from the url created when saving the data - this method also checks if the file exists
    private func loadFromPersistentStore() {
        let fileManager = FileManager.default
        
        do {
            guard let url = shoppingListURL, fileManager.fileExists(atPath: url.path) else { return }
            let data = try Data(contentsOf: url)
            let decoder = PropertyListDecoder()
            let decodedList = try decoder.decode([ShoppingItem].self, from: data)
            self.shoppingItems = decodedList
        } catch {
            print("Error loading/decoding shopping list: \(error)")
        }
    }
}
