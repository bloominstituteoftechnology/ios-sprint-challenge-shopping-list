//
//  ListController.swift
//  Shopping List
//
//  Created by Harmony Radley on 3/5/20.
//  Copyright © 2020 Lambda School. All rights reserved.
//

import Foundation



class ShoppingListController {
   
    var shoppingItems: [ShoppingItem] = []
    
    var itemNames: [ShoppingItem] = [ShoppingItem(name: "Apple", hasBeenAdded: false),
                                    ShoppingItem(name: "Grapes", hasBeenAdded: false),
                                    ShoppingItem(name: "Milk", hasBeenAdded: false),
                                    ShoppingItem(name: "Muffin", hasBeenAdded: false),
                                    ShoppingItem(name: "Popcorn", hasBeenAdded: false),
                                    ShoppingItem(name: "Soda", hasBeenAdded: false),
                                    ShoppingItem(name: "Strawberries", hasBeenAdded: false)]
    
    
    init() {
        loadFromPersistentStore()
    }
    
    func updateAddedItem(for item: ShoppingItem) {
        guard let item = itemNames.firstIndex(of: item) else {return}
        itemNames[item].hasBeenAdded = !itemNames[item].hasBeenAdded
        saveToPersistentStore()
        }
    
    
    var filterItems: [ShoppingItem] {
         shoppingItems.filter { $0.hasBeenAdded == true }
    }
    
    // Create Items function
    
    func createItem(name: String, hasBeenAdded: Bool) {
        let shoppingItem = ShoppingItem(name: name, hasBeenAdded: hasBeenAdded)
        itemNames.append(shoppingItem)
        saveToPersistentStore()
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

      private func loadFromPersistentStore() {
           
           do { guard let itemsURL = shoppingListURL else { return }
               let data = try Data(contentsOf: itemsURL)
               let decoder = PropertyListDecoder()
               self.shoppingItems = try decoder.decode([ShoppingItem].self, from: data)
              // self.shoppingItems = shoppingItemList
           } catch {
               print("Error decoding items: \(error)")
           }
    }

}
