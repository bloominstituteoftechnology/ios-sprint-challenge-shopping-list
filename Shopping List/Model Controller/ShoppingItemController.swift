//
//  ShoppingItemController.swift
//  Shopping List
//
//  Created by Ilgar Ilyasov on 9/14/18.
//  Copyright © 2018 Lambda School. All rights reserved.
//

import Foundation

class ShoppingItemController {
    
    // MARK: - Properties:
    
    var shoppingList = [ShoppingItem]()
    var itemNames = ["apple", "grapes", "milk", "muffin", "popcorn", "soda", "strawberries"]
    
    // MARK: CRUD methods
    
    func addShoppingList(itemName: String, imageData: Data, hasBeenAdded: Bool) {
        let newItem = ShoppingItem(name: itemName, imageData: imageData, hasBeenAdded: hasBeenAdded)
        shoppingList.append(newItem)
        
        saveToPersistentStore()
    }
    
    func changeStatus(for item: ShoppingItem) {
        guard let index = shoppingList.index(of: item) else { return }
        shoppingList[index].hasBeenAdded = !shoppingList[index].hasBeenAdded
        
        saveToPersistentStore()
    }
    
    func removeFromShoppingList(item: ShoppingItem) {
        guard let index = shoppingList.index(of: item) else { return }
        shoppingList.remove(at: index)
        
        saveToPersistentStore()
    }
    
    // MARK: Persistence
    
    var persistentFileURL: URL? {
        let fm = FileManager.default
        guard let documentDir = fm.urls(for: .documentDirectory, in: .userDomainMask).first else { return nil }
        return documentDir.appendingPathComponent("shoppinglist.plist")
    }
    
    func saveToPersistentStore() {
        guard let url = persistentFileURL else { return }
        
        do {
            let plistEncoder = PropertyListEncoder()
            let data = try plistEncoder.encode(shoppingList)
            try data.write(to: url)
        } catch {
            NSLog("Error saving data: \(error)")
        }
    }
    
    func loadFromPersistentStore() {
        let fm = FileManager.default
        guard let url = persistentFileURL, fm.fileExists(atPath: url.path) else { return }
        
        do {
            let data = try Data(contentsOf: url)
            let plistDecoder = PropertyListDecoder()
            shoppingList = try plistDecoder.decode([ShoppingItem].self, from: data)
        } catch {
            NSLog("Error loading data: \(error)")
        }
    }
    
    // MARK - Initializer
    
    init() {
        loadFromPersistentStore()
    }
    
}
