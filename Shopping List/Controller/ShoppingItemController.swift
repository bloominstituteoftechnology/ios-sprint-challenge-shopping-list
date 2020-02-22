//
//  ShoppingItemController.swift
//  Shopping List
//
//  Created by Elizabeth Thomas on 2/21/20.
//  Copyright © 2020 Lambda School. All rights reserved.
//

import Foundation
import UIKit

class ShoppingItemController {
    var items: [ShoppingItem] = [
        ShoppingItem(name: "Apple", hasBeenAdded: false),
        ShoppingItem(name: "Grapes", hasBeenAdded: false),
        ShoppingItem(name: "Milk", hasBeenAdded: false),
        ShoppingItem(name: "Muffin", hasBeenAdded: false),
        ShoppingItem(name: "Popcorn", hasBeenAdded: false),
        ShoppingItem(name: "Soda", hasBeenAdded: false),
        ShoppingItem(name: "Strawberries", hasBeenAdded: false)
]
    
    var itemsAddedCount: Int {
        let itemsAdded = items.filter { return $0.hasBeenAdded }
        return itemsAdded.count
    }
       
     private var persistentFileURL: URL? {
         let fileManager = FileManager.default
         guard let documents = fileManager.urls(for: .documentDirectory, in: .userDomainMask).first else { return nil }
         
         return documents.appendingPathComponent("shoppingItems.plist")
     }
     
     init() {
         loadFromPersistentStore()
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
        guard let url = persistentFileURL,
            fileManager.fileExists(atPath: url.path) else { return }
        
        do {
            let data = try Data(contentsOf: url)
            let decoder = PropertyListDecoder()
            items = try decoder.decode([ShoppingItem].self, from: data)
        } catch {
            print("Error loading items data: \(error)")
        }
    }
    
    func toggleHasBeenAdded(for item: ShoppingItem) {
        if let shoppingItemIndex = items.firstIndex(of: item) {
            var shoppingItem = items[shoppingItemIndex]
            shoppingItem.hasBeenAdded.toggle()
            items[shoppingItemIndex] = shoppingItem
            saveToPersistentStore()
        }
    }
    
    
}
