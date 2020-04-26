//
//  ShoppingListController.swift
//  Shopping List
//
//  Created by David Williams on 2/23/20.
//  Copyright © 2020 Lambda School. All rights reserved.
//

import Foundation

class ShoppingController {
    
    var items = [Item]()
    var itemsOrdered: [String] = []
    var list = ""
    init() {
        creatShoppingListItems()
        loadFromPersistentStore()
    }
    
    

    func creatShoppingListItems() {
        guard UserDefaults.standard.bool(forKey: "ItemsHaveBeenCreated") != true else { return }
        let itemNames = ["Apple", "Grapes", "Milk", "Muffin", "Popcorn", "Soda", "Strawberries"]
        for itemString in itemNames {
            let item = Item(name: itemString)
            items.append(item)
        }
    }
    
    func orderedItems(_ name: String) {
        itemsOrdered.append(name)
      
    }
    
    func removeItem(_ item: String ) {
        for (index, value) in itemsOrdered.enumerated() {
            if value == item {
                itemsOrdered.remove(at: index)
            }
        }
    }
  
func updateAddedBool(shoppingItem: Item) {
       
        shoppingItem.added = !shoppingItem.added
     
        saveToPersistentStore()
    }
    
    var shoppingListURL: URL? {
        let fileManager = FileManager.default
        guard let documents = fileManager.urls(for: .documentDirectory, in: .userDomainMask).first else { return nil }
        
        return documents.appendingPathComponent("shoppingList.plist")
    }
    
    func saveToPersistentStore() {
        do {
            guard let url = shoppingListURL else { return }
            let encoder = PropertyListEncoder()
            let listsData = try encoder.encode(items)
            try listsData.write(to: url)
        } catch {
            print("Something went wrong: \(error)")
        }
    }
    
    func loadFromPersistentStore() {
        do {
            guard let url = shoppingListURL else { return }
            let listsData = try Data(contentsOf: url)
            let decodedLists = PropertyListDecoder()
            items  = try decodedLists.decode([Item].self, from: listsData)
        } catch {
            print("Something went wrong: \(error)")
        }
    }
}
