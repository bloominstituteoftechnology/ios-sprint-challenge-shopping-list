//
//  ShoppingItemController.swift
//  Shopping List
//
//  Created by Bhawnish Kumar on 2/28/20.
//  Copyright © 2020 Lambda School. All rights reserved.
//

import Foundation

class ShoppingController {
    static let onlyOnceKey = "onlyOnceKey"
    var shoppingItems: [ShoppingItem] {
    
               var shoppingItems = [
                  ShoppingItem(name: "Apple", didItemAdded: true),
                  ShoppingItem(name: "Grapes", didItemAdded: true),
                  ShoppingItem(name: "Milk", didItemAdded: true),
                  ShoppingItem(name: "Muffin", didItemAdded: true),
                  ShoppingItem(name: "Popcorn", didItemAdded: true),
                  ShoppingItem(name: "Soda", didItemAdded: true),
                  ShoppingItem(name: "Strawberries", didItemAdded: true),
                  ]
          
           return shoppingItems
        
       
       }
        
    private var shoppingListFileURL: URL? {
              let fileManager = FileManager.default
              guard let documents = fileManager.urls(for: .documentDirectory, in: .userDomainMask).first else { return nil }
              return documents.appendingPathComponent("ShoppingList.plist")
         }
    init() {
        if UserDefaults.standard.bool(forKey: ShoppingController.onlyOnceKey) {
            return
        }
    }
    private func loadFromPersistentStore() {
           
           do {
               guard let shoppingListFileURL = shoppingListFileURL else { return }
               
               let listData = try Data(contentsOf: shoppingListFileURL)
               
               let plistDecoder = PropertyListDecoder()
               
              shoppingItems = try plistDecoder.decode([ShoppingItem].self, from: listData)
           } catch {
               NSLog("Error decoding memories from property list: \(error)")
           }
       }
    
    
    
    
    func saveToPersistentStore() {
            guard let shoppingListFileURL = shoppingListFileURL else { return }
            do {
                let encoder = PropertyListEncoder()
                try encoder.encode(shoppingItems)
            } catch {
                print("Error saving items: \(error)")
            }
        }
    }

    
      
        
    
