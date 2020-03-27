//
//  ShoppingItemController.swift
//  Shopping List
//
//  Created by Hunter Oppel on 3/27/20.
//  Copyright © 2020 Lambda School. All rights reserved.
//

import Foundation
import UIKit

class ShoppingListController {
    
    // MARK: Properties
    
    let itemNames = ["Apple", "Grapes", "Milk", "Muffin", "Popcorn", "Soda", "Strawberries"]
    var shoppingList: [ShoppingItem] = []
    var persistentFileURL: URL? {
        let fileManager = FileManager.default
        let documentsDir = fileManager.urls(for: .documentDirectory, in: .userDomainMask).first
        
        let itemsURL = documentsDir?.appendingPathComponent("items.plist")
        return itemsURL
    }

    // MARK: - CRUD
    
    func createItem(name: String) {
        shoppingList.append(ShoppingItem(name: name))
    }
    
    func updateItem(item: ShoppingItem) {
        guard let itemIndex = shoppingList.firstIndex(of: item) else {return}
        
        shoppingList[itemIndex].didAdd = !shoppingList[itemIndex].didAdd
    }
    
    // MARK: - Persistance
    
    func saveToPersistentStore() {
        guard let persistentFileURL = persistentFileURL else {return}

        do {
            let encoder = PropertyListEncoder()
            let itemsPlist = try encoder.encode(shoppingList)
            
            try itemsPlist.write(to: persistentFileURL)
        } catch {
            print("Error saving added items: \(error)")
        }
    }
    
    func loadFromPersistentStore() {
        guard let persistentFileURL = persistentFileURL else {return}

        do {
            let decoder = PropertyListDecoder()
            
            let itemsPlist = try Data(contentsOf: persistentFileURL)
            let items = try decoder.decode([ShoppingItem].self, from: itemsPlist)
            
            self.shoppingList = items
        } catch {
            print("Error loading added items: \(error)")
        }
    }
    
    // MARK: - Userdefaults
    
    func initializeItems() {
        for item in itemNames {
            if !UserDefaults.standard.bool(forKey: item) {
                shoppingList.append(ShoppingItem(name: item))
                UserDefaults.standard.set(true, forKey: item)
            }
        }
        for item in shoppingList {
            if !itemNames.contains(item.name) {
                guard let itemIndex = shoppingList.firstIndex(of: item) else {return}
                shoppingList.remove(at: itemIndex)
            }
        }
    }
}
