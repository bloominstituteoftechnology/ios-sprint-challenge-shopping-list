//
//  ShoppingItemController.swift
//  Shopping List
//
//  Created by Cora Jacobson on 6/13/20.
//  Copyright © 2020 Lambda School. All rights reserved.
//

import UIKit

class ShoppingItemController {
    
    init() {
        if UserDefaults.standard.bool(forKey: "shoppingItemsInitialized") {
            loadFromPersistentStore()
        } else {
        for item in itemNames {
            shoppingItems.append(ShoppingItem(name: item, addedToList: false, imageName: item))
        }
        saveToPersistentStore()
        UserDefaults.standard.set(true, forKey: "shoppingItemsInitialized")
        }
    }
    
    let itemNames = ["Apple", "Grapes", "Milk", "Muffin", "Popcorn", "Soda", "Strawberries"]
    
    var shoppingItems: [ShoppingItem] = []
    
    func itemWasUpdated() {
        saveToPersistentStore()
    }
    
    var addedItems: [ShoppingItem] {
        let addedItemsArray = shoppingItems.filter { $0.addedToList == true }
        return addedItemsArray.sorted(by: { $0.name < $1.name })
    }
    
    var unaddedItems: [ShoppingItem] {
        let unaddedItemsArray = shoppingItems.filter { $0.addedToList == false }
        return unaddedItemsArray.sorted(by: { $0.name < $1.name })
    }
    
    // MARK: Persistence
    
    private var ShoppingListURL: URL? {
        let fm = FileManager.default
        let filename = "ShoppingList.plist"
        guard let dir = fm.urls(for: .documentDirectory, in: .userDomainMask).first else { return nil }
        return dir.appendingPathComponent(filename)
    }
    
    private func saveToPersistentStore() {
        guard let url = ShoppingListURL else { return }
        do {
            let encoder = PropertyListEncoder()
            let data = try encoder.encode(shoppingItems)
            try data.write(to: url)
        } catch {
            NSLog("Was not able to encode data: \(error)")
        }
    }
    
    private func loadFromPersistentStore() {
        let fm = FileManager.default
        guard let url = ShoppingListURL,
        fm.fileExists(atPath: url.path) else { return }
        do {
            let data = try Data(contentsOf: url)
            let decoder = PropertyListDecoder()
            let decodedShoppingItems = try decoder.decode([ShoppingItem].self, from: data)
            shoppingItems = decodedShoppingItems
        } catch {
            NSLog("No data was saved: \(error)")
        }
    }
    
}
