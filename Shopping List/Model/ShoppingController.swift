//
//  ShoppingController.swift
//  Shopping List
//
//  Created by Blake Andrew Price on 7/26/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import Foundation

class ShoppingController {
    
    private(set) var items: [ShoppingItem] = []
    
    var showInitialShoppingItems = [
        ShoppingItem(itemName: "Apple", hasBeenAdded: false),
        ShoppingItem(itemName: "Grapes", hasBeenAdded: false),
        ShoppingItem(itemName: "Milk", hasBeenAdded: false),
        ShoppingItem(itemName: "Muffin", hasBeenAdded: false),
        ShoppingItem(itemName: "Popcorn", hasBeenAdded: false),
        ShoppingItem(itemName: "Soda", hasBeenAdded: false),
        ShoppingItem(itemName: "Strawberries", hasBeenAdded: false)
    ]
    
    static var showShoppingItems = "ShowShoppingItems"
    
    let showShoppingItems = UserDefaults.standard.bool(forKey: .showShoppingItems)
    
    private var persistentFileURL: URL? {
        let fileManager = FileManager.default
        
        guard let documents = fileManager.urls(for: .documentDirectory, in: .userDomainMask).first else { return nil }
        
        return documents.appendingPathComponent("items.plist")
    }
    
    init() {
        loadFromPersistentStore()
    }
    
    func saveToPersistentStore() {
        guard let url = persistentFileURL else { return }
        
        do {
            let encoder = PropertyListEncoder()
            let data = try encoder.encode(items)
            try data.write(to: url)
        } catch {
            print("Error saving shopping items: \(error)")
        }
    }
    
    func loadFromPersistentStore() {
        let fileManager = FileManager.default
        guard let url = persistentFileURL, fileManager.fileExists(atPath: url.path) else { return }
        
        do {
            let data = try Data(contentsOf: url)
            let decoder = PropertyListDecoder()
            items = try decoder.decode([ShoppingItem].self, from: data)
        } catch {
            print("Error loading shopping items: \(error)")
        }
    }
}

extension String {
    static var showShoppingItems = "ShowShoppingItems"
}

