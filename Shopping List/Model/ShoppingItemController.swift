//
//  ShoppingItemController.swift
//  Shopping List
//
//  Created by Bryan Cress on 5/22/20.
//  Copyright © 2020 Lambda School. All rights reserved.
//

import Foundation

extension String { static var addedPreferenceKey = "added" }

class ShoppingItemController {
    
    
    let itemNames = ["Apple", "Grapes", "Milk", "Muffin", "Popcorn", "Soda", "Strawberries"]
    var shoppingItems: [ShoppingItem] = []
    func createShoppingListItem() {
        for item in itemNames {
            shoppingItems.append(ShoppingItem(name: item, addedToCart: true))
        }
        saveToPersistentStore()
    }
    
    
    init() {
        if UserDefaults.standard.bool(forKey: .addPreferenceKey) != true {
            createShoppingListItem()
            UserDefaults.standard.set(true, forKey: .addPreferenceKey)
        } else {
            loadFromPersistentStore()
        }
        
    }
    
    
    var addedItems : [ShoppingItem] {
        return shoppingItems.filter{$0.addedToCart == true}
    }
    var notAddedItems : [ShoppingItem] {
        return shoppingItems.filter{$0.addedToCart == false}
        
    }
    
    // MARK: - Persistence
    
    var shoppingListURL: URL? {
        let fileManager = FileManager.default
        guard let documentsDirectory = fileManager.urls(for: .documentDirectory, in: .userDomainMask).first
            else { return nil }
        return documentsDirectory.appendingPathComponent("ShoppingList.plist")
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
}
