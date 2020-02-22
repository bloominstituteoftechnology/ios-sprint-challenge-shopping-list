//
//  ShoppingItemController.swift
//  Shopping List
//
//  Created by Lambda_School_loaner_226 on 2/22/20.
//  Copyright © 2020 Lambda School. All rights reserved.
//

import Foundation

class ShoppingItemController
{
    
    //MARK - Items to be added
    
    let itemNames = ["Apple", "Grapes", "Milk", "Muffin", "Popcorn", "Soda", "Strawberries"]
    
    var shoppingListItem: [ShoppingItem] = []
    
    func addItemToCart() {
        for item in itemNames {
            let shoppingItem = ShoppingItem(name: item, hasBeenAdded: false)
            shoppingListItem.append(shoppingItem)
        }
    }
    
    init() {
        let hasBeenAdded = UserDefaults.standard.bool(forKey: .hasBeenAddedKey)
        if hasBeenAdded {
            loadFromPersistentStore()
        } else {
            UserDefaults.standard.set(true, forKey: .hasBeenAddedKey)
            addItemToCart()
            saveToPersistentStore()
        }
    }
    
    //MARK - Create Persistent Store
    
    var persistentFileURL: URL? {
        let fileManager = FileManager.default
        guard let documentsDirectory = fileManager.urls(for: .documentDirectory, in: .userDomainMask).first else {return nil}
        let itemsURL = documentsDirectory.appendingPathComponent("shoppingItems.plist")
        return itemsURL
    }
    
    //MARK: - Save
    
    func saveToPersistentStore() {
        guard let fileURL = persistentFileURL else { return }
        do {
            let encoder = PropertyListEncoder()
            let data = try encoder.encode(shoppingListItem)
            try data.write(to: fileURL)
        } catch {
            print("Error saving shopping data \(error)")
        }
    }
    
    //MARK: - Load
    
    func loadFromPersistentStore() {
        guard let fileURL = persistentFileURL else { return }
        
        do {
            let itemsData = try Data(contentsOf: fileURL)
            let decoder = PropertyListDecoder()
            let shoppingArray = try decoder.decode([ShoppingItem].self, from: itemsData)
            self.shoppingListItem = shoppingArray
        } catch {
            print("Error loading shopping data \(error)")
        }
    }
}

    //MARK: - Key

extension String {
    static var hasBeenAddedKey = "hasBeenAdded"
}
