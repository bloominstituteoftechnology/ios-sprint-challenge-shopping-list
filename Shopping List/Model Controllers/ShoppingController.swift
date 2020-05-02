//
//  ShoppingController.swift
//  Shopping List
//
//  Created by Bronson Mullens on 5/1/20.
//  Copyright © 2020 Lambda School. All rights reserved.
//

import Foundation

class ShoppingController: Codable {
    init() {
        self.loadFromPersistentStore()
    }
    
    var shoppingItems: [ShoppingItem] = []
    
    // MARK : - Persistence
    
    var shoppingListURL: URL? {
        let fm = FileManager.default
        guard let directory = fm.urls(for: .documentDirectory, in: .userDomainMask).first else { return nil }
        return directory.appendingPathComponent("ShoppingList.plist")
    }
    
    func saveToPersistentStore() {
        do {
            let encoder = PropertyListEncoder()
            let data = try encoder.encode(shoppingItems)
            try data.write(to: shoppingListURL!)
        } catch {
            NSLog("Error saving shopping data: \(error)")
        }
    }
    
    func loadFromPersistentStore() {
        let fm = FileManager.default
        guard let url = shoppingListURL,
            fm.fileExists(atPath: url.path) else { return }
        do {
            let data = try Data(contentsOf: url)
            let decoder = PropertyListDecoder()
            let decodedShoppingItems = try decoder.decode([ShoppingItem].self, from: data)
            shoppingItems = decodedShoppingItems
        } catch {
            NSLog("Error loading shopping data: \(error)")
        }
    }
    
    // MARK: - CRUD
    
}
