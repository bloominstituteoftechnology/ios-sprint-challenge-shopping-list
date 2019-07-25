//
//  ShoppingItemController.swift
//  Shopping List
//
//  Created by Alex Shillingford on 7/25/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import Foundation

class ShoppingItemController {
    
    let itemNames = ["Apples", "Grapes", "Milk", "Muffin", "Popcorn", "Soda", "Strawberries"]
    private var persistenFileURL: URL? {
        let fileManager = FileManager.default
        
        // Creates "/Users/shillwil/Documents" - documents directory path
        guard let documents = fileManager.urls(for: .documentDirectory, in: .userDomainMask).first
            else {
                return nil
        }
        
        // Creates "/Users/shillwil/Documents/stars.plist" - full file path
        return documents.appendingPathComponent("shoppingList.plist")
    }
    var shoppingList: [ShoppingItem] {
        var result: [ShoppingItem] = []
        for index in 0..<itemNames.count {
            let item = ShoppingItem(name: itemNames[index])
            result.append(item)
        }
        
        return result
    }
    
    func loadFromPersistentStore() { //// TODO: - Finish this function
//        let fileManager = FileManager.default
//        guard let url = persistenFileURL,
//            fileManager.fileExists(atPath: url.path) else { return }
//
//        do {
//            let data = try Data(contentsOf: url)
//            let decoder = PropertyListDecoder()
//            shoppingList = try decoder.decode([ShoppingItem].self, from: data)
//        } catch {
//            print("Error loading shopping list data: \(error)")
//        }
    }
    
    func saveToPersistentStore() {
        guard let url = persistenFileURL else { return }
        
        do {
            let encoder = PropertyListEncoder()
            let data = try encoder.encode(shoppingList)
            try data.write(to: url)
        } catch {
            print("Error saving shopping list data: \(error)")
        }
    }
    
    
}
