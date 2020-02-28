//
//  ShoppingItemController.swift
//  Shopping List
//
//  Created by Samuel Esserman on 2/28/20.
//  Copyright © 2020 Lambda School. All rights reserved.
//

import Foundation
//MARK: - Key
extension String {
    static let isFirstRunKey = "ShoppingListIsFirstRunKey"
}

class ShoppingItemController {
    
    var shoppingItems: [ShoppingItem] = []
    
    let itemNames = ["Apple", "Grapes", "Milk", "Muffin", "Popcorn", "Soda", "Strawberries"]
    
    var hasData: Bool {
        let setting = UserDefaults.standard.bool(forKey: .isFirstRunKey)
        
        if !setting {
            return false
        }
        
        return true
 
    }
    
    var addedItems: [ShoppingItem] {
        let added = shoppingItems.filter { return $0.hasBeenAdded }
        return added
    }
    
    var notAddedItems: [ShoppingItem] {
        let notAdded = shoppingItems.filter { return !$0.hasBeenAdded }
        return notAdded
    }
    
    var numberOfItemsAdded: Int {
        let filtered = shoppingItems.filter { return $0.hasBeenAdded }
        return filtered.count
    }
    
    var persistentFileURL: URL? {
        let fileManager = FileManager.default
        
        guard let documentsDirectory = fileManager.urls(for: .documentDirectory, in: .userDomainMask).first else { return nil }
        
        let shoppingItemURL = documentsDirectory.appendingPathComponent("shoppingItems.plist")
        
        return shoppingItemURL
        
    }
    
    init() {
        if !hasData {
            for item in itemNames {
                createShoppingItem(name: item, hasBeenAdded: false)
            }
            
            UserDefaults.standard.set(true, forKey: .isFirstRunKey)
            
        } else {
          loadFromPersistentStore()
        }
        
        
    }
    
    func saveToPersistentStore() {
        guard let fileURL = persistentFileURL else { return }
        
        do {
            let encoder = PropertyListEncoder()
            let data = try encoder.encode(shoppingItems)
            try data.write(to: fileURL)
            
            
        } catch {
            print(error)
        }
        
    }
    
    func loadFromPersistentStore() {
        guard let fileURL = persistentFileURL else { return }
        
        do {
            
            let decoder = PropertyListDecoder()
            
            let propertyListData = try Data(contentsOf: fileURL)
            let data = try decoder.decode([ShoppingItem].self, from: propertyListData)
            
            shoppingItems = data
            
            
        } catch {
            print(error)
        }
        
    }
    
    func createShoppingItem(name: String, hasBeenAdded: Bool) {
        let shoppingItem = ShoppingItem(name: name, hasBeenAdded: hasBeenAdded)
        shoppingItems.append(shoppingItem)
        saveToPersistentStore()
    }
    
    func toggleHasBeenAdded(for item: ShoppingItem) {
        if let shoppingItemIndex = shoppingItems.firstIndex(of: item) {
            var shoppingItem = shoppingItems[shoppingItemIndex]
            shoppingItem.hasBeenAdded.toggle()
            shoppingItems[shoppingItemIndex] = shoppingItem
            saveToPersistentStore()
            
        }
        
    }
    
}
