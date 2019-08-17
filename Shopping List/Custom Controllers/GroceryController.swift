//
//  GroceryController.swift
//  Shopping List
//
//  Created by Dillon P on 8/17/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import Foundation

class GroceryController {
    
    var groceries: [GroceryItem] = []
    var itemsInCart: [GroceryItem] = []
    
    
    private var groceryListURL: URL? {
        let fileManager = FileManager.default
        guard let documents = fileManager.urls(for: .documentDirectory, in: .userDomainMask).first else { return nil }
        return documents.appendingPathComponent("GroceryList.plist")
    }
    
    
    private func saveToPersistentStore() {
        guard let url = groceryListURL else { return }
        
        do {
            let encoder = PropertyListEncoder()
            let groceryData = try encoder.encode(groceries)
            try groceryData.write(to: url)
        } catch {
            print("Error saving to persistent store: \(error)")
        }
    }
    
    private func loadFromPersistentStore() {
        let fileManager = FileManager.default
        guard let groceryListURL = groceryListURL, fileManager.fileExists(atPath: groceryListURL.path) else { return }
        
        do {
            let groceryData = try Data(contentsOf: groceryListURL)
            let decoder = PropertyListDecoder()
            let decodedGroceries = try decoder.decode([GroceryItem].self, from: groceryData)
            groceries = decodedGroceries
        } catch {
            print("Error loading grocery list data: \(error)")
        }
    }
    
    
    func updateGroceries() {
        
        let userDefaults = UserDefaults.standard
        let defaultValues = userDefaults.bool(forKey: String.groceriesListKey)
        if defaultValues == true {
            loadFromPersistentStore()
        } else if defaultValues == false {
            let itemNames = ["Apple", "Grapes", "Milk", "Muffin", "Popcorn", "Soda", "Strawberries"]
            for item in itemNames {
                let newGrocery = GroceryItem(name: item, inCart: false)
                groceries.append(newGrocery)
            }
            saveToPersistentStore()
            userDefaults.set(true, forKey: String.groceriesListKey)
        }
    }
    
    func toggleCartStatus(for groceryItem: GroceryItem) {
        guard let index = groceries.firstIndex(of: groceryItem) else { return }
        groceries[index].inCart = !groceries[index].inCart
        itemsInCart = groceries.filter { $0.inCart == true }
        saveToPersistentStore()
    }
    
}
