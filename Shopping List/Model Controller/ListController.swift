//
//  ListController.swift
//  Shopping List
//
//  Created by Harmony Radley on 3/5/20.
//  Copyright © 2020 Lambda School. All rights reserved.
//

import Foundation


extension String {
    static let addItemKey = "addItem"
}

class ShoppingListController {
    
    var itemNames = ["Apple",
                     "Grapes",
                     "Milk",
                     "Muffin",
                     "Popcorn",
                     "Soda",
                     "Strawberries"]
    var shoppingItems: [ShoppingItem] = []
    
    
    init() {
        let addedItem = UserDefaults.standard.bool(forKey: .addItemKey)
        if addedItem {
            loadFromPersistentStore() }
        else {
            UserDefaults.standard.set(true, forKey: .addItemKey)
            saveToPersistentStore()
        }
    }
    
    func updateAddedItem(for item: ShoppingItem) {
        if let index = itemNames.firstIndex(of: item) {
            itemNames[index].hasBeenAdded.toggle()
            saveToPersistentStore()
        }
    }
    
    var addItems: [ShoppingItem] {
        let addItem = shoppingItems.filter{ $0.hasBeenAdded == true }
        return addItem
    }
    
    // MARK: - Persistence
    
    var shoppingListURL: URL? {
        let fileManager = FileManager.default
        
        let documentsDirectory = fileManager.urls(for: .documentDirectory, in: .userDomainMask).first
            
        let itemsURL = documentsDirectory?.appendingPathComponent("ShoppingList.plist")
        
        return itemsURL
    }


    func saveToPersistentStore() {
        guard let itemsURL = shoppingListURL else { return }
        do {
            let encoder = PropertyListEncoder()
            let data = try encoder.encode(shoppingListURL)
            try data.write(to: itemsURL)
        } catch {
            print("Unable to save item(s) to plist: \(error)")
        }
    }

    func loadFromPersistentStore() {
        guard let itemsURL = shoppingListURL else { return }
        do {
            let data = try Data(contentsOf: itemsURL)
            let decoder = PropertyListDecoder()
            let shoppingItemList = try decoder.decode([ShoppingItem].self, from: data)
           // self.shoppingItems = shoppingItemList
        } catch {
            print("Error decoding items: \(error)")
        }
    }

}
