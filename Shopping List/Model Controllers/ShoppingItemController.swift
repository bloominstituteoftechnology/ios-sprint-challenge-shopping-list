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
    
    var shoppingList = [ShoppingItem(name: "Apple"),
                        ShoppingItem(name: "Grapes"),
                        ShoppingItem(name: "Milk"),
                        ShoppingItem(name: "Muffin"),
                        ShoppingItem(name: "Popcorn"),
                        ShoppingItem(name: "Soda"),
                        ShoppingItem(name: "Strawberries")]
    var persistentFileURL: URL? {
        let fileManager = FileManager.default
        let documentsDir = fileManager.urls(for: .documentDirectory, in: .userDomainMask).first
        
        let itemsURL = documentsDir?.appendingPathComponent("items.plist")
        return itemsURL
    }
    
    // MARK: - Lifecycle
    
    init() {
        loadFromPersistentStore()
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
}
