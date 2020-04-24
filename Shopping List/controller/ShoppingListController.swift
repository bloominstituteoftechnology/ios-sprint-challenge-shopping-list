//
//  ShoppingListController.swift
//  Shopping List
//
//  Created by Vincent Hoang on 4/24/20.
//  Copyright © 2020 Lambda School. All rights reserved.
//

import Foundation
import os.log

class ShoppingListController {
    
    let itemNames = ["Apple", "Grapes", "Milk", "Muffin", "Popcorn", "Soda", "Strawberries"]
    
    var shoppingList: [ShoppingItem] = [ShoppingItem]()
    
    var shoppingListURL: URL? {
        let fileManager = FileManager.default
        let documentsDir = fileManager.urls(for: .documentDirectory, in: .userDomainMask).first
        let shoppingListURL = documentsDir?.appendingPathComponent("shoppinglist.plist")
        
        return shoppingListURL
    }
    
    init() {
        loadFromPersistentStore()
        generateShoppingList()
    }
    
    func generateShoppingList() {
        if itemNames.count != shoppingList.count {
            var itemList: [ShoppingItem] = [ShoppingItem]()
            for item in itemNames {
                itemList.append(ShoppingItem(item, false))
            }
        
            for item in itemList {
                if !shoppingList.contains(item) {
                   shoppingList.append(item)
                }
            }
        }
    }
    
    func saveToPersistentStore() {
        let encoder = PropertyListEncoder()
        
        guard let unwrappedURL = shoppingListURL else {
            fatalError("Unable to retrieve shoppingListURL")
        }
        
        do {
            var encodedList: Data
            try encodedList = encoder.encode(shoppingList)
            try encodedList.write(to: unwrappedURL)
            
            os_log("saveToPersistentStore() called")
        } catch {
            fatalError("Object was not of type [ShoppingItem] or error writing shopping list items to storage")
        }
        
        loadFromPersistentStore()
    }
    
    func loadFromPersistentStore() {
        let decoder = PropertyListDecoder()
        
        guard let unwrappedURL = shoppingListURL else {
            fatalError("Unable to retrieve shoppingListURL")
        }
        
        do {
            var data: Data
            
            try data = Data.init(contentsOf: unwrappedURL)
            
            try shoppingList = decoder.decode([ShoppingItem].self, from: data)
            
            os_log("%@", log: OSLog.default, type: .debug, "Successfully loaded shopping items from persistent storage. Number of items in shopping list: \(shoppingList.count)")
        } catch {
            return
        }
    }
}
