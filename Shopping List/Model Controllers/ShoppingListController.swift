//
//  ShoppingListController.swift
//  Shopping List
//
//  Created by Joshua Sharp on 8/23/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import Foundation

private let filename: String = "shoppinglist.plist"
private let content: String = "shopping list"

class ShoppingListController {
    private(set) var shoppingList: [ShoppingItem] = []
    
    init() {
        let listHasBeenInitialized = UserDefaults.standard.bool(forKey: .hasInitializedShoppingList)
        if !listHasBeenInitialized {
            let itemNames = ["Apple", "Grapes", "Milk", "Muffin", "Popcorn", "Soda", "Strawberries"]
            for item in itemNames {
                shoppingList.append(ShoppingItem(name: item, selected: false))
            }
            saveToPersistentStore()
            let userDefaults = UserDefaults.standard
            userDefaults.set(true, forKey: .hasInitializedShoppingList)
        } else {
            loadFromPersistentStore()
        }
    }
    
    func toggleHasBeenSelected (_ item: ShoppingItem) {
        guard let index = shoppingList.firstIndex(of: item) else {return}
        if index != -1 {
            shoppingList[index].toggleSelected()
            saveToPersistentStore()
        }
    }
    
    private var persistentFileURL: URL? {
        let fileManager = FileManager.default
        guard let documents = fileManager.urls(for: .documentDirectory, in: .userDomainMask).first else { return nil }
        
        // /Users/paulsolt/Documents
        // /Users/paulsolt/Documents/stars.plist
        
        return documents.appendingPathComponent(filename)
    }
    
    func saveToPersistentStore() {
        guard let url = persistentFileURL else { return }
        
        do {
            let encoder = PropertyListEncoder()
            let data = try encoder.encode(shoppingList)
            try data.write(to: url)
        } catch {
            print("Error saving \(content) data: \(error)")
        }
    }
    
    func loadFromPersistentStore() {
        let fileManager = FileManager.default
        guard let url = persistentFileURL, fileManager.fileExists(atPath: url.path) else { return }
        
        do {
            let data = try Data(contentsOf: url)
            let decoder = PropertyListDecoder()
            shoppingList = try decoder.decode([ShoppingItem].self, from: data)
        } catch {
            print("Error loading \(content) data: \(error)")
        }
    }
}
