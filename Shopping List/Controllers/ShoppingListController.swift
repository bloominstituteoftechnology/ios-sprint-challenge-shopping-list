//
//  ShoppingListController.swift
//  Shopping List
//
//  Created by Lambda_School_Loaner_101 on 6/14/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import Foundation

class ShoppingListController {
    
    let itemNames = ["Apple", "Grapes", "Milk", "Muffin", "Popcorn", "Soda", "Strawberries"]
    
    // create shopping list array
    // create new shopping item for every item in itemNames
    // append new shopping item to the shopping list array
    
    var shoppingList: [ShoppingItem] = []
    
    private var persistentFileURL: URL? {
        let fileManager = FileManager.default
        guard let documents = fileManager.urls(for: .documentDirectory, in: .userDomainMask).first else {
            return nil
        }
        return documents.appendingPathComponent("shoppingList.pist")
    }
    
    init() {
        for item in itemNames {
            let shoppingItem = ShoppingItem(itemName: item, imageName: item)
            shoppingList.append(shoppingItem)
            
            loadFromPersistenceStore()
        }
        
    }
    
    func saveToPersistenceStore() {
        guard let url = persistentFileURL else { return }
        
        do {
            let encoder = PropertyListEncoder()
            let data = try encoder.encode(shoppingList)
            try data.write(to: url)
        } catch {
            print("Error saving shopping list data: \(error)")
        }
    }
    
    func loadFromPersistenceStore() {
        let fileManager = FileManager.default
        guard let url = persistentFileURL,
            fileManager.fileExists(atPath: url.path) else { return }
        
        do {
            let data = try Data(contentsOf: url)
            let decoder = PropertyListDecoder()
            shoppingList = try decoder.decode([ShoppingItem].self, from: data)
        } catch {
            print("Error loading shopping list data: \(error)")
        }
    }
}
