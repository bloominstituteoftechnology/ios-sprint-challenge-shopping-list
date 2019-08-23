//
//  ShoppingItemsController.swift
//  Shopping List
//
//  Created by Jordan Christensen on 8/23/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import Foundation

class ShoppingItemsController {
    private(set) var shoppingList: [ShoppingItem] = []
    let itemNames = ["Apple", "Grapes", "Milk", "Muffin", "Popcorn", "Soda", "Strawberries"]
    var addedItems: [ShoppingItem] {
        let added = shoppingList.filter { $0.isSelected == true }
        return added
    }
    
    let userDefaults = UserDefaults.standard
    
    init() {
        let hasList: Bool = UserDefaults.standard.bool(forKey: "hasList")
        if hasList {
            loadFromPersistentStore()
        } else {
            for i in 0..<itemNames.count {
                shoppingList.append(ShoppingItem(name: itemNames[i], isSelected: false))
            }
            saveToPersistentStore()
            
            userDefaults.set(true, forKey: "hasList")
        }
    }
    
    private var persistentFileURL: URL? {
        let fileManager = FileManager.default
        guard let documents = fileManager.urls(for: .documentDirectory, in: .userDomainMask).first else { return nil }
        
        return documents.appendingPathComponent("shoppingList.plist")
    }
    
    func saveToPersistentStore() {
        guard let url = persistentFileURL else { return }
        
        do {
            let encoder = PropertyListEncoder()
            let data = try encoder.encode(shoppingList)
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
            shoppingList = try decoder.decode([ShoppingItem].self, from: data)
        } catch {
            print("Error loading stars data: \(error)")
        }
    }
}
