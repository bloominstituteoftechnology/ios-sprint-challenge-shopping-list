//
//  ShoppingItemController.swift
//  Shopping List
//
//  Created by John Kouris on 8/17/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import Foundation

class ShoppingItemController {
    
    var shoppingItems: [ShoppingItem] = [
            ShoppingItem(name: "Apple", imageName: "Apple"),
            ShoppingItem(name: "Grapes", imageName: "Grapes"),
            ShoppingItem(name: "Grapes", hasBeenAdded: true, imageName: "Grapes"),
            ShoppingItem(name: "Milk", imageName: "Milk"),
            ShoppingItem(name: "Muffin", imageName: "Muffin"),
            ShoppingItem(name: "Popcorn", imageName: "Popcorn"),
            ShoppingItem(name: "Soda", imageName: "Soda"),
            ShoppingItem(name: "Strawberries", imageName: "Strawberries")
        ]
    
    init() {
        loadFromPersistentStore()
    }
    
    var addedShoppingItems: [ShoppingItem] {
        let addedShoppingItems = shoppingItems.filter { $0.hasBeenAdded == true }
        return addedShoppingItems
    }
    
    var notAddedShoppingItems: [ShoppingItem] {
        let addedShoppingItems = shoppingItems.filter { $0.hasBeenAdded == false }
        return addedShoppingItems
    }
    
    private var persistentFileURL: URL? {
        let fileManager = FileManager.default
        guard let documents = fileManager.urls(for: .documentDirectory, in: .userDomainMask).first else { return nil }
        
        return documents.appendingPathComponent("shopping.plist")
    }
    
    private func saveToPersistentStore() {
        guard let url = persistentFileURL else { return }
        
        do {
            let encoder = PropertyListEncoder()
            let data = try encoder.encode(shoppingItems)
            try data.write(to: url)
        } catch {
            print("Error saving stars data: \(error)")
        }
    }
    
    private func loadFromPersistentStore() {
        let fileManager = FileManager.default
        guard let url = persistentFileURL, fileManager.fileExists(atPath: url.path) else { return }
        
        do {
            let data = try Data(contentsOf: url)
            let decoder = PropertyListDecoder()
            shoppingItems = try decoder.decode([ShoppingItem].self, from: data)
        } catch {
            print("Error loading stars data: \(error)")
        }
    }
    
    func updateHasBeenAdded(for item: ShoppingItem) {
        guard let index = shoppingItems.firstIndex(of: item) else { return }
        shoppingItems[index].hasBeenAdded = !shoppingItems[index].hasBeenAdded
        saveToPersistentStore()
    }
    
}
