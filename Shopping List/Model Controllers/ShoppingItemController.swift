//
//  ShoppingItemController.swift
//  Shopping List
//
//  Created by Ciara Beitel on 9/13/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import Foundation

class ShoppingItemController {
    
    let itemNames = ["Apple", "Grapes", "Milk", "Muffin", "Popcorn", "Soda", "Strawberries"]
    
    var shoppingList: [ShoppingItem] = []
    
    private var persistentFileURL: URL? {
        let fileManager = FileManager.default
        guard let documents = fileManager.urls(for: .documentDirectory, in: .userDomainMask).first else { return nil }
        return documents.appendingPathComponent("Info.plist")
    }
    
    init() {
        let hasAppBeenOpened = UserDefaults.standard.bool(forKey: "hasAppBeenOpened")
        if hasAppBeenOpened {
            loadFromPersistentStore()
        } else {
            UserDefaults.standard.set(true, forKey: "hasAppBeenOpened")
            for item in itemNames {
                let shoppingItem = ShoppingItem(name: item, addedToList: false)
                shoppingList.append(shoppingItem)
            }
            saveToPersistentStore()
        }
    }
    
    func saveToPersistentStore() {
        guard let url = persistentFileURL else { return }
        do {
            let encoder = PropertyListEncoder()
            let data = try encoder.encode(shoppingList) // encode throws a possible error, so you must put try infront of it
            try data.write(to: url)
        } catch {
            print("Error saving shopping list data: \(error)")
        }
    }
    
    func loadFromPersistentStore() {
        let fileManager = FileManager.default
        guard let url = persistentFileURL,
            fileManager.fileExists(atPath: url.path) else { return }
        
        do {
            let data = try Data(contentsOf: url)
            let decoder = PropertyListDecoder()
            shoppingList = try decoder.decode([ShoppingItem].self, from: data)
        } catch {
            print("Error loading shopping list data: \(error)")
        }
    }
}
