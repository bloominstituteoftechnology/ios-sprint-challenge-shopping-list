//
//  ShoppingController.swift
//  Shopping List
//
//  Created by William Chen on 8/23/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import Foundation

class ShoppingController {
    var shoppingItems: [ShoppingItem] = []
    func createShoppingItems(shoppingItem: ShoppingItem){
        let itemNames = ["Apple", "Grapes", "Milk", "Muffin", "Popcorn", "Soda", "Strawberries"]
        
        for itemName in itemNames{
            let item = ShoppingItem(name: itemName, hasBeenAdded: false)
            shoppingItems.append(item)
        }
        
        var itemAdded = UserDefaults.standard.bool(forKey: "hasBeenRead")
        
        if itemAdded == false{
            itemAdded = true
        }
        saveToPersistentStore()
    }
        init(){
            loadFromPersistentStore()
            
        }
    
    private var persistentFileURL: URL? {
        let fileManager = FileManager.default
        guard let documents = fileManager.urls(for: .documentDirectory, in: .userDomainMask).first else { return nil }
        
        return documents.appendingPathComponent("ShoppingList.plist")
    }
    
    func saveToPersistentStore() {
        guard let url = persistentFileURL else { return }
        
        do {
            let encoder = PropertyListEncoder()
            let data = try encoder.encode(shoppingItems)
            try data.write(to: url)
        } catch {
            print("Error saving stars data: \(error)")
        }
    }
    
    func loadFromPersistentStore() {
        let fileManager = FileManager.default
        guard let url = persistentFileURL, fileManager.fileExists(atPath: url.path) else { return }
        
        do {
            let data = try Data(contentsOf: url)
            let decoder = PropertyListDecoder()
            shoppingItems = try decoder.decode([ShoppingItem].self, from: data)
        } catch {
            print("Error loading stars data: \(error)")
        }
    }
    
    
}
