//
//  ShoppingItemController.swift
//  Shopping List
//
//  Created by user162867 on 12/20/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import Foundation

class ShoppingItemController {
    
    // Properties
    var shoppingItems: [ShoppingItem] = []
    
    func instantiateItems() {
        let itemNames = ["Apple", "Grapes", "Milk", "Muffin", "Popcorn", "Soda", "Strawberries"]

        for itemName in itemNames {
            let item = ShoppingItem(name: itemName)
            shoppingItems.append(item)
        }
    }
    
    func toggleIt(for item: ShoppingItem) {
        guard let index = shoppingItems.firstIndex(of: item) else { return }
        
        shoppingItems[index].added.toggle()
    }
    
    private var fileURL: URL? {
        let fileManager = FileManager.default
        guard let directory = fileManager.urls(for: .documentDirectory, in: .userDomainMask).first else { return nil }
        return directory.appendingPathComponent("shopping-list.plist")
    }
    
    private func saveToPersistentStore() {
        guard let url = fileURL else { return }
        do {
            let encoder = PropertyListEncoder()
            let shoppingData = try encoder.encode(shoppingItems)
            try shoppingData.write(to: url)
        } catch {
            NSLog("Error saving data: \(error)")
        }
    }
    
    private func loadFromPersistentStore() {
        do {
            let fileManager = FileManager.default
            guard let url = fileURL, fileManager.fileExists(atPath: url.path) else { return }
            let data = try Data(contentsOf: url)
            let decoder = PropertyListDecoder()
            let decodeList = try decoder.decode([ShoppingItem].self, from: data)
            shoppingItems  = decodeList
        } catch {
            NSLog("Error loading data \(error)")
        }
    }
    
    init() {
        let itemsAreInitialized = UserDefaults.standard.bool(forKey: .initializedKey)
        
        if itemsAreInitialized {
            loadFromPersistentStore()
        } else {
            instantiateItems()
            saveToPersistentStore()
            UserDefaults.standard.set(true, forKey: .initializedKey)
        }
    }
}

extension String {
    static var initializedKey = "ItemsAreInitialized"
}
