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

    var shoppingItems = [ShoppingItem]()
        

    var addedItems: [ShoppingItem] {
       let addedItems = shoppingItems.filter { $0.isAdded == true }
        return addedItems
        }
    var notAddedItems: [ShoppingItem] {
        let notAddedItems = shoppingItems.filter { $0.isAdded == false}
        return notAddedItems
    }
        init() {
            let userDefaults = UserDefaults.standard
            if userDefaults.bool(forKey: "createItems") {
            } else {
                createItems()
            }
        }
    
    var shoppingListURL: URL? {
       let fileManager = FileManager.default
           guard let URL = fileManager.urls(for: .desktopDirectory, in: .userDomainMask).first else { return nil }
           return URL.appendingPathComponent("ShoppingList.plist")
       }
    
        private func saveToPersistentStore() {
            guard let URL = shoppingListURL else { return }
            do {
                let encoder = PropertyListEncoder()
                let itemData = try encoder.encode(shoppingItems)
                try itemData.write(to: URL)
                } catch {
                        print("Error saving shopping list data: \(error)")
            }
        }
                   
       private func loadFromPersistentStore() {
            let fileManager = FileManager.default
            guard let URL = shoppingListURL,
                fileManager.fileExists(atPath: URL.path) else { return }
            do {
                let decoder = PropertyListDecoder()
                let itemData = try Data(contentsOf: URL)
                let decodeItems = try decoder.decode([ShoppingItem].self, from: itemData)
                shoppingItems = decodeItems
                } catch {
                        print("Error saving shopping list data: \(error)")
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
            shoppingItems[index].isAdded.toggle()
            saveToPersistentStore()
        }
        
        func createItems() {
            for name in itemNames {
                shoppingItems.append(ShoppingItem(itemName: name))
            }
            let userDefaults = UserDefaults.standard
            userDefaults.set(true, forKey: "createItems")
            saveToPersistentStore()
        }
        func updateAddedToCart(for item: ShoppingItem) {
            guard let itemIndex = shoppingItems.firstIndex(of: item) else { return }
            shoppingItems[itemIndex].isAdded.toggle()
            saveToPersistentStore()
        }
}

extension ShoppingItemController: itemsAddedDelegate {
    func itemsAdded(_ item: ShoppingItem) {
        shoppingItems.append(item)
    }
}
