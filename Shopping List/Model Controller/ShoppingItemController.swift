//
//  ShoppingItemController.swift
//  Shopping List
//
//  Created by Harmony Radley on 3/27/20.
//  Copyright © 2020 Lambda School. All rights reserved.
//

import Foundation

extension String { static var addedPreferenceKey = "added" }


class ShoppingItemController {
    
    
    let itemNames = ["Apple", "Grapes", "Milk", "Muffin", "Popcorn", "Soda", "Strawberries"]
    var shoppingItems: [ShoppingItem] = []
    var shoppingListURL: URL? {
        let fileManager = FileManager.default
        guard let documentsDirectory = fileManager.urls(for: .documentDirectory, in: .userDomainMask).first
            else { return nil }
        return documentsDirectory.appendingPathComponent("ShoppingList.plist")
    }
   
    init() {
        let added = UserDefaults.standard.bool(forKey: .addedPreferenceKey)
        if added {
            loadFromPersistentStore() }
        else {
            UserDefaults.standard.set(true, forKey: .addedPreferenceKey)
            addToCart()
            saveToPersistentStore()
        }
    }
    
    func saveToPersistentStore() {
        guard let save = shoppingListURL else { return }
        do {
            let encoder = PropertyListEncoder()
            let data = try encoder.encode(shoppingItems)
            try data.write(to: save)
        } catch {
            print("Encoding Error")
        }
    }
    
    func loadFromPersistentStore() {
        guard let save = shoppingListURL else { return }
        do {
            let data = try Data(contentsOf: save)
            let decoder = PropertyListDecoder()
            let shoppingItemList = try decoder.decode([ShoppingItem].self, from: data)
            self.shoppingItems = shoppingItemList
        } catch {
            print("Decoding Error")
        }
    }
        
    func addToCart() {
        for item in itemNames {
            shoppingItems.append(ShoppingItem(name: item))
        }
    }
    
}
