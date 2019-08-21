//
//  ShoppingList.swift
//  Shopping List
//
//  Created by Casualty on 8/17/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//


import Foundation

class ShoppingList {
    
    //Create blank array to hold ShoppingItem Objects either loaded from local storage or created during runtime.
    private(set) var groceries: [ShoppingItem] = []
    
    //Create Individual Arrays for items available and items in basket
    var availableItems: [ShoppingItem] {
        let unselected = groceries.filter { $0.isAvailable == true }
        return unselected
    }
    
    var unavailableItems: [ShoppingItem] {
        let selected = groceries.filter { $0.isAvailable == false }
        return selected
    }
    
    init() {
        loadData()
    }
    
    var groceryListURL: URL? = {
        let fileManager = FileManager()
        guard let documents = fileManager.urls(for: .documentDirectory, in: .userDomainMask).first else { return nil}
        return documents.appendingPathComponent("grocerylist.plist")
    }()

    func loadData() {
        let userDefaults = UserDefaults.standard
        if userDefaults.bool(forKey: String.groceryKey) {
            loadFromPersistentStore()
        } else {
            let itemNames = ["Apple", "Grapes", "Milk", "Muffin", "Popcorn", "Soda", "Strawberries"]
            for shoppingItem in itemNames {
                groceries.append(ShoppingItem(name: shoppingItem))
            }
            saveToPersistentStore()
            userDefaults.set(true, forKey: String.groceryKey)
        }
    }

    func loadFromPersistentStore() {
        let fileManager = FileManager.default
        guard let url = groceryListURL, fileManager.fileExists(atPath: url.path) else { return }
        let decoder = PropertyListDecoder()
        
        do {
            let data = try Data.init(contentsOf: url)
            groceries = try decoder.decode([ShoppingItem].self, from: data)
        } catch {
            print("Error: \(error)")
        }
        
    }
    
    func saveToPersistentStore() {
        guard let url = groceryListURL else { return }
        let encoder = PropertyListEncoder()
        
        do{
            let shoppingData = try encoder.encode(groceries)
            try shoppingData.write(to: url)
        } catch {
            print("Error: \(error)")
        }
        
    }
    
    func shoppingItemToggle(for item: ShoppingItem){
        guard let itemIndex = groceries.index(of: item) else { return }
        groceries[itemIndex].isAvailable.toggle()
        saveToPersistentStore()
    }

    
}
