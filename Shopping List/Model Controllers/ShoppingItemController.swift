//
//  ShoppingItemController.swift
//  Shopping List
//
//  Created by Scott Bennett on 9/14/18.
//  Copyright © 2018 Lambda School. All rights reserved.
//

import Foundation
import UIKit

class ShoppingItemController {
    
    init() {
        loadFromPersistentStore()
        createShoppingListItems()
    }
    
    var shoppingListItems = [ShoppingListItem]()
    
// Mark: - Computed Properties
    
    private var persistentFileURL: URL? {
        let fm = FileManager.default
        guard let documentsDir = fm.urls(for: .documentDirectory, in: .userDomainMask).first else { return nil }
        return documentsDir.appendingPathComponent("Shopping List.plist")
    }
    
    
// MARK: - Persistence

    func saveToPersistentStore() {
        guard let url = persistentFileURL else { return }

        do {
            let encoder = PropertyListEncoder()
            let data = try encoder.encode(shoppingListItems)
            try data.write(to: url)
        } catch {
            NSLog("Error saving stars data: \(error)")
        }
    }

    func loadFromPersistentStore() {
        let fm = FileManager.default
        guard let url = persistentFileURL,fm.fileExists(atPath: url.path) else { return }

        do {
            let decoder = PropertyListDecoder()
            let data = try Data(contentsOf: url)
            let decode = try decoder.decode([ShoppingListItem].self, from: data)
            shoppingListItems = decode
        } catch {
            NSLog("Error saving stars data: \(error)")
        }
    }
    
    
// Mark: - Crud
    
    // Create and Save
    func createShoppingListItems() {
        guard UserDefaults.standard.bool(forKey: "hasCreatedItemsKey") == false else { return }
        let itemNames = ["apple", "grapes", "milk", "muffin", "popcorn", "soda", "strawberries"]
        for itemName in itemNames {
            let item = ShoppingListItem(itemName: itemName)
            shoppingListItems.append(item)
        }
        saveToPersistentStore()
        UserDefaults.standard.set(true, forKey: "hasCreatedItemsKey")
    }
    

    // Update and Save
    func updateShoppingListItems(for item: ShoppingListItem, itemName: String, addToList: Bool) {
        guard let index = shoppingListItems.index(of: item) else { return }
        shoppingListItems[index].itemName = itemName
        shoppingListItems[index].addToList = addToList
        saveToPersistentStore()
        
    }
    

    // ToggleAdd and Save
    func toggleAdd(for shoppingListItem: ShoppingListItem) {
        guard let index = shoppingListItems.index(of: shoppingListItem) else { return }
        shoppingListItems[index].addToList.toggle()
        saveToPersistentStore()
    }

}






