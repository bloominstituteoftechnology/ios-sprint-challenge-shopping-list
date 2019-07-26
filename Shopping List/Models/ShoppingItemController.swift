//
//  ShoppingItemController.swift
//  Shopping List
//
//  Created by Alex Rhodes on 7/26/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import Foundation

class ShoppingItemController {
    
    let shoppingItem = ShoppingItem(name: "")
    
    var showItems: [ShoppingItem] = []
    let itemNames = ["Apple", "Grapes", "Milk", "Muffin", "Popcorn", "Soda", "Strawberries"]
    
    #warning("Ask andrew if there is a more simple way to write this, without the func")

    func initializeItems() {
        let key = String(shoppingItem.hasBeenAdded)
        UserDefaults.standard.bool(forKey: key)
    }
    init() {
        for itemName in itemNames {
            let individualItme = ShoppingItem(name: itemName)
            showItems.append(individualItme)
            
        }
    }
    
    func saveToPersistentStore() {
        guard let url = persistentFileURL else { return }
        
        do {
            let encoder = PropertyListEncoder()
            let data = try encoder.encode(itemNames)
            try data.write(to: url)
        } catch {
            print("Error loading stars data: \(error)")
        }
        saveToPersistentStore()
    }
    
    func loadFromPersistentStore() {
        let fm = FileManager.default
        guard let  url = persistentFileURL,
            fm.fileExists(atPath: url.path) else { return }
        
        do {
            let data = try Data(contentsOf: url)
            let decoder = PropertyListDecoder()
            showItems = try decoder.decode([ShoppingItem].self, from: data)
        } catch {
            print("Error loading stars data: \(error)")
        }
        saveToPersistentStore()
        
    }
    
    // MARK: - Private
    
    private var persistentFileURL: URL? {
        let fm = FileManager.default
        guard let dir = fm.urls(for: .documentDirectory, in: .userDomainMask).first else { return nil}
        return dir.appendingPathComponent("showItems.plist")
        
    }
    
}
