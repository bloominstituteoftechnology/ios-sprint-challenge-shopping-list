//
//  ShoppingList.swift
//  Shopping List
//
//  Created by Joel Groomer on 8/17/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import Foundation

class ShoppingList {
    private(set) var items: [ShoppingItem] = []
    
    private var shoppingListURL: URL? = {
        let fileManager = FileManager.default
        guard let documents = fileManager.urls(for: .documentDirectory, in: .userDomainMask).first else { return nil }
        return documents.appendingPathComponent("shoppinglist.plist")
    }()
    
    var inList: [ShoppingItem] {
        let listed = items.filter { $0.inShoppingList == true }
        return listed
    }
    var notInList: [ShoppingItem] {
        let unlisted = items.filter { $0.inShoppingList == false }
        return unlisted
    }
    
    
    
    init() {
        if UserDefaults.standard.bool(forKey: "Initialized") {
            loadFromPersistentStore()
        } else {
            let itemNames = ["Apple", "Grapes", "Milk", "Muffin", "Popcorn", "Soda", "Strawberries"]
            for item in itemNames {
                items.append(ShoppingItem(name: item))
            }
            saveToPersistentStore()
            UserDefaults.standard.set(true, forKey: "Initialized")
        }
    }
    
    
    
    // MARK: - File I/O

    func saveToPersistentStore() {
        guard let url = shoppingListURL else { return }
        
        do {
            let encoder = PropertyListEncoder()
            let itemsData = try encoder.encode(items)
            try itemsData.write(to: url)
        } catch {
            print("Error saving shopping list data: \(error)")
        }
    }
    
    func loadFromPersistentStore() {
        let fileManager = FileManager.default
        guard let url = shoppingListURL, fileManager.fileExists(atPath: url.path) else { return }
        
        do {
            let data = try Data(contentsOf: url)
            let decoder = PropertyListDecoder()
            let decodedItems = try decoder.decode([ShoppingItem].self, from: data)
            items = decodedItems
        } catch {
            print("Error loading shoppinh list data: \(error)")
        }
    }
}
