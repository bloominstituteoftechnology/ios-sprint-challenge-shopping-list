//
//  ShoppingItemController.swift
//  Shopping List
//
//  Created by morse on 5/3/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import Foundation

extension String {
    static let hasBeenLoadedKey = "hasBeenLoadedKey"
}

class ShoppingItemController {
    var shoppingItems: [ShoppingItem] = []
    let itemNames = ["apple", "grapes", "milk", "muffin", "popcorn", "soda", "strawberries"]
    
    var shoppingListURL: URL? {
        let fileManager = FileManager.default
        let fileName = "ShoppingList.plist"
        let documentDirectory = fileManager.urls(for: .documentDirectory, in: .userDomainMask).first!
        let location = documentDirectory.appendingPathComponent(fileName)
        return location
    }
    
    init() {
        let didCreateItems = UserDefaults.standard.bool(forKey: .hasBeenLoadedKey)
        if !didCreateItems {
            createItemsFromNames(itemNames: itemNames)
            UserDefaults.standard.set(true, forKey: .hasBeenLoadedKey)
            saveToPersistentStore()
        } else {
            loadFromPersistentStore()
        }
    }
    
    func saveToPersistentStore() {
        guard let url = shoppingListURL else { return }
        let encoder = PropertyListEncoder()
        
        do {
            let shoppingItemsData = try encoder.encode(shoppingItems)
            try shoppingItemsData.write(to: url)
        } catch {
            print(error)
        }
    }
    
    func loadFromPersistentStore() {
        guard let url = shoppingListURL, FileManager.default.fileExists(atPath: url.path) else { return }
        
        do {
            let data = try Data(contentsOf: url)
            let decoder = PropertyListDecoder()
            let decodedShoppingItems = try decoder.decode([ShoppingItem].self, from: data)
            shoppingItems = decodedShoppingItems
        } catch {
            print("Failed to load shopping items from the file system. Error: \(error)")
        }
    }
    
    func createItemsFromNames(itemNames: [String]) {
        for item in itemNames {
            createShoppingItem(name: item, imageName: item)
        }
        print("Created Items!!!!!")
    }
    
    func createShoppingItem(name: String, imageName: String) {
        let shoppingItem = ShoppingItem(name: name, imageName: imageName)
        shoppingItems.append(shoppingItem)
    }
    
    func updateHasBeenSelected(shoppingItem: ShoppingItem) {
        guard let index = shoppingItems.firstIndex(of: shoppingItem) else { return }
        switch shoppingItems[index].hasBeenAdded {
        case true: shoppingItems[index].hasBeenAdded = false
        case false: shoppingItems[index].hasBeenAdded = true
        }
        saveToPersistentStore()
    }
}

