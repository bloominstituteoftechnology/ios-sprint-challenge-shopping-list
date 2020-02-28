//
//  ShoppingItemController.swift
//  Shopping List
//
//  Created by Shawn James on 2/28/20.
//  Copyright © 2020 Lambda School. All rights reserved.
//

import UIKit

extension String { static var addedKey = "added" }

class ShoppingItemController {

    // MARK: - Properties
    let itemNames = ["Apple", "Grapes", "Milk", "Muffin", "Popcorn", "Soda", "Strawberries"]
    var shoppingItems: [ShoppingItem] = []
    var shoppingListURL: URL? {
        let fileManager = FileManager.default
        guard let documentsDirectory = fileManager.urls(for: .documentDirectory, in: .userDomainMask).first
            else { return nil }
        return documentsDirectory.appendingPathComponent("ShoppingList.plist")
    }
        
    // MARK: - Initializer
    init() {
        let added = UserDefaults.standard.bool(forKey: .addedKey)
        if added {
            loadFromPersistentStore() }
        else {
            UserDefaults.standard.set(true, forKey: .addedKey)
            addToCart()
            saveToPersistentStore()
        }
    }
    
    // MARK: - Methods
    func saveToPersistentStore() {
        guard let path = shoppingListURL else { return }
        do {
            let encoder = PropertyListEncoder()
            let data = try encoder.encode(shoppingItems)
            try data.write(to: path)
        } catch {
            print("Encoding Error")
        }
    }
    
    func loadFromPersistentStore() {
        guard let path = shoppingListURL else { return }
        do {
            let data = try Data(contentsOf: path)
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


