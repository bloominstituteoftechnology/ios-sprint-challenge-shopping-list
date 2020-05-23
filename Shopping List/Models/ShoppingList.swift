//
//  ShoppingList.swift
//  Shopping List
//
//  Created by Mike Nichols on 5/22/20.
//  Copyright © 2020 Lambda School. All rights reserved.
//

import Foundation

protocol ShoppingListDelegate {
    func saveToPersistentStore()
    
    func loadFromPersistentStore()
}


class ShoppingList: Codable  {
    
    var delegate: ShoppingListDelegate?

    var shoppingList: [ShoppingItem] = []
    var persistentFileURL: URL? {
        let fileManager = FileManager.default
        let documentsDir = fileManager.urls(for: .documentDirectory, in: .userDomainMask).first
        let url = documentsDir?.appendingPathComponent("shoppingList.plist")
        
        return url
    }

    init() {
        let isNewUser = UserDefaults.standard.bool(forKey: "isNewUser")
        if isNewUser == true {
            let itemNames = ["Apple", "Grapes", "Milk", "Muffin", "Popcorn", "Soda", "Strawberries"]
            for item in itemNames {
                let item = ShoppingItem(itemName: item, isOnList: false)
                shoppingList.append(item)
            }
            saveToPersistentStore()
            let defaults = UserDefaults.standard
            defaults.set(false, forKey: "isNewUser")
        }  else {
            loadFromPersistentStore()
        }
    }
    
    func loadFromPersistentStore() {
        do {
            guard let persistentFileURL = persistentFileURL else { return }
            
            let shoppingListPList = try Data(contentsOf: persistentFileURL)
            let decoder = PropertyListDecoder()
            let decodedShoppingList = try decoder.decode([ShoppingItem].self, from: shoppingListPList)
            self.shoppingList = decodedShoppingList
            
        } catch {
            fatalError("Failed to load list")
        }
    }
    
    func saveToPersistentStore() {
        do {
            guard let persistentFileURL = persistentFileURL else { return }
            
            let encoder = PropertyListEncoder()
            let encodedShoppingList = try encoder.encode(shoppingList)
            try encodedShoppingList.write(to: persistentFileURL)
            
        } catch {
            
            fatalError("Failed to save list")
            
        }
}
}

