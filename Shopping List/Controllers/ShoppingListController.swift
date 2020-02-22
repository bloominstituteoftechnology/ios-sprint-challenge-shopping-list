//
//  ShoppingListController.swift
//  Shopping List
//
//  Created by conner on 2/21/20.
//  Copyright © 2020 Lambda School. All rights reserved.
//


import Foundation

class ShoppingListController {
    
    var items: [ShoppingItem] =
    [ShoppingItem(item: "Apple", added: false),
    ShoppingItem(item: "Grapes", added: false),
    ShoppingItem(item: "Milk", added: false),
    ShoppingItem(item: "Muffin", added: false),
    ShoppingItem(item: "Popcorn", added: false),
    ShoppingItem(item: "Soda", added: false),
    ShoppingItem(item: "Strawberries", added: false)]

    var added: [ShoppingItem] {
        return items.filter({$0.added})
    }
    
    var removed: [ShoppingItem] {
        return items.filter({!$0.added})
    }
    
    func updateList(for item: ShoppingItem) {
        // Confirm item in list
        guard let item = items.firstIndex(of: item) else { return }
        items[item].added = !items[item].added
        saveToPersisentStore()
    }
    
    init() {
        loadFromPersistentStore()
    }
    
    func newItem(name: String, added: Bool ) {
        let shoppingLists = ShoppingItem(item: name, added: added)
        items.append(shoppingLists)
        saveToPersisentStore()
    }
    
    // Persistance
    var persistentFileURL: URL?{
        let fileManager = FileManager.default
        guard let documents = fileManager.urls(for: .documentDirectory, in: .userDomainMask).first else { return nil }
        return documents.appendingPathComponent("ShoppingList.plist")
    }
    
    func saveToPersisentStore() {
        guard let url = persistentFileURL else { return }
        do {
            let encoder = PropertyListEncoder()
            let data = try encoder.encode(items)
            try data.write(to: url)
        } catch {
            print("Error saving items to storage")
        }
    }
    
    func loadFromPersistentStore() {
        let fileManager = FileManager.default
        guard let url = persistentFileURL, fileManager.fileExists(atPath: url.path) else { return }
        do {
            let decoder = PropertyListDecoder()
            let data = try Data(contentsOf: url)
            let array = try decoder.decode([ShoppingItem].self, from: data)
            self.items = array
        } catch {
            print("Error loading items from storage")
        }
    }
}
