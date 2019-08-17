//
//  GroceryController.swift
//  Shopping List
//
//  Created by Dillon P on 8/17/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import Foundation

class GroceryController {
    
    var groceries: [GroceryItem] {
        let itemNames = ["Apple", "Grapes", "Milk", "Muffin", "Popcorn", "Soda", "Strawberries"]
        var temp: [GroceryItem] = []
        for item in itemNames {
            let newGrocery = GroceryItem(name: item, inCart: false)
            temp.append(newGrocery)
        }
        return temp
    }
    
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
        
    }
  
    
}
