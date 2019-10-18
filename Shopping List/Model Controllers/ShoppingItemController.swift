//
//  ItemController.swift
//  Shopping List
//
//  Created by Dennis Rudolph on 10/18/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import Foundation

class ShoppingItemController {
    
    // Properties
    
    var shoppingItems: [ShoppingItem] = []
    let itemNames = ["Apple", "Grapes", "Milk", "Muffin", "Popcorn", "Soda", "Strawberries"]
    var addedItems: [ShoppingItem] {
        let theItems = shoppingItems
        return theItems.filter { $0.added == true }
    }
    
    // Initializer
    
    init() {
        loadFromPersistentStore()
        if shoppingItems.count == 0 {
            for item in itemNames {
                create(itemName: item, hasBeenAdded: false)
                saveToPersistentStore()
            }
        }
    }
    
    //  Methods (CRUD)
    
    func create(itemName: String, hasBeenAdded: Bool) {
        shoppingItems.append(ShoppingItem(name: itemName, added: hasBeenAdded))
    }
    
    func update(item: ShoppingItem) {
        guard let index = shoppingItems.index(of: item) else { return }
        let status = item.added
        shoppingItems[index].added = !status
        saveToPersistentStore()
    }
    
    // Persistence Stuff
    
    var shoppingListURL: URL? {
        let fm = FileManager.default
        guard let dir = fm.urls(for: .documentDirectory, in: .userDomainMask).first else { return nil }
        let fileName = "ShoppingList.plist"
        return dir.appendingPathComponent(fileName)
    }
    
    private func saveToPersistentStore() {
        guard let url = shoppingListURL else { return }
        let encoder = PropertyListEncoder()
        do {
            let data = try encoder.encode(shoppingItems)
            try data.write(to: url)
        } catch {
            print("Error loading shopping item data: \(error)")
        }
    }
    
    private func loadFromPersistentStore() {
        let fm = FileManager.default
        guard let url = shoppingListURL,
            fm.fileExists(atPath: url.path) else { return }
        
        do {
            let data = try Data(contentsOf: url)
            let decoder = PropertyListDecoder()
            let decodedItems = try decoder.decode([ShoppingItem].self, from: data)
            shoppingItems = decodedItems
        } catch {
            print("Error loading books data: \(error)")
        }
    }
}




