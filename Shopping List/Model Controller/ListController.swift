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
   
    var shoppingItems: [ShoppingItem] = []
    
    var itemNames = ["Apple",
                        "Grapes",
                        "Milk",
                        "Muffin",
                        "Popcorn",
                        "Soda",
                        "Strawberries"]
    
    
    init() {
        loadFromPersistentStore
    }
    
    func updateAddedItem(for item: ShoppingItem) {
        guard let item = itemNames.firstIndex(of: item) else { return }
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
           guard let documentsDirectory = fileManager.urls(for: .documentDirectory, in: .userDomainMask).first
               else { return nil }
           return documentsDirectory.appendingPathComponent("ShoppingList.plist")
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
