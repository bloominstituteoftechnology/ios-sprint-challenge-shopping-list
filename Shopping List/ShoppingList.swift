//
//  ShoppingList.swift
//  Shopping List
//
//  Created by Kenneth Jones on 5/1/20.
//  Copyright © 2020 Lambda School. All rights reserved.
//

import Foundation

class ShoppingList {
    
    init() {
        populateItems()
    }
    
    var itemNames = ["Apple", "Grapes", "Milk", "Muffin", "Popcorn", "Soda", "Strawberries"]
    
    private(set) var items: [ShoppingItem] = []
    
    func populateItems() {
        if !UserDefaults.standard.bool(forKey: .itemsInitializedKey) {
            for item in itemNames {
                items.append(ShoppingItem(itemName: item, itemAdded: false))
            }
            
            UserDefaults.standard.set(true, forKey: .itemsInitializedKey)
            saveToPersistentStore()
        } else {
            loadFromPersistentStore()
        }
    }
    
    private var shoppingListURL: URL? {
        let fm = FileManager.default
        guard let directory = fm.urls(for: .documentDirectory, in: .userDomainMask).first else { return nil }
        return directory.appendingPathComponent("ShoppingList.plist")
    }
    
    var addedItems: [ShoppingItem] {
        return items.filter({ $0.itemAdded })
    }
    
    var notAddedItems: [ShoppingItem] {
        return items.filter({ $0.itemAdded == false })
    }
    
    func updateAdded(for item: ShoppingItem) {
        guard let itemIndex = items.firstIndex(of: item) else { return }
        items[itemIndex].itemAdded = !items[itemIndex].itemAdded
        saveToPersistentStore()
    }
    
    func saveToPersistentStore() {
        guard let url = shoppingListURL else { return }
        
        do {
            let encoder = PropertyListEncoder()
            let shoppingData = try encoder.encode(items)
            try shoppingData.write(to: url)
        } catch {
            NSLog("Error saving shopping data: \(error)")
        }
    }
    
    func loadFromPersistentStore() {
        guard let url = shoppingListURL else { return }
        
        do {
            let shoppingData = try Data(contentsOf: url)
            let decoder = PropertyListDecoder()
            let decodedItems = try decoder.decode([ShoppingItem].self, from: shoppingData)
            items = decodedItems
        } catch {
            NSLog("Error loading shopping data: \(error)")
        }
    }
    
}
