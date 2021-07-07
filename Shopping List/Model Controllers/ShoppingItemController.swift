//
//  ShoppingItemController.swift
//  Shopping List
//
//  Created by Alexander Supe on 11/15/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import Foundation

class ShoppingItemController {
    var shoppingItems: [ShoppingItem] = []
    
    var addedItems: [ShoppingItem] {
        return shoppingItems.filter{ $0.added == true }
    }
    
    func updateIfAdded(for item: ShoppingItem) {
        guard let index = shoppingItems.firstIndex(of: item) else { return }
        shoppingItems[index].added.toggle()
        saveToPersistentStore()
    }
    
    init() {
        loadFromPersistantStore()
        if UserDefaults.standard.bool(forKey: "initialized") == true { return }
        for item in ["Apple", "Grapes", "Milk", "Muffin", "Popcorn", "Soda", "Strawberries"] {
            shoppingItems.append(ShoppingItem(itemName: item, added: false))
            UserDefaults.standard.set(true, forKey: "initialized")
        }
        saveToPersistentStore()
    }
}

// Persistent Storage
extension ShoppingItemController {
    
    var shoppingListURL: URL? {
        let fileManager = FileManager.default
        guard let docDir = fileManager.urls(for: .documentDirectory, in: .userDomainMask).first else { return nil }
        return docDir.appendingPathComponent("ShoppingList.plist")
    }
    
    func saveToPersistentStore() {
        let encoder = PropertyListEncoder()
        do {
            let thisData = try encoder.encode(shoppingItems)
            guard let fileURL = shoppingListURL else { return }
            try thisData.write(to: fileURL)
        } catch { print(error) }
    }
    
    func loadFromPersistantStore() {
        let fileManager = FileManager.default
        guard let fileURL = shoppingListURL,
            fileManager.fileExists(atPath: fileURL.path) else { return }
        do {
            let thisData = try Data(contentsOf: fileURL)
            let decoder = PropertyListDecoder()
            shoppingItems = try decoder.decode([ShoppingItem].self, from: thisData)
        } catch  { print(error) }
    }
}
