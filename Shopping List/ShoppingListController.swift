//
//  ShoppingListController.swift
//  Shopping List
//
//  Created by Nichole Davidson on 1/31/20.
//  Copyright © 2020 Lambda School. All rights reserved.
//

import UIKit

extension String {
    static var itemAdded = "itemAdded"
}
class ShoppingListController {
   
    init() {
        createList()
        loadFromPersistentStore()
    }
    
    var items: [ShoppingItem] = []
    
    
    func createList() {
        guard UserDefaults.standard.bool(forKey: String.itemAdded) != true else { return }
                
        let itemNames = ["Apple", "Grapes", "Milk", "Muffin", "Popcorn", "Soda", "Strawberries"]
        
        for itemName in itemNames {
            let shoppingItem = ShoppingItem(nameOfItem: itemName)
            items.append(shoppingItem)
        }
        
        saveToPersistentStore()
        
        UserDefaults.standard.set(true, forKey: String.itemAdded)
    }
    
    func updateIsAdded(shoppingItem: ShoppingItem) {
        shoppingItem.addedToList = !shoppingItem.addedToList
        saveToPersistentStore()
    }
    
    
    var persistentFileURL: URL? {
        
        let fileManager = FileManager.default
        guard let documentsDir = fileManager.urls(for: .documentDirectory, in: .userDomainMask).first else { return nil }
        let itemsURL = documentsDir.appendingPathComponent("ShoppingItems.plist")
        return itemsURL
    }
    
    func saveToPersistentStore() {
       guard let fileURL = persistentFileURL else { return }
       let encoder = PropertyListEncoder()
       do {
           let itemsData = try encoder.encode(items)
           try itemsData.write(to: fileURL)
       } catch {
           print("Error encoding items array: \(error)")
       }
    }
    
    func loadFromPersistentStore() {
        guard let fileURL = persistentFileURL else { return }
        do {
            let itemsData = try Data(contentsOf: fileURL)
            let decoder = PropertyListDecoder()
            let itemsArray = try decoder.decode([ShoppingItem].self, from: itemsData)
            self.items = itemsArray
        } catch {
            print("Error decoding items: \(error)")
        }
    }
}
   

