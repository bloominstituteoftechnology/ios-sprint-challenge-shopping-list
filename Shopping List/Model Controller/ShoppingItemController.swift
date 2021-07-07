//
//  ShoppingItemController.swift
//  Shopping List
//
//  Created by Ilgar Ilyasov on 9/14/18.
//  Copyright © 2018 Lambda School. All rights reserved.
//

import UIKit

class ShoppingItemController {
    
    
    // MARK - Initializer
    
    init() {
        createItem()
        loadFromPersistentStore()
    }
    
    // MARK: - Properties:
    
    var shoppingList = [ShoppingItem]()
    
    // MARK: - Seperate Added Items
    
    var added: [ShoppingItem] {
        let allAdded = shoppingList.filter{ $0.hasBeenAdded == true }
        return allAdded
    }
    
    var notAdded: [ShoppingItem] {
        let allNotAdded = shoppingList.filter{ $0.hasBeenAdded == false }
        return allNotAdded
    }
    
    // MARK: - Create properties
    
    func createItem() {
        
        let itemNames = ["apple", "grapes", "milk", "muffin", "popcorn", "soda", "strawberries"]
        
        for item in itemNames {
            if let image = UIImage(named: item) {
                if let data = UIImageJPEGRepresentation(image, 1.0) {
                    let newItem = ShoppingItem(name: item, imageData: data)
                    shoppingList.append(newItem)
                }
            }
        }
        saveToPersistentStore()
    }
    
    // MARK: CRUD methods
    
    func changeStatus(for item: ShoppingItem) {
        guard let index = shoppingList.index(of: item) else { return }
        shoppingList[index].hasBeenAdded = !shoppingList[index].hasBeenAdded
        
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
}
