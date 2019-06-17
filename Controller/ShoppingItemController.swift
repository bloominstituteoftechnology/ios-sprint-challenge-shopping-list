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
    
    var itemsInCart: Int = UserDefaults.standard.integer(forKey: .shouldBeOnList)
    var loaded = UserDefaults.standard.bool(forKey: .isLoaded)
    
    private var shoppingListURL: URL? {
        let fileManager = FileManager.default
        guard let documents = fileManager.urls(for: .documentDirectory, in: .userDomainMask).first else { return nil }
        print("Documents: \(documents.path)")
        return documents.appendingPathComponent("shoppingItem.plist")
    }

    init() {
        checkLaunchStatus()
    }


func checkLaunchStatus() {
    if !loaded {
        let itemNames = [
                    ShoppingItem(name: "Apple"),
                    ShoppingItem(name: "Grapes"),
                    ShoppingItem(name: "Milk"),
                    ShoppingItem(name: "Muffin"),
                    ShoppingItem(name: "Popcorn"),
                    ShoppingItem(name: "Soda"),
                    ShoppingItem(name: "Strawberries")
                    ]
        for item in itemNames {
            let addedItem = ShoppingItem(name: item.name, isOnList: false)
            shoppingList.append(addedItem)
        }
        UserDefaults.standard.set(true, forKey: .isLoaded)
        saveToPersistentStore()
    } else {
        loadFromPersistentStore()
    }
}

    
    func addToCart(add item: ShoppingItem) {
        guard let index = shoppingList.index(of: item) else { return }
        shoppingList[index].isOnList = !shoppingList[index].isOnList
        if shoppingList[index].isOnList == true {
            itemsInCart += 1
        } else {
            itemsInCart -= 1
        }

        saveToPersistentStore()
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
