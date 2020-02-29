//
//  ShoppingListController.swift
//  Shopping List
//
//  Created by Harmony Radley on 2/28/20.
//  Copyright © 2020 Lambda School. All rights reserved.
//

import Foundation


extension String {
    static let addItemKey = "addItem"
}

class ShoppingListController {
    
    var itemNames = ["Apple",
                     "Grapes",
                     "Milk",
                     "Muffin",
                     "Popcorn",
                     "Soda",
                     "Strawberries"]
    var shoppingItems: [ShoppingItem] = []
    
    
    
    
    
    var shoppingListURL: URL? {
        let fileManager = FileManager.default
        guard let documentsDirectory = fileManager.urls(for: .documentDirectory, in: .userDomainMask).first
            else { return nil }
        return documentsDirectory.appendingPathComponent("ShoppingList.plist")
    }

 
    init() {
        let addedItem = UserDefaults.standard.bool(forKey: .addItemKey)
        if addedItem {
            loadFromPersistentStore() }
        else {
            UserDefaults.standard.set(true, forKey: .addItemKey)
            addItemCart()
            saveToPersistentStore()
        }
    }

    
    
   
    func saveToPersistentStore() {
        guard let itemsURL = shoppingListURL else { return }
        do {
            let encoder = PropertyListEncoder()
            let data = try encoder.encode(shoppingItems)
            try data.write(to: itemsURL)
        } catch {
            print("Unable to save item(s) to plist: \(error)")
        }
    }

    func loadFromPersistentStore() {
        guard let itemsURL = shoppingListURL else { return }
        do {
            let data = try Data(contentsOf: itemsURL)
            let decoder = PropertyListDecoder()
            let shoppingItemList = try decoder.decode([ShoppingItem].self, from: data)
            self.shoppingItems = shoppingItemList
        } catch {
            print("Error decoding items: \(error)")
        }
    }
    
    func addItemCart() {
        for item in itemNames {
            itemNames.append(item)
        }
    }
    
        
          
    
    
    
    }
    
    
    
    
    
    
    

