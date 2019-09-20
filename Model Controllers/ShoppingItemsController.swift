//
//  ShoppingItemsController.swift
//  Shopping List
//
//  Created by macbook on 9/20/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import Foundation

class ShoppingItemsController {
    
    init() {
        updateShoppingList()
        loadFromPersistentStore()
    }
    
    
     var shoppingList: [ShoppingItem] = []
    
    
    // MARK: - Creating the Shopping list
    func updateShoppingList() {
        
        let itemsNames = ["Apple", "Grapes", "Milk", "Muffin", "Popcorn", "Soda", "Strawberries"]
        
        for item in itemsNames {
            
            let newItem = ShoppingItem(name: item, isAdded: false)
            shoppingList.append(newItem)
        }
        saveToPersistentStore()
    }
    
    
//    func createItems() {
//        shoppingList
//        let userDefault = UserDefaults.standard
//        userDefault.set(false, forKey: .itemsHaveBeenCreated)
//    }
    
//    @discardableResult func addShoppingItem(named name: String, isAdded: Bool) -> ShoppingItem {
//
////        let addedItem = ShoppingItem(name: name, isAdded: isAdded)
////        shoppingList.append(addedItem)
//        saveToPersistentStore()
//
//        return shoppingItem
//    }
//
    private var persistentFileURL: URL? {
        
        let filemanager = FileManager.default
        guard let documents = filemanager.urls(for: .documentDirectory, in: .userDomainMask).first else { return nil }
        
        return documents.appendingPathComponent("shoppingList.plist")
        
    }
    
    // MARK: - Save to Persistence Store
    func saveToPersistentStore() {
        
        // Stars > Data > PList
        guard let url = persistentFileURL else { return }
        
        do {
            
            let encoder = PropertyListEncoder()
            let data = try encoder.encode(shoppingList)
            try data.write(to: url)
            
            // writing data to shoppingList.plist
            
        } catch {
            print("Error saving stars data \(error)")
            
            
        }
    }
    
     // MARK: - Load to Persistence Store
    func loadFromPersistentStore() {
        
        // PList > Data > Stars
        let fileManager = FileManager.default
        guard let url = persistentFileURL,
            fileManager.fileExists(atPath: url.path) else { return }
        
        do {
            
            let data = try Data(contentsOf: url)
            let decoder = PropertyListDecoder()
            shoppingList = try decoder.decode([ShoppingItem].self, from: data)
            
            
        } catch {
            print("Error loading stars data \(error)")
            
        }
    }
}


