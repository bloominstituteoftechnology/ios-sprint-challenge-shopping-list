//
//  ShoppingItemController.swift
//  Shopping List
//
//  Created by Lambda_School_Loaner_259 on 2/28/20.
//  Copyright © 2020 Lambda School. All rights reserved.
//

import Foundation

class ShoppingItemController {
    // MARK: - Properties
    var shoppingList: [ShoppingItem] = []
    var itemNames: [String] = ["apple", "grapes", "milk", "muffin", "popcorn", "soda", "strawberries"]
    
    var shoppingListSelected: [ShoppingItem] {
        var slArray: [ShoppingItem] = []
        for item in shoppingList {
            if item.hasAddedItem {
                slArray.append(item)
            }
        }
        return slArray
    }
    
    init() {
        createShoppingList()
        loadFromPersistentStore()
    }
    // MARK: - CRUD
    
    func createItem(name: String) {
        let newItem = ShoppingItem(name: name, hasAddedItem: false)
        shoppingList.append(newItem)
        saveToPersistentStore()
    }
    
    func retrieveItem(atIndex: Int) -> ShoppingItem {
        return shoppingList[atIndex]
    }
    
    func updateItem(item: ShoppingItem, newName: String?) {
        guard let index = shoppingList.firstIndex(of: item) else { return }
        guard let newName = newName, !newName.isEmpty else { return }
        shoppingList[index].name = newName
        saveToPersistentStore()
    }
    
    func updateItemHasAdded(item: ShoppingItem) {
        guard let index = shoppingList.firstIndex(of: item) else { return }
        shoppingList[index].hasAddedItem.toggle()
        saveToPersistentStore()
    }
    
    func deleteItem(item: ShoppingItem) {
        guard let index = shoppingList.firstIndex(of: item) else { return }
        shoppingList.remove(at: index)
        saveToPersistentStore()
    }
    
    func createShoppingList() {
        if UserDefaults.standard.bool(forKey: "DidInitializeShoppingList") {
            loadFromPersistentStore()
        } else {
            for i in 0..<itemNames.count {
                createItem(name: itemNames[i])
            }
            UserDefaults.standard.set(true, forKey: "DidInitializeShoppingList")
            saveToPersistentStore()
        }
    }
    
    
    // MARK: - Persistence
    
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
            print("Error saving Shopping List data: \(error)")
        }
    }
    
    func loadFromPersistentStore() {
        
        let fileManager = FileManager.default
        guard let url = persistentFileURL, fileManager.fileExists(atPath: url.path) else {
            return }
        
        do {
            let data = try Data(contentsOf: url)
            let decoder = PropertyListDecoder()
            shoppingList = try decoder.decode([ShoppingItem].self, from: data)
        } catch {
            print("error loading Shopping List data: \(error)")
        }
    }
}


