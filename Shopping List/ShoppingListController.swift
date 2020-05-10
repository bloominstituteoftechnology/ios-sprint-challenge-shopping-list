//
//  ShoppingListController.swift
//  Shopping List
//
//  Created by Lambda_School_Loaner_204 on 10/18/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import Foundation

extension String {
    static var shoppingListInitialized = "ShoppingListInitialized"
}

private let userDefaults = UserDefaults.standard

class ShoppingListController {
    
    // MARK: - Properties
    
    let itemNames = ["Apple", "Grapes", "Milk", "Muffin", "Popcorn", "Soda", "Strawberries"]
    
    var shoppingItems = [ShoppingItem]()
    
    var addedItems: [ShoppingItem] {
        let addedItems = shoppingItems.filter { $0.addedToShoppingList == true }
        return addedItems
    }
    
    var notAddedItems: [ShoppingItem] {
        let notAddedItems = shoppingItems.filter { $0.addedToShoppingList == false }
        return notAddedItems
    }
    
    
    // MARK: -Init
    init() {
        if !userDefaults.bool(forKey: .shoppingListInitialized) {
            createShoppingList()
        }
        
        loadFromPersistentStore()
    }

    // MARK: - Class Functions
    
    private func createShoppingList() {
        for name in itemNames {
            let shoppingItem = ShoppingItem(name: name)
            shoppingItems.append(shoppingItem)
        }
        saveToPersistentStore()
        userDefaults.set(true, forKey: .shoppingListInitialized)
    }
    
    func updateAddedToCart(for item: ShoppingItem) {
        guard let itemIndex = shoppingItems.firstIndex(of: item) else { return }
        shoppingItems[itemIndex].addedToShoppingList.toggle()
        saveToPersistentStore()
    }

    
    // MARK: - Persistence
    
    private var shoppingListURL: URL? {
        let fm = FileManager.default
        guard let dir = fm.urls(for: .documentDirectory, in: .userDomainMask).first else { return nil }
        let filename = "ShoppingList.plist"
        return dir.appendingPathComponent(filename)
    }
        
    private func saveToPersistentStore() {
        guard let url = shoppingListURL else { return }
        
        do {
            let encoder = PropertyListEncoder()
            let shoppingListData = try encoder.encode(shoppingItems)
            try shoppingListData.write(to: url)
        } catch {
            print("Error saving books data: \(error)")
        }
    }
    
    private func loadFromPersistentStore() {
        let fm = FileManager.default
        guard let url = shoppingListURL,
            fm.fileExists(atPath: url.path) else { return }
        
        do {
            let shoppingListData = try Data(contentsOf: url)
            let decoder = PropertyListDecoder()
            let decodedItems = try decoder.decode([ShoppingItem].self, from: shoppingListData)
            shoppingItems = decodedItems
        } catch {
            print("Error loading books data: \(error)")
        }
    }
}
