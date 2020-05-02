//
//  ShoppingListController.swift
//  Shopping List
//
//  Created by Josh Kocsis on 5/1/20.
//  Copyright © 2020 Lambda School. All rights reserved.
//

import Foundation

class ShoppingListController {
    
    var shoppingList: [ShoppingItems] = []
    let itemNames = ["Apple", "Grapes", "Milk", "Muffin", "Popcorn", "Soda", "Strawberries"]
    
    func createItems() {
        for name in itemNames{
        let item = ShoppingItems(name: name, imageName: name)
        shoppingList.append(item)
        saveToPersistenceStore()
        }
    }
    
    func updateShoppingList(for item: ShoppingItems) {
        guard let list = shoppingList.index(of: item) else { return }
            var thisItem = item
            thisItem.hasBeenAdded = !item.hasBeenAdded
            shoppingList.remove(at: list)
            shoppingList.insert(thisItem, at: list)
            saveToPersistenceStore()
        }
        
        var shoppingListURL: URL? {
            let fm = FileManager.default
            guard let documents = fm.urls(for: .documentDirectory, in: .userDomainMask).first else { return nil }
            return documents.appendingPathComponent("ShoppingList.plist")
        }
        
        func saveToPersistenceStore() {
            guard let url = shoppingListURL else { return }
            
            do {
                let encoder = PropertyListEncoder()
                let shoppingListData = try encoder.encode(shoppingList)
                try shoppingListData.write(to: url)
            } catch {
                NSLog("An error has occured error: \(error)")
        }
    }
    
        func loadFromPersistenceStore() {
            let fm = FileManager.default
            guard let url = shoppingListURL, fm.fileExists(atPath: url.path) else { return }
            
            do {
                let listData = try Data(contentsOf: url)
                let listDecoder = PropertyListDecoder()
                shoppingList = try listDecoder.decode([ShoppingItems].self, from: listData)
            } catch {
                NSLog("An error has occured error: \(error)")
            }
    }
    
    init() {
        let userDefaults = UserDefaults.standard
        let itemsAreInitialized = userDefaults.bool(forKey: .itemsAreInitialized)
        
        if itemsAreInitialized {
            loadFromPersistenceStore()
        } else {
                createItems()
                userDefaults.set(true, forKey: .itemsAreInitialized)
                saveToPersistenceStore()
        }
    }
}
extension String {
    static var itemsAreInitialized = "ItemsAreInitialized"
}
