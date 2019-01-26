//
//  ShoppingItemController.swift
//  Shopping List
//
//  Created by Stuart on 1/25/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import UIKit

class ShoppingItemController {
    
    // MARK: - Initializers
    init() {
        loadFromPersistentStore()
    }
    
    func changeStatus(for item: ShoppingItem) {
        guard let index = shoppingItems.index(of: item) else { return }
        
        shoppingItems[index].hasBeenAdded = !shoppingItems[index].hasBeenAdded
        saveToPersistentStore()
    }
    
    private(set) var shoppingItems: [ShoppingItem] = [
        ShoppingItem(name: "apple"),
        ShoppingItem(name: "grapes"),
        ShoppingItem(name: "milk"),
        ShoppingItem(name: "muffin"),
        ShoppingItem(name: "popcorn"),
        ShoppingItem(name: "soda"),
        ShoppingItem(name: "strawberries")
        ]
    
    // MARK: - Persistence
    // Computed property to get the path to the shopping items array plist file
    private var persistentStoreURL: URL? {
        guard let documentsURL = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first else { return nil }
        let fileName = "shoppingItems.plist"
        
        return documentsURL.appendingPathComponent(fileName)
    }
    
    // Private method to encode the data and write it to disk
    private func saveToPersistentStore() {
        guard let url = persistentStoreURL else { return }
        let plistEncoder = PropertyListEncoder()
        
        do {
            let shoppingItemsData = try plistEncoder.encode(shoppingItems)
            try shoppingItemsData.write(to: url)
        } catch {
            NSLog("Error saving data to persistent store: \(error)")
        }
    }
    
    // Private method to read the data from disk and decode it
    private func loadFromPersistentStore() {
        guard let url = persistentStoreURL,
            FileManager.default.fileExists(atPath: url.path) else { return }
        let plistDecoder = PropertyListDecoder()
        
        do {
            let shoppingItemsData = try Data(contentsOf: url)
            shoppingItems = try plistDecoder.decode([ShoppingItem].self, from: shoppingItemsData)
        } catch {
            NSLog("Error reading data from persistent store: \(error)")
        }
    }
}
