//
//  ShoppingItemController.swift
//  Shopping List
//
//  Created by Jessie Ann Griffin on 8/18/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import Foundation

class ShoppingListController {
    
    private(set) var shoppingItems: [ShoppingItem] = []
    
    let itemNames = ["Apple", "Grapes", "Milk", "Muffin", "Popcorn", "Soda", "Strawberries"]
    
    private var shoppingListURL: URL? {
        let fileManager = FileManager.default
        guard let documents = fileManager.urls(for: .documentDirectory, in: .userDomainMask).first else { return nil }
        return documents.appendingPathComponent("ShoppingList.plist")
    }
    
    init() {
        createShoppingList()
        loadFromPersistentStore()
    }
    
    private func createShoppingList() {
        for item in itemNames {
            let newItem = ShoppingItem(name: item)
            shoppingItems.append(newItem)
        }
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
