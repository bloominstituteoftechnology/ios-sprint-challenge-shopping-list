//
//  ShoppingItemController.swift
//  Shopping List
//
//  Created by Osha Washington on 12/13/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import Foundation
import UIKit

class ShoppingItemController {

    var itemNames = ["APPLE", "GRAPES", "MILK", "MUFFIN", "POPCORN", "SODA", "STRAWBERRIES"]
    
    let cell = CollectionViewCell()
    var shoppingItems: [ShoppingItem] = []
        
    
    var shoppingListURL: URL? {
    let fileManager = FileManager.default
        guard let URL = fileManager.urls(for: .desktopDirectory, in: .userDomainMask).first else { return nil }
        return URL.appendingPathComponent("ShoppingList.plist")
    }

    var addedItems: [ShoppingItem] {
        return shoppingItems.filter { $0.isAdded }
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
                        print("Error saving shopping list data: \(error)")
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
                        print("Error saving shopping list data: \(error)")
            }
        }
        
        func update(item: ShoppingItem) {
            guard let index = shoppingItems.firstIndex(of: item) else { return }
            var newItem = shoppingItems[index]
            newItem.isAdded = !newItem.isAdded
            shoppingItems[index] = newItem
            saveToPersistentStore()
        }
        
        func createItems() {
            for name in itemNames {
                shoppingItems.append(ShoppingItem(itemName: name, isAdded: false))
            }
            let userDefaults = UserDefaults.standard
            userDefaults.set(true, forKey: "createItems")
            saveToPersistentStore()
        }
        
        func removeShoppingItem() {
            for item in shoppingItems {
                guard let index = shoppingItems.firstIndex(of: item) else { return }
                if item.isAdded == true {
                    shoppingItems.remove(at: index)
                    shoppingItems.append(ShoppingItem(itemName: "Soda", isAdded: true))
                    addToPersistentStore(index:index)
                }
            }
        }
    
         
       
    
}
