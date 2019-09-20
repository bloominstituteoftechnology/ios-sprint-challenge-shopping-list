//
//  ShoppingController.swift
//  Shopping List
//
//  Created by Jonalynn Masters on 9/20/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import Foundation

class ShoppingController {
    
    private(set) var items: [ShoppingItem] = []
    
    var shoppingItems = [
        ShoppingItem(itemName: "Apple", hasBeenAdded: false, imageName: "Apple"),
        ShoppingItem(itemName: "Grapes", hasBeenAdded: false, imageName: "Grapes"),
        ShoppingItem(itemName: "Milk", hasBeenAdded: false, imageName: "Milk"),
        ShoppingItem(itemName: "Muffin", hasBeenAdded: false, imageName: "Muffin"),
        ShoppingItem(itemName: "Popcorn", hasBeenAdded: false, imageName: "Popcorn"),
        ShoppingItem(itemName: "Soda", hasBeenAdded: false, imageName: "Soda"),
        ShoppingItem(itemName: "Strawberries", hasBeenAdded: false, imageName: "Strawberries")]
    
    init() {
        items = shoppingItems
        loadFromPersistentStore()
    }
    
    private var persistentFileURL: URL? {
        let fileManager = FileManager.default
        guard let documents = fileManager.urls(for: .documentDirectory, in: .userDomainMask).first else { return nil }
        return documents.appendingPathComponent("items.plist")
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
    
    func toggleHasBeenAdded(item: ShoppingItem) {
        item.hasBeenAdded = !item.hasBeenAdded
        saveToPersistentStore()
    }
}
    











