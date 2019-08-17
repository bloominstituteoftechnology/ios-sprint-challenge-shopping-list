//
//  ShoppingItemController.swift
//  Shopping List
//
//  Created by Fabiola S on 8/16/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import Foundation

class ShoppingItemController {
    private(set) var items: [ShoppingItem] = []
    
    private var persistentFileURL: URL? {
        
        let fileManager = FileManager.default
        guard let documents = fileManager.urls(for: .documentDirectory, in: .userDomainMask).first else { return nil }
        return documents.appendingPathComponent("shoppingitem.plist")
    }
    
    init() {
        loadFromPersistentStore()
    }
    
    func createShoppingItem(named itemName: String, AddedToList wasAddedToList: Bool) -> ShoppingItem {
        
        let item = ShoppingItem(itemName: itemName, wasAddedToList: wasAddedToList)
        items.append(item)
        saveToPersistentStore()
        return item
        
    }
    
    func saveToPersistentStore() {
        guard let url = persistentFileURL else { return }
        
        do {
            let encoder = PropertyListEncoder()
            let data = try encoder.encode(items)
            try data.write(to: url)
        } catch {
            print("Error saving items data: \(error)")
        }
    }
    
    func loadFromPersistentStore() {
        let fileManager = FileManager.default
        guard let url = persistentFileURL, fileManager.fileExists(atPath: url.path) else { return }
        
        do {
            let data = try Data(contentsOf: url)
            let decoder = PropertyListDecoder()
            items = try decoder.decode([ShoppingItem].self, from: data)
        } catch {
            print("Error loading items data: \(error)")
        }
    }
}
