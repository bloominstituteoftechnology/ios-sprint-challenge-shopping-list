//
//  ShoppingItemController.swift
//  Shopping List
//
//  Created by Linh Bouniol on 8/3/18.
//  Copyright © 2018 Lambda School. All rights reserved.
//

import Foundation

class ShoppingItemController {
    
    // MARK: - Initializers
    
    init() {
        loadFromPersistentStore()
    }
    
    // MARK: - CRUD
    
    private(set) var shoppingItems: [ShoppingItem] = []
    
    func createShoppingItem(withName name: String, imageName: String, hasBeenAdded: Bool = false) {
        let shoppingItem = ShoppingItem(name: name, imageName: imageName, hasBeenAdded: hasBeenAdded)
        shoppingItems.append(shoppingItem)
        
        saveToPersistentStore()
    }
    
    func update(shoppingItem: ShoppingItem, name: String, imageName: String, hasBeenAdded: Bool) {
        guard let index = shoppingItems.index(of: shoppingItem) else { return }
        
        var shoppingItem = shoppingItem
        shoppingItem.name = name
        shoppingItem.imageName = imageName
        
        shoppingItem.hasBeenAdded = hasBeenAdded
        
        shoppingItems.remove(at: index)
        shoppingItems.insert(shoppingItem, at: index)
        
        saveToPersistentStore()
    }
    
    func delete(shoppingItem: ShoppingItem) {
        guard let index = shoppingItems.index(of: shoppingItem) else { return }
        
        shoppingItems.remove(at: index)
        
        saveToPersistentStore()
    }
    
    // MARK: - Methods
    
    func updateHasBeenAdded(for shoppingItem: ShoppingItem) {
        
    }
    
    // MARK: - Archiving
    
    private var persistentFileURL: URL? {
        let fm = FileManager.default
        
        guard let documentDirectory = fm.urls(for: .documentDirectory, in: .userDomainMask).first else { return nil }
        
        return documentDirectory.appendingPathComponent("ShoppingList.plist")
    }
    
    func saveToPersistentStore() {
        guard let url = persistentFileURL else { return }
        
        let encoder = PropertyListEncoder()
        
        do {
            let data = try encoder.encode(shoppingItems)
            try data.write(to: url)
        } catch {
            NSLog("Error saving photos data \(error)")
        }
    }
    
    func loadFromPersistentStore() {
        let fm = FileManager.default
        
        do {
            guard let url = persistentFileURL, fm.fileExists(atPath: url.path) else { return}
            
            let data = try Data(contentsOf: url)
            let decoder = PropertyListDecoder()
            let decodedShoppingItems = try decoder.decode([ShoppingItem].self, from: data)
            shoppingItems = decodedShoppingItems
        } catch {
            NSLog("Error saving photos data \(error)")
        }
    }
}
