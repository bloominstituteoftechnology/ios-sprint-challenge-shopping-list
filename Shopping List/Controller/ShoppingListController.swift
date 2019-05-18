//
//  ShoppingListController.swift
//  Shopping List
//
//  Created by Seschwan on 5/17/19.
//  Copyright © 2019 Seschwan. All rights reserved.
//

import Foundation

class ShoppingItemController {
    
    var itemNamesArray = [ShoppingItem]()
    
    private var persistentURL: URL? {
        let fileManager = FileManager.default
        guard let documents = fileManager.urls(for: .documentDirectory, in: .userDomainMask).first else { return nil }
        return documents.appendingPathComponent("Items.plist")
    }
    
    func createItemNamesArray() {
        let itemNames = ["Apple", "Grapes", "Milk", "Muffin", "Popcorn", "Soda", "Strawberries"]
        for item in itemNames {
            itemNamesArray.append(ShoppingItem(name: item, imageName: item))
            saveToPersistentStore()
        }
        UserDefaults.standard.set(true, forKey: .shoppingItemsKey)
    }
    
    func saveToPersistentStore() {
        guard let url = persistentURL else { return }
        do {
            let encoder = PropertyListEncoder()
            let data = try encoder.encode(itemNamesArray)
            try data.write(to: url)
        } catch {
            NSLog("Error trying to write to disk: \(error)")
        }
    }
    
    func loadFromPersistanceStore() {
        let fileManager = FileManager.default
        guard let url = persistentURL, fileManager.fileExists(atPath: url.path) else { return }
        do {
            let data = try Data(contentsOf: url)
            let decoder = PropertyListDecoder()
            itemNamesArray = try decoder.decode([ShoppingItem].self, from: data)
        } catch {
            NSLog("Error trying to load from disk: \(error)")
        }
    }
    
}

extension String {
    static var shoppingItemsKey = "ShoppingItemsKey"
}
