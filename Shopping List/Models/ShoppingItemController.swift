//
//  ShoppingItemController.swift
//  Shopping List
//
//  Created by David Oliver Doswell on 8/3/18.
//  Copyright © 2018 Lambda School. All rights reserved.
//

import Foundation

class ShoppingItemController {
    
    var shoppingItems: [ShoppingItem] = []
    
    
    let itemNames = ["apple", "grapes", "milk", "muffin", "popcorn", "soda", "strawberries"]
    
    // create and update methods to handle data and interface changes
    
    func createItem(with itemImage: Data, itemName: String, hasBeenAdded: Bool = false) {
        
        let shoppingItem = ShoppingItem(itemImage: itemImage, itemName: itemName)
        
        shoppingItems.append(shoppingItem)
    }

    // set up a computed property that uses the `FileManager` class
    
    var persistentFileURL : URL? {
        let fileManager = FileManager()
        let docDirectory = fileManager.urls(for: .documentDirectory, in: .userDomainMask).first!
        return docDirectory.appendingPathComponent(.shoppingItemPList)
    }
    
    // encode the shoppingItem array and write that data to storage
    
    func saveToPersistentStore() {
        
        do {
            guard let url = persistentFileURL else { return }
            
            let encoder = PropertyListEncoder()
            let shoppingItem = try encoder.encode(shoppingItems)
            try shoppingItem.write(to: url)
        } catch {
            NSLog("Error encoding: \(error)")
        }
    }
    
    // decode the shoppingItem plist data back into an array
    
    func loadFromPersistentStore() {
        let fileManager = FileManager.default
        
        do {
            guard let url = persistentFileURL, fileManager.fileExists(atPath: url.path) else { return }
            
            let shoppingItem = try Data(contentsOf: url)
            let decoder = PropertyListDecoder()
            let decodedItems = try decoder.decode([ShoppingItem].self, from: shoppingItem)
            shoppingItems = decodedItems
        } catch {
            NSLog("Error decoding: \(error)")
        }
    }
    

}
