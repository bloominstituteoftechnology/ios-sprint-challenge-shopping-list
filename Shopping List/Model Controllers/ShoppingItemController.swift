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
        
        // check if the user defaults contains a key for LaunchedBefore
        if UserDefaults.standard.bool(forKey: "LaunchedBefore") {
            // if it does, load from the file
            loadFromPersistentStore()
            
            // otherwise, set the key to true for next time, and make all the necessary items
        } else {
            UserDefaults.standard.set(true, forKey: "LaunchedBefore")
            
            // create all the items
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
    
    private(set) var shoppingItems: [ShoppingItem] = []
    
    func createShoppingItem(withName name: String, image: String, isAdded: Bool = false) {
        let shoppingItem = ShoppingItem(name: name, image: image, isAdded: isAdded)
        shoppingItems.append(shoppingItem)
        
        saveToPersistentStore()
    }
    
    func update(shoppingItem: ShoppingItem, name: String, image: String, isAdded: Bool) {
        guard let index = shoppingItems.index(of: shoppingItem) else { return }
        
        var shoppingItem = shoppingItem
        shoppingItem.name = name
        shoppingItem.image = image
        
        shoppingItem.isAdded = isAdded
        
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
    
    func updateIsAdded(for shoppingItem: ShoppingItem) {
        guard let index = shoppingItems.index(of: shoppingItem) else  { return }
        
        var shoppingItem = shoppingItems[index]
        shoppingItem.isAdded = !shoppingItem.isAdded
        
        // you arent saving the item back in over here. you made a copy, but didn't remove the old and add the new back in
        shoppingItems.remove(at: index)
        shoppingItems.insert(shoppingItem, at: index)
        
        saveToPersistentStore()
    }
    
    func shoppingCart(for shoppingItem: ShoppingItem) {
        
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
