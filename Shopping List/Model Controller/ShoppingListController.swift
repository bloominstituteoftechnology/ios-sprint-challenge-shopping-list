//
//  ShoppingListController.swift
//  Shopping List
//
//  Created by David Wright on 12/15/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import Foundation

class ShoppingListConroller {
    
    // MARK: - Properties

    var shoppingList: [ShoppingItem] = []
    
    var shoppingCart: [ShoppingItem] {
        return shoppingList.filter( { $0.isOnShoppingList } )
       }
    
    // MARK: - Methods

    func createShoppingItem(withName name: String, isOnShoppingList: Bool = false) {
        let shoppingItem = ShoppingItem(name: name, isOnShoppingList: isOnShoppingList)
        
        guard !shoppingList.contains(shoppingItem) else { return }
        shoppingList.append(shoppingItem)
        saveToPersistentStore()
    }
    
    func updateIsOnShoppingList(for item: ShoppingItem) {
        if let index = shoppingList.firstIndex(of: item) {
            shoppingList[index].isOnShoppingList.toggle()
            saveToPersistentStore()
        }
    }
    
    // MARK: - Persistence

    private var shoppingListURL: URL? {
        let fileManager = FileManager.default
        guard let documents = fileManager.urls(for: .documentDirectory, in: .userDomainMask).first else { return nil }
        return documents.appendingPathComponent("ShoppingList.plist")
    }
    
    private func saveToPersistentStore() {
        guard let url = shoppingListURL else { return }
        let encoder = PropertyListEncoder()
        
        do {
            let shoppingListData = try encoder.encode(shoppingList)
            try shoppingListData.write(to: url)
        } catch {
            NSLog("Error saving shoppingList data: \(error)")
        }
    }
    
    func loadFromPersistentStore() {
        do {
            let fileManager = FileManager.default
            guard let url = shoppingListURL, fileManager.fileExists(atPath: url.path) else { return }
            let data = try Data(contentsOf: url)
            let decoder = PropertyListDecoder()
            let decodeShoppingList = try decoder.decode([ShoppingItem].self, from: data)
            shoppingList = decodeShoppingList
        } catch {
            NSLog("Error loading shoppingList data: \(error)")
        }
    }
    
    // MARK: - Initializer
    
    init() {
        let userDefaults = UserDefaults.standard
        let itemsHaveBeenInitialized = userDefaults.bool(forKey: .itemsHaveBeenInitializedKey)
        
        if itemsHaveBeenInitialized {
            loadFromPersistentStore()
        } else {
            let itemNames = ["Apple", "Grapes", "Milk", "Muffin", "Popcorn", "Soda", "Strawberries"]
            var itemList: [ShoppingItem] = []
            
            for name in itemNames {
                let item = ShoppingItem(name: name)
                itemList.append(item)
            }
            shoppingList = itemList
            saveToPersistentStore()
            userDefaults.set(true, forKey: .itemsHaveBeenInitializedKey)
        }
    }
    
}

extension String {
    static var itemsHaveBeenInitializedKey = "ItemsHaveBeenInitialized"
}
