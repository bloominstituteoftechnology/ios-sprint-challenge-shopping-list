//
//  ShoppingItemController.swift
//  Shopping List
//
//  Created by Paul Yi on 1/25/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import Foundation

class ShoppingItemController {
    private(set) var shoppingItems: [ShoppingItem] = []
    
    // MARK: - Initializers
    
    init() {
        
        // check if user defaults contains a key for LaunchedBefore
        if UserDefaults.standard.bool(forKey: "LaunchedBefore") {
            // if so, load from the file
            loadFromPersistentStore()
            
            // otherwise, set the key to true for the next, and make all the necessary items
        } else {
            UserDefaults.standard.set(true, forKey: "LaunchedBefore")
            
            // create shopping items
            self.createShoppingItem(withName: "Apple", image: "apple")
            self.createShoppingItem(withName: "Grapes", image: "grapes")
            self.createShoppingItem(withName: "Milk", image: "milk")
            self.createShoppingItem(withName: "Muffin", image: "muffin")
            self.createShoppingItem(withName: "Popcorn", image: "popcorn")
            self.createShoppingItem(withName: "Soda", image: "soda")
            self.createShoppingItem(withName: "Strawberries", image: "strawberries")
        }
    }
    
    // MARK: - CRUD
    
    func createShoppingItem(withName name: String, image: String, isAdded: Bool = false) {
        let shoppingItem = ShoppingItem(name: name, image: image, isAdded: isAdded)
        shoppingItems.append(shoppingItem)
        
    }
    
    func update(shoppingItem: ShoppingItem, name: String, image: String, isAdded: Bool) {
        guard let index = shoppingItems.index(of: shoppingItem) else { return }
        
        var shoppingItem = shoppingItem
        shoppingItem.name = name
        shoppingItem.image = image
        shoppingItem.isAdded = isAdded
        
        shoppingItems.remove(at: index)
        shoppingItems.insert(shoppingItem, at: index)
        
    }
    
    func delete(shoppingItem: ShoppingItem) {
        guard let index = shoppingItems.index(of: shoppingItem) else { return }
        
        shoppingItems.remove(at: index)
    }
    
    // MARK: - Methods
    
    func updateIsAdded(for shoppingItem: ShoppingItem) {
        guard let index = shoppingItems.index(of: shoppingItem) else { return }
        
        var shoppingItem = shoppingItems[index]
        shoppingItem.isAdded = !shoppingItem.isAdded
        
        shoppingItems.remove(at: index)
        shoppingItems.insert(shoppingItem, at: index)
        
    }
    
    // MARK: - Persistence
    
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
            guard let url = persistentFileURL, fm.fileExists(atPath: url.path) else { return }
            
            let data = try Data(contentsOf: url)
            let decoder = PropertyListDecoder()
            let decodedShoppingItems = try decoder.decode([ShoppingItem].self, from: data)
            shoppingItems = decodedShoppingItems
        } catch {
            NSLog("Error saving photos data \(error)")
        }
    }
}
