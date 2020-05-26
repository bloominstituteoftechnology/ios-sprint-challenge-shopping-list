//
//  ShoppingItemController.swift
//  Shopping List
//
//  Created by Richard Gibbs on 5/22/20.
//  Copyright © 2020 Lambda School. All rights reserved.
//

import Foundation



class ShoppingItemController: Codable {
    var shoppingItems = [
            ShoppingItem(name: "Apple", imageName: "Apple"),
            ShoppingItem(name: "Grapes", imageName: "Grapes"),
            ShoppingItem(name: "Milk", imageName: "Milk"),
            ShoppingItem(name: "Muffin", imageName: "Muffin"),
            ShoppingItem(name: "Popcorn", imageName: "Popcorn"),
            ShoppingItem(name: "Soda", imageName: "Soda"),
            ShoppingItem(name: "Strawberries", imageName: "Strawberries"),
        ]
    let itemNames = ["Apple", "Grapes", "Milk", "Muffin", "Popcorn", "Soda", "Strawberries"]
    var items: [ShoppingItem] = []
    
    init() {
        self.loadFromPersistentStore()
        
    }
    func createShoppingItem(name: String, imageName: String) {
        let shoppingitem = ShoppingItem(name: name, imageName: imageName)
        shoppingItems.append(shoppingitem)
        saveToPersistentStore()
    }
    
    var persistentFileURL: URL? {
        let fileManager = FileManager.default
        let documentsDir = fileManager.urls(for: .documentDirectory, in: .userDomainMask).first
        let itemsURL = documentsDir?.appendingPathComponent("items.plist")
        return itemsURL
    }
    
    func saveToPersistentStore() {
        do {
            guard let persistentFileURL = persistentFileURL else { return }
            let encoder = PropertyListEncoder()
            let itemsPlist = try encoder.encode(items)
            try itemsPlist.write(to: persistentFileURL)
        } catch {
            print("Error saving items: \(error)")
        }
    }
    
    func loadFromPersistentStore() {
        do {
            guard let persistentFileURL = persistentFileURL else { return }
            let itemsPlist = try Data(contentsOf: persistentFileURL)
            let decoder = PropertyListDecoder()
            let decodedItems = try decoder.decode([ShoppingItem].self, from: itemsPlist)
            self.items = decodedItems
        } catch {
            print("Error loading items from plist: \(error)")
        }
    }
}
