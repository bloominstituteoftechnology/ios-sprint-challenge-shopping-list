//
//  ShoppingItemController.swift
//  Shopping List
//
//  Created by morse on 10/18/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import Foundation

class ShoppingItemController {
    
    struct PropertyKeys {
        static let existKey = "itemsExistKey"
    }
    
    var shoppingItems: [ShoppingItem] = []
    let itemsExist = UserDefaults.standard.bool(forKey: PropertyKeys.existKey)
    
    func fetchItems() {
        if itemsExist {
            loadFromPersistentStore()
        } else {
            createItems()
            saveToPersistentStore()
            UserDefaults.standard.set(true, forKey: PropertyKeys.existKey)
        }
    }
    
    func createItems() {
        print("Creating items...")
        let itemNames = ["Apple", "Grapes", "Milk", "Muffin", "Popcorn", "Soda", "Strawberries"]
        for itemName in itemNames {
            let item = ShoppingItem(name: itemName)
            shoppingItems.append(item)
        }
    }
    
    private var persistentFileURL: URL? {
        let fm = FileManager.default
        guard let dir = fm.urls(for: .documentDirectory, in: .userDomainMask).first else { return nil }
        return dir.appendingPathComponent("shoppingList-items.plist")
    }
    
    private func saveToPersistentStore() {
        guard let url = persistentFileURL else { return }
        
        do {
            let encoder = PropertyListEncoder()
            let data = try encoder.encode(shoppingItems)
            try data.write(to: url)
        } catch {
            print("Error saving shoppingItems data: \(error)")
        }
    }
    
    private func loadFromPersistentStore() {
        let fm = FileManager.default
        guard let url = persistentFileURL,
            fm.fileExists(atPath: url.path) else { return }
        
        do{
            let data = try Data(contentsOf: url)
            let decoder = PropertyListDecoder()
            shoppingItems = try decoder.decode([ShoppingItem].self, from: data)
        } catch {
            print("Error loading shoppingItems data: \(error)")
        }
    }
}
