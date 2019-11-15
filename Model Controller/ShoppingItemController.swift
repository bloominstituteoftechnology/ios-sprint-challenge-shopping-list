//
//  ShoppingItemController.swift
//  Shopping List
//
//  Created by Patrick Millet on 11/15/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import Foundation
import UIKit

class ShoppingItemController {
    
  init() {
        updateShoppingList()
        loadFromPersistentStore()
    }


     var shoppingList: [ShoppingItem] = []

    // MARK: - Creating the Shopping list
    
    func addItem(with name: String, isAdded: Bool, with image: Data) -> ShoppingItem {
        
        let item = ShoppingItem(name: name, isAdded: isAdded, image: image)
        shoppingList.append(item)
        saveToPersistentStore()
        
        return item
    }
    
    func updateShoppingList() {
        guard UserDefaults.standard.bool(forKey: .itemsHaveBeenCreated) == false else { return }
        
        let itemsNames = ["Apple", "Grapes", "Milk", "Muffin", "Popcorn", "Soda", "Strawberries"]
        
        saveToPersistentStore()
        UserDefaults.standard.set(false, forKey: .itemsHaveBeenCreated)
    }
    
    // MARK: CRUD
    
    
    func deleteItem(named item: ShoppingItem) {
        guard let index = shoppingList.firstIndex(of: item) else { return }
        
        shoppingList.remove(at: index)
        saveToPersistentStore()
        }
    
    func updateIsAdded(for item: ShoppingItem) {
        guard let index = shoppingList.firstIndex(of: item) else { return }
        shoppingList[index].isAdded.toggle()
        saveToPersistentStore()
    }
    
    // MARK: SORTING
    
    var addedItems: [ShoppingItem] {
        return shoppingList.filter { $0.isAdded }.sorted { $0.name.lowercased() < $1.name.lowercased() }
    }
    var unaddedItems: [ShoppingItem] {
        return shoppingList.filter { $0.isAdded == false }.sorted { $0.name.lowercased() < $1.name.lowercased() }
    }
    
    
    
    
    // MARK: PERSISTENCE
    
    private var shoppingListURL: URL? {
    let fileManager = FileManager.default
    
    guard let documentsDir = fileManager.urls(for: .documentDirectory, in: .userDomainMask).first else { return nil }
    
    return documentsDir.appendingPathComponent("ShoppingList.plist")
    }
    
    func saveToPersistentStore() {
        
        let encoder = PropertyListEncoder()
        
        do {
            let listData = try encoder.encode(shoppingList)
            guard let fileURL = shoppingListURL else { return }
            try listData.write(to: fileURL)
        } catch let listError {
            print("Error saving your List \(listError)")
        }
        
    }
    
    func loadFromPersistentStore() {
        
        let fileManager = FileManager.default
        guard let fileURL = shoppingListURL, fileManager.fileExists(atPath: fileURL.path) else { return }

        do {
            let data = try Data(contentsOf: fileURL)
            let decoder = PropertyListDecoder()
            shoppingList = try decoder.decode([ShoppingItem].self, from: data)
        } catch {
            print("Error loading list data \(error)")
        }
    }
}


