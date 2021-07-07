//
//  ShoppingItemController.swift
//  Shopping List
//
//  Created by Paul Yi on 1/25/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import UIKit

class ShoppingItemController {
    private(set) var shoppingItems: [ShoppingItem] = []
    
    var shoppingItemsOnList: [ShoppingItem] {
        return shoppingItems.filter { (shoppingItem) -> Bool in
            return shoppingItem.isAdded
        }
    }
    
    var shoppingItemsNotOnList: [ShoppingItem] {
        return shoppingItems.filter { (shoppingItem) -> Bool in
            return !shoppingItem.isAdded
        }
    }
    
    // MARK: - Initializers
    init() {
        loadFromPersistentStore()
    }
    
    // MARK: - CRUD Methods
   
    func createShoppingItem(name: String, imageData: Data, isOnShoppingList: Bool) {
        let shoppingItem = ShoppingItem(name: name, imageData: imageData, isAdded: isOnShoppingList)
        
        shoppingItems.append(shoppingItem)
        saveToPersistentStore()
    }
    
    func toggleIsOnList(for shoppingItem: ShoppingItem) {
        guard let index = shoppingItems.index(of: shoppingItem) else { return }
        
        shoppingItems[index].isAdded = !shoppingItems[index].isAdded
        saveToPersistentStore()
    }
    
    func resetShoppingList() {
        for index in 0 ..< shoppingItems.count {
            shoppingItems[index].isAdded = false
        }
        saveToPersistentStore()
    }
    
    func update(shoppingItem: ShoppingItem, name: String, imageData: Data) {
        guard let index = shoppingItems.index(of: shoppingItem) else {
            NSLog("Cannot find the shopping item in the shopping items array")
            return
        }
        
        shoppingItems[index].name = name
        shoppingItems[index].imageData = imageData
        saveToPersistentStore()
    }
    
    func delete(_ shoppingItem: ShoppingItem) {
        guard let index = shoppingItems.index(of: shoppingItem) else { return }
        
        shoppingItems.remove(at: index)
        saveToPersistentStore()
    }
    // MARK: - Persistence
    
    private var persistentStoreURL: URL? {
        guard let documentsURL = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first else { return nil }
        let fileName = "shoppingItems.plist"
        
        return documentsURL.appendingPathComponent(fileName)
    }
    
    private func saveToPersistentStore() {
        guard let url = persistentStoreURL else { return }
        let plistEncoder = PropertyListEncoder()
        
        do {
            let shoppingItemsData = try plistEncoder.encode(shoppingItems)
            try shoppingItemsData.write(to: url)
        } catch {
            NSLog("Error saving data to persistent store: \(error)")
        }
    }
    
    private func loadFromPersistentStore() {
        loadSampleShoppingItems()
        guard let url = persistentStoreURL,
            FileManager.default.fileExists(atPath: url.path) else { return }
        let plistDecoder = PropertyListDecoder()
        
        do {
            let shoppingItemsData = try Data(contentsOf: url)
            shoppingItems = try plistDecoder.decode([ShoppingItem].self, from: shoppingItemsData)
        } catch {
            NSLog("Error reading data from persistent store: \(error)")
        }
    }
    
    // MARK: - Private Utility Methods

    private func loadSampleShoppingItems() {
        let hasLoadedSamepleItems = UserDefaults.standard.bool(forKey: "HasLoadedSampleItems")
        guard !hasLoadedSamepleItems else { return }
        
        let itemNames = ["apple", "grapes", "milk", "muffin", "popcorn", "soda", "strawberries"]
        for item in itemNames {
            if let image = UIImage(named: item), let imageData = UIImagePNGRepresentation(image) {
                createShoppingItem(name: item, imageData: imageData, isOnShoppingList: false)
            }
        }
        UserDefaults.standard.set(true, forKey: "HasLoadedSampleItems")
    }
}
