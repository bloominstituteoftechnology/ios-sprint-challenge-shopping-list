//
//  ShoppingListController.swift
//  Shopping List
//
//  Created by Nichole Davidson on 2/28/20.
//  Copyright © 2020 Lambda School. All rights reserved.
//

import Foundation

extension String {
    static var itemAdded = "itemAdded"
}

class ShoppingListController {
    
    var items: [ShoppingItem] = []
    
    init() {
        createShoppingList()
        loadFromPersistentStore()
    }
    
    func createShoppingList() {
        guard UserDefaults.standard.bool(forKey: String.itemAdded) != true else { return }
        
        let itemNames = ["Apple", "Grapes", "Milk", "Muffin", "Popcorn", "Soda", "Strawberries"]
        
        for itemName in itemNames {
            let shoppingItem = ShoppingItem(name: itemName)
            items.append(shoppingItem)
        }
        saveToPersistentStore()
        
        UserDefaults.standard.set(true, forKey: String.itemAdded)
    }
    
    func updateShoppingList(shoppingItem: ShoppingItem) {
        shoppingItem.itemAdded = !shoppingItem.itemAdded
        saveToPersistentStore()
    }
    
    // MARK: - Persistence
    
    var persistentFileURL: URL? {
        
        let fileManager = FileManager.default
     
        let documentsDir = fileManager.urls(for: .documentDirectory, in: .userDomainMask).first
    
        let itemsURL = documentsDir?.appendingPathComponent("items.plist")
        
        return itemsURL
    }

    func saveToPersistentStore() {
        
        let encoder = PropertyListEncoder()
        
        do {
        
            let itemsPlist = try encoder.encode(items)
            
            guard let itemsURL = persistentFileURL else { return }
            
           try itemsPlist.write(to: itemsURL)
            
        } catch {
       
            print("Unable to save items to plist: \(error)")
            
        }
    }
    
    func loadFromPersistentStore() {
        
        guard let itemsURL = persistentFileURL else { return }
        
        let decoder = PropertyListDecoder()
        
        do {
    
            let itemsData = try Data(contentsOf: itemsURL)
            
            let itemsArray = try decoder.decode([ShoppingItem].self, from: itemsData)
            
            self.items = itemsArray
            
        } catch {
            print("Error decoding items: \(error)")
            
        }
    }
}
