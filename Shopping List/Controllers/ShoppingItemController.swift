//
//  ShoppingItemController.swift
//  Shopping List
//
//  Created by Donella Barcelo on 11/15/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import UIKit

class ShoppingItemController {
    
    let cell = ShoppingListCollectionViewCell()
    var itemNames = ["Apple", "Grapes", "Milk", "Muffin", "Popcorn", "Soda", "Strawberries"]
    var shoppingItems: [ShoppingItem] = []
    var shoppingListURL: URL? {
        
        let fileManager = FileManager.default
        guard let URL = fileManager.urls(for: .desktopDirectory, in: .userDomainMask).first else { return nil }
        return URL.appendingPathComponent("ShoppingList.plist")
    }
    
    var itemsAdded: [ShoppingItem] {
        return shoppingItems.filter { $0.addedToList }
    }
    init() {
        let userDefaults = UserDefaults.standard
        if userDefaults.bool(forKey: "createItems") {
        } else {
            createItems()
        }
    }
    func saveToPersistentStore() {
        guard let URL = shoppingListURL else { return }
        do {
            let encoder = PropertyListEncoder()
            let itemData = try encoder.encode(shoppingItems)
            try itemData.write(to: URL)
            } catch {
                    print("Error: \(error)")
        }
    }
               
    func loadFromPersistentStore() {
        let fileManager = FileManager.default
        guard let URL = shoppingListURL, fileManager.fileExists(atPath: URL.path) else { return }
        do {
            let decoder = PropertyListDecoder()
            let itemData = try Data(contentsOf: URL)
            let decodeItems = try decoder.decode([ShoppingItem].self, from: itemData)
            shoppingItems = decodeItems
            } catch {
                    print("\(error)")
        }
    }
    
    func addToPersistentStore(index: Int) {
        guard let URL = shoppingListURL else { return }
        do {
            let encoder = PropertyListEncoder()
            let newItem = shoppingItems[index]
            let itemData = try encoder.encode(newItem)
            try itemData.write(to: URL)
            } catch {
                    print("Error: \(error)")
        }
    }
    
    func update(item: ShoppingItem) {
        guard let index = shoppingItems.index(of: item) else { return }
        var newItem = shoppingItems[index]
        newItem.addedToList = !newItem.addedToList
        shoppingItems[index] = newItem
        saveToPersistentStore()
    }
    
    func createItems() {
        for name in itemNames {
            shoppingItems.append(ShoppingItem(name: name, addedToList: false))
        }
        let userDefaults = UserDefaults.standard
        userDefaults.set(true, forKey: "createItems")
        saveToPersistentStore()
    }
    
    func removeShoppingItem() {
        for item in shoppingItems {
            guard let index = shoppingItems.index(of: item) else { return }
            if item.addedToList == true {
                shoppingItems.remove(at: index)
                shoppingItems.append(ShoppingItem(name: "Strawberries", addedToList: true))
                addToPersistentStore(index:index)
            }
        }
    }
}

extension ShoppingItemController: addItemDelegate {
    func itemIsAdded(_ item: ShoppingItem) {
        shoppingItems.append(item)
    }
}
