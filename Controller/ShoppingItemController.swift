//
//  ShoppingItemController.swift
//  Shopping List
//
//  Created by Kat Milton on 6/14/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import Foundation

class ShoppingItemController {
    private(set) var shoppingList: [ShoppingItem] = []
    
    
    var shoppingCart: [ShoppingItem] {
        let itemNames = [
            ShoppingItem(name: "Apple"),
            ShoppingItem(name: "Grapes"),
            ShoppingItem(name: "Milk"),
            ShoppingItem(name: "Muffin"),
            ShoppingItem(name: "Popcorn"),
            ShoppingItem(name: "Soda"),
            ShoppingItem(name: "Strawberries")
            ]
        
        
        let shouldBeOnList = UserDefaults.standard.bool(forKey: .shouldBeOnListKey)
        if shouldBeOnList {
            for item in itemNames {
                if let index = itemNames.index(of: item) {
                    addToCart(add: itemNames[index])
                }
            }
        }
        return itemNames
    }
    
    private var shoppingListURL: URL? {
        let fileManager = FileManager.default
        guard let documents = fileManager.urls(for: .documentDirectory, in: .userDomainMask).first else { return nil }
        print("Documents: \(documents.path)")
        return documents.appendingPathComponent("shoppingItem.plist")
    }

    init() {
        loadFromPersistentStore()
    }
    
    
    var addedItems: [ShoppingItem] {
        get {
            return ShoppingItemController().shoppingList.filter() {
                $0.isOnList == true
            }
    }
    }
    
    var unaddedItems: [ShoppingItem] {
        get {
            return ShoppingItemController().shoppingList.filter() {
                $0.isOnList == false
            }
        }
    }
    
    func addToCart(add item: ShoppingItem) {
        if let index = shoppingList.index(of: item) {
            shoppingList[index].isOnList = true
            saveToPersistentStore()
        }
        
    }
    
    func removeFromCart(remove item: ShoppingItem) {
        if let index = shoppingList.index(of: item) {
            shoppingList[index].isOnList = false
            saveToPersistentStore()
        }
    }
    
    
    func saveToPersistentStore() {
        guard let url = shoppingListURL else { return }
        do {
            let encoder = PropertyListEncoder()
            let data = try encoder.encode(shoppingList)
            try data.write(to: url)
           
        } catch {
            print("Error saving to disk: \(error)")
        }
    }
    
    
    
    
    func loadFromPersistentStore() {
        let fileManager = FileManager.default
        guard let url = shoppingListURL,
            fileManager.fileExists(atPath: url.path) else { return }
        
        do {
            guard let url = shoppingListURL else { return }
            let data = try Data(contentsOf: url)
            let decoder = PropertyListDecoder()
            let shoppingItems = try decoder.decode([ShoppingItem].self, from: data)
            shoppingList = shoppingItems
        } catch {
            print("Error loading from disk \(error)")
        }
    }
    
    
    
}
