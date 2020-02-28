//
//  ShoppingList.swift
//  Shopping List
//
//  Created by Shawn Gee on 2/28/20.
//  Copyright © 2020 Lambda School. All rights reserved.
//

import Foundation



class ShoppingList {
    
    //MARK: - CRUD
    
    // Read
    
    private(set) var shoppingItems: [ShoppingItem]
    
    var shoppingItemsOnList: [ShoppingItem] {
        shoppingItems.filter { $0.isOnShoppingList }
    }
    
    var shoppingItemsNotOnList: [ShoppingItem] {
        shoppingItems.filter { !$0.isOnShoppingList }
    }
    
    // Update
    
    func toggleItemOnShoppingList(_ item: ShoppingItem) {
        guard let index = shoppingItems.firstIndex(of: item) else { return }
        
        var itemToUpdate = shoppingItems[index]
        itemToUpdate.isOnShoppingList.toggle()
        
        shoppingItems[index] = itemToUpdate
    }
    
    
    //MARK: - Init
    
    init() {
        shoppingItems = [ShoppingItem]()
        
        if UserDefaults.standard.bool(forKey: "shoppingItemsInitialized") {
            loadFromPersistentStore()
        } else {
            let itemNames = ["Apple", "Grapes", "Milk", "Muffin", "Popcorn", "Soda", "Strawberries"]
            itemNames.forEach { shoppingItems.append(ShoppingItem(name: $0, isOnShoppingList: false))}
            saveToPersistentStore()
            UserDefaults.standard.set(true, forKey: "shoppingItemsInitialized")
        }
    }
    
    
    //MARK: - Persistence
    
    private let fileName = "ShoppingList.plist"
    
    private var shoppingListURL: URL {
        let documentsDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0]
        return documentsDirectory.appendingPathComponent(fileName)
    }
    
    private func saveToPersistentStore() {
        let encoder = PropertyListEncoder()
        
        do {
            let shoppingList = try encoder.encode(shoppingItems)
            try shoppingList.write(to: shoppingListURL)
        } catch {
            print("Couldn't save shopping list to persistent store, error: \(error)")
        }
    }
    
    private func loadFromPersistentStore() {
        let decoder = PropertyListDecoder()
        
        do {
            let shoppingListData = try Data(contentsOf: shoppingListURL)
            shoppingItems = try decoder.decode([ShoppingItem].self, from: shoppingListData)
        } catch {
            print("Couldn't load shopping list from persistent store, error: \(error)")
        }
    }
}
