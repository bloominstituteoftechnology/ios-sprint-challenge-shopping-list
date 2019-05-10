//
//  ShoppingController.swift
//  Shopping List
//
//  Created by Jeremy Taylor on 5/10/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import Foundation

class ShoppingController {
    private(set) var items: [ShoppingItem] = []
    
    init() {
        // Check if this is first launch
        checkFirstRun()
        
    }
    
     func createItem(withName name: String) {
        let item = ShoppingItem(name: name)
        items.append(item)
        saveToPersistentStore()
    }
    
    func updateItem(item: ShoppingItem) {
        guard let index = items.index(of: item) else { return }
        
        var tempItem = item
        tempItem.addedToList.toggle()
        items.remove(at: index)
        items.insert(tempItem, at: index)
        saveToPersistentStore()
    }
    
    enum UserDefaultsKeys: String {
        case firstRun = "firstRun"
    }
    
    private func checkFirstRun() {
        let userDefaults = UserDefaults.standard
        let firstRunKey = userDefaults.bool(forKey: UserDefaultsKeys.firstRun.rawValue)
        if !firstRunKey {
            // First Run
            setupInitialShoppingList()
            userDefaults.set(true, forKey: UserDefaultsKeys.firstRun.rawValue)
        }
    }
    
    private func setupInitialShoppingList() {
        let itemNames = ["Apple", "Grapes", "Milk", "Muffin", "Popcorn", "Soda", "Strawberries"]
        for item in itemNames {
            createItem(withName: item)
            
        }
    }
    
    func addedItemsCount() -> Int {
        var count = 0
        for item in items {
            if item.addedToList {
                count += 1
            }
        }
        return count
    }
    
    // MARK: - Persistence
    
    private var persistentFileURL: URL? {
        let fm = FileManager.default
        
        guard let documentsDirectory = fm.urls(for: .documentDirectory, in: .userDomainMask).first else { return nil }
        
        return documentsDirectory.appendingPathComponent("ShoppingList.plist")
    }
    
    func saveToPersistentStore() {
        guard let url = persistentFileURL else { return }
        
        let encoder = PropertyListEncoder()
        do {
            let data = try encoder.encode(items)
            try data.write(to: url)
        } catch {
            NSLog("Couldn't save shopping list data: \(error)")
        }
    }
    
    func loadFromPersistentStore() {
        do {
            let fm = FileManager.default
            guard let url = persistentFileURL, fm.fileExists(atPath: url.path) else { return }
            let data = try Data(contentsOf: url)
            let decoder = PropertyListDecoder()
            let decodedShoppingItems = try decoder.decode([ShoppingItem].self, from: data)
            items = decodedShoppingItems
        } catch {
            NSLog("Couldn't load shopping list data: \(error)")
        }
    }
}
