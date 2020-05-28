//
//  ShoppingItemController.swift
//  Shopping List
//
//  Created by Richard Gibbs on 5/22/20.
//  Copyright © 2020 Lambda School. All rights reserved.
//

import Foundation



class ShoppingItemController: Codable {
    
    let itemNames = ["Apple", "Grapes", "Milk", "Muffin", "Popcorn", "Soda", "Strawberries"]
    var items: [ShoppingItem] = []
    var newItems: ShoppingItem?
    func createShoppingItem() {
        for itemName in itemNames {
            items.append(ShoppingItem(name: itemName, imageName: itemName))
        }
        saveToPersistentStore()
    }
    
    
    init() {
        if UserDefaults.standard.bool(forKey: .initializeItems) != true {
            createShoppingItem()
        } else {
            loadFromPersistentStore()
            UserDefaults.standard.set(true, forKey: .initializeItems)
        }
    }
    
    // I need to access the .added property of my shopping item and toggle between added and not added
    
    // need an object
    
        
        
        
        var persistentFileURL: URL? {
            let fileManager = FileManager.default
            guard let documentsDir = fileManager.urls(for: .documentDirectory, in: .userDomainMask).first else { return nil }
            let itemsURL = documentsDir.appendingPathComponent("items.plist")
            return itemsURL
        }
        
        func saveToPersistentStore() {
            guard let persistentFileURL = persistentFileURL else { return }
            do {
                let encoder = PropertyListEncoder()
                let itemsPlist = try encoder.encode(items)
                try itemsPlist.write(to: persistentFileURL)
            } catch {
                print("Error saving items: \(error)")
            }
        }
        
        func loadFromPersistentStore() {
            guard let persistentFileURL = persistentFileURL else { return }
            do {
                let itemsPlist = try Data(contentsOf: persistentFileURL)
                let decoder = PropertyListDecoder()
                let decodedItems = try decoder.decode([ShoppingItem].self, from: itemsPlist)
                self.items = decodedItems
                print(self.items.count)
            } catch {
                print("Error loading items from plist: \(error)")
            }
        }
    func updateShoppingList(for item: ShoppingItem) {
        if let itemAdded = items.firstIndex(of: item) {
            var shoppingItem = items[itemAdded]
            shoppingItem.added.toggle()
            items[itemAdded] = shoppingItem
            saveToPersistentStore()
            print(shoppingItem.added)
        }
    }
    
}
