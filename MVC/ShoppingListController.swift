//
//  ShoppingListController.swift
//  Shopping List
//
//  Created by Josh Kocsis on 5/1/20.
//  Copyright © 2020 Lambda School. All rights reserved.
//

import Foundation

class ShoppingListController {
    
    var shoppingList: [ShoppingItems] = []
    var itemsAdded: [ShoppingItems] {
        return shoppingList.filter( { $0.hasBeenAdded})
    }
    
    func createItems(name: String, hasBeenAdded: Bool = false) {
        let item = ShoppingItems(name: name, hasBeenAdded: hasBeenAdded)
        shoppingList.contains(item)
        shoppingList.append(item)
        saveToPersistenceStore()
    }
    
    func updateShoppintList(for item: ShoppingItems) {
        if let list = shoppingList.firstIndex(of: item) {
            shoppingList[list].hasBeenAdded.toggle()
            saveToPersistenceStore()
        }
    }
        
        var shoppingListURL: URL? {
            let fm = FileManager.default
            guard let documents = fm.urls(for: .documentDirectory, in: .userDomainMask).first else { return nil }
            return documents.appendingPathComponent("ShoppingList.plist")
        }
        
        func saveToPersistenceStore() {
            guard let url = shoppingListURL else { return }
            let encoder = PropertyListEncoder()
            
            do {
                let shoppingListData = try encoder.encode(shoppingList)
                try shoppingListData.write(to: url)
            } catch {
                NSLog("An error has occured error: \(error)")
        }
    }
    
        func loadFromPersistenceStore() {
            let fm = FileManager.default
            guard let url = shoppingListURL, fm.fileExists(atPath: url.path) else { return }
            
            do {
                let listData = try Data(contentsOf: url)
                let listDecoder = PropertyListDecoder()
                shoppingList = try listDecoder.decode([ShoppingItems].self, from: listData)
            } catch {
                NSLog("An error has occured error: \(error)")
            }
    }
    
    init() {
        let userDefaults = UserDefaults.standard
        let itemsAreInitialized = userDefaults.bool(forKey: .itemsAreInitialized)
        
        if itemsAreInitialized {
            let itemNames = ["Apple", "Grapes", "Milk", "Muffin", "Popcorn", "Soda", "Strawberries"]
            for name in itemNames {
                createItems(name: name)
                saveToPersistenceStore()
            }
            userDefaults.set(true, forKey: .itemsAreInitialized)
        }
    }
}

extension String {
    static var itemsAreInitialized = "ItemsAreInitialized"
}
