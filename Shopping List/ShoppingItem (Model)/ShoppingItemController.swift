//
//  ShoppingItemController.swift
//  Shopping List
//
//  Created by Shawn James on 3/27/20.
//  Copyright © 2020 Lambda School. All rights reserved.
//

import Foundation

class ShoppingItemController {
    
    // MARK: - CollectionView Properties
    
    let itemNames = ["Apple", "Grapes", "Milk", "Muffin", "Popcorn", "Soda", "Strawberries"]
    var shoppingItems: [ShoppingItem] = []
    
    
    // MARK: - Initialize Shopping Items
    
    init() {
        if UserDefaults.standard.bool(forKey: .areAdded) {
            loadFromPersistentStore()
        } else {
            addShoppingItems()
            UserDefaults.standard.set(true, forKey: .areAdded)
            saveToPersistentStore()
        }
    }
    
    
    // MARK: - Methods
    
    func addShoppingItems() {
        for item in itemNames { shoppingItems.append(ShoppingItem(name: item)) }
    }
    
    
    // MARK: - Persistence
    
    // Create plist
    var shoppingListURL: URL? {
        let fileManager = FileManager.default
        guard let documentsDirectory = fileManager.urls(for: .documentDirectory, in: .userDomainMask).first else { return nil }
        return documentsDirectory.appendingPathComponent("ShoppingList.plist")
    }
    
    // Save to plist
    func saveToPersistentStore() {
        guard let path = shoppingListURL else { return }
        do {
            let encoder = PropertyListEncoder()
            let data = try encoder.encode(shoppingItems)
            try data.write(to: path)
        } catch {
            print("Encoding Error")
        }
    }
    
    // Load from plist
    func loadFromPersistentStore() {
        guard let path = shoppingListURL else { return }
        do {
            let data = try Data(contentsOf: path)
            let decoder = PropertyListDecoder()
            let shoppingItemList = try decoder.decode([ShoppingItem].self, from: data)
            self.shoppingItems = shoppingItemList
        } catch {
            print("Decoding Error")
        }
    }

}

extension String { static let areAdded = "Added" }
