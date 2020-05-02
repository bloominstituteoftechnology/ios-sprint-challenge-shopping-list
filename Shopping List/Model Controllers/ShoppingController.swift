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
        let firstRun: Bool = UserDefaults.standard.bool(forKey: .isInitializedKey)
        if firstRun {
            createInitialShoppingItems()
            UserDefaults.standard.set(true, forKey: .isInitializedKey)
        } else {
            loadFromPersistentStore()
        }
    }
    
    let itemNames = [
        "Apple", "Grapes", "Milk", "Muffin",
        "Popcorn", "Soda", "Strawberries"
    ]
    
    var shoppingItems: [ShoppingItem] = []
    
    var addedItems: [ShoppingItem] {
        let added = shoppingItems.filter( { return $0.hasBeenAdded } )
        return added
    }
    
    var notAddedItems: [ShoppingItem] {
        let notAdded = shoppingItems.filter( { return !$0.hasBeenAdded } )
        return notAdded
    }
    
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
    
    func itemToggled(item: ShoppingItem) {
        if let itemIndex = shoppingItems.firstIndex(of: item) {
            var shoppingItem = shoppingItems[itemIndex]
            shoppingItem.hasBeenAdded.toggle()
            shoppingItems[itemIndex] = shoppingItem
            saveToPersistentStore()
        }
    }
    
    // MARK: - CRUD
    func createInitialShoppingItems() {
        for item in itemNames {
            let newItem = ShoppingItem(itemName: item, imageString: item)
            shoppingItems.append(newItem)
        }
        saveToPersistentStore()
    }
    
}

extension String {
    static let isInitializedKey = "isInitialized"
}
