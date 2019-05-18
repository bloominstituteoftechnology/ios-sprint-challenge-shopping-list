//
//  ShoppingListController.swift
//  Shopping List
//
//  Created by Seschwan on 5/17/19.
//  Copyright © 2019 Seschwan. All rights reserved.
//

import Foundation

class ShoppingItemController {
    
    init() {
        loadingCheck()
    }
    
    var itemNamesArray = [ShoppingItem]()
    
    var addedItems: [ShoppingItem] {
        return itemNamesArray.filter { $0.beenAdded == true }
    }
    
    private var persistentURL: URL? {
        let fileManager = FileManager.default
        guard let documents = fileManager.urls(for: .documentDirectory, in: .userDomainMask).first else { return nil }
        return documents.appendingPathComponent("Items.plist")
    }
    
    // Create an array
    func createItemNamesArray() {
        let itemNames = ["Apple", "Grapes", "Milk", "Muffin", "Popcorn", "Soda", "Strawberries"]
        for item in itemNames {
            itemNamesArray.append(ShoppingItem(name: item, imageName: item))
            saveToPersistentStore()
        }
        UserDefaults.standard.set(true, forKey: .shoppingItemsKey)
    }
    
    // Check to see if the array has been created already
    func loadingCheck() {
        let userDefaults = UserDefaults.standard
        if userDefaults.bool(forKey: .shoppingItemsKey) {
            loadFromPersistanceStore()
        } else {
            createItemNamesArray()
        }
    }
    
    
    // Toggle the beenAdded Bool
    func beenAddedToggled(shoppingItem: ShoppingItem) {
        var shoppingItem = shoppingItem
        shoppingItem.beenAdded.toggle()
        saveToPersistentStore()
    }
    
    // Saving to Disk
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
    
    // Loading from Disk
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
