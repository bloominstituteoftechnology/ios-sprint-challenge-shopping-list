//
//  ShoppingListController.swift
//  Shopping List
//
//  Created by Nichole Davidson on 2/28/20.
//  Copyright © 2020 Lambda School. All rights reserved.
//

import Foundation

extension String {
    static var itemAdded = "itemAdded"
}

class ShoppingListController {
    
    var items:[ShoppingItem] = []
    
    func createShoppingList() {
        UserDefaults.standard.bool(forKey: String.itemAdded)
        
        let itemNames = ["Apple", "Grapes", "Milk", "Muffin", "Popcorn", "Soda", "Strawberries"]
        
        for itemName in itemNames {
            let shoppingItem = ShoppingItem(name: itemName)
            items.append(shoppingItem)
        }
        saveToPersistentStore()
        
        UserDefaults.standard.set(true, forKey: String.itemAdded)
    }
    
    // MARK: - Persistence
    
    // The location of the Stars file that we will be saving to and loading from
    var persistentFileURL: URL? {
        
        let fileManager = FileManager.default
        
        // ~/MyApp/Documents/
        let documentsDir = fileManager.urls(for: .documentDirectory, in: .userDomainMask).first
        
        // ~/MyApp/Documents/stars.plist
        let itemsURL = documentsDir?.appendingPathComponent("items.plist")
        
        return itemsURL
    }
    
    // Saves the stars to the persistent file URL
    func saveToPersistentStore() {
        // Convert Stars into a Property List
        
        let encoder = PropertyListEncoder()
        
        do {
        
            let itemsPlist = try encoder.encode(items)
            
            guard let itemsURL = persistentFileURL else { return }
            
           try itemsPlist.write(to: itemsURL)
            
        } catch {
            // The catch statement gets called if the function(s) that you call "try" on fails.
            print("Unable to save items to plist: \(error)")
            
        }
        
    }
    
    func loadFromPersistentStore() {
        
        guard let itemsURL = persistentFileURL else { return }
        
        let decoder = PropertyListDecoder()
        
        do {
            // Goes to the starsURL and grab the file (data) from that location
            let itemsData = try Data(contentsOf: itemsURL)
            
            let itemsArray = try decoder.decode([ShoppingItem].self, from: itemsData)
            
            self.items = itemsArray
            
        } catch {
            print("Error decoding items: \(error)")
            
        }
    }
}
