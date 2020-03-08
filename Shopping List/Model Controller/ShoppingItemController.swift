//
//  ShoppingItemController.swift
//  Shopping List
//
//  Created by Waseem Idelbi on 12/15/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import UIKit

class ShoppingItemController {
    
    init() {
        loadFromPresistentStore()
    }
    
    //MARK: -Important properties-
    
    var items: [Item] = []
    var addedItems: [Item] = []
    let createListKey = "CreateItemKey"
    
    var presistentFileURL: URL? {
        let fileManager = FileManager.default
        guard let documents = fileManager.urls(for: .documentDirectory, in: .userDomainMask).first else {return nil}
        return documents.appendingPathComponent("items.plist")
    }
    
    
    //MARK: -Important methods-
    
    func createShoppingList() {
        let itemNames = ["Apple", "Grapes", "Milk", "Muffin", "Popcorn", "Soda", "Strawberries"]
        guard !UserDefaults.standard.bool(forKey: createListKey) else {return}
        for item in itemNames {
            let itemInstance = Item(name: item)
            items.append(itemInstance)
        }
        UserDefaults.standard.set(true, forKey: createListKey)
    }
    
    func addOrRemove(item: Item, index: Int) {
        if item.itemWasAdded {
            addedItems.append(item)
        } else if item.itemWasAdded == false {
            addedItems.remove(at: index)
        }
        saveToPresistentStore()
    }
    
    func saveToPresistentStore() {
        guard let url = presistentFileURL else {return}
        do {
            let encoder = PropertyListEncoder()
            let data = try encoder.encode(items)
            try data.write(to: url)
        } catch {
            print("could not save items because: \(error)")
        }
    }
    
    func loadFromPresistentStore() {
        guard let url = presistentFileURL, FileManager.default.fileExists(atPath: url.path) else {return}
        let decoder = PropertyListDecoder()
        do {
            let data = try Data(contentsOf: url)
            try items = decoder.decode([Item].self, from: data)
        } catch {
            print("could not load the items array, error code: \(error)")
        }
        addedItems = []
        for addedItem in items {
            if addedItem.itemWasAdded {
                addedItems.append(addedItem)
            }
        }
    }
    
    
}//End of class


