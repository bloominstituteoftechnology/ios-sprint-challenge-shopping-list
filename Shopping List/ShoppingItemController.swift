//
//  ShoppingItemController.swift
//  Shopping List
//
//  Created by Keri Levesque on 1/31/20.
//  Copyright © 2020 Lambda School. All rights reserved.
//

import UIKit

class ShoppingItemController {
    
    init() {
          loadFromPersistentStore()
      }
      
      var itemNames: [ShoppingItem] =
          [ShoppingItem(name: "Apple"),
           ShoppingItem(name: "Grapes"),
           ShoppingItem(name: "Milk"),
           ShoppingItem(name: "Muffin"),
           ShoppingItem(name: "Popcorn"),
           ShoppingItem(name: "Soda"),
           ShoppingItem(name: "Strawberries")]

         func updateList(for item: ShoppingItem) {
             guard let index = itemNames.firstIndex(of: item) else {return}
             itemNames[index].addedToList = !itemNames[index].addedToList
             saveToPersistentStore()
         }
      
      var addedItems: [ShoppingItem] {
            return itemNames.filter({ $0.addedToList })
        }

        private func loadFromPersistentStore() {

            do {
                guard let fileURL = shoppingListURL else { return }

                let notebooksData = try Data(contentsOf: fileURL)

                let plistDecoder = PropertyListDecoder()

                self.itemNames = try plistDecoder.decode([ShoppingItem].self, from: notebooksData)
            } catch {
                NSLog("Error decoding memories from property list: \(error)")
            }
        }

        private func saveToPersistentStore() {

            let plistEncoder = PropertyListEncoder()

            do {
                let notebooksData = try plistEncoder.encode(itemNames)

                guard let fileURL = shoppingListURL else { return }

                try notebooksData.write(to: fileURL)
            } catch {
                NSLog("Error encoding memories to property list: \(error)")
            }
        }

        private var shoppingListURL: URL? {
            let documentDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first

            let fileName = "ShoppingList.plist"

            return documentDirectory?.appendingPathComponent(fileName)
        }
   // userDefaults, persisted stuff needs to be in here
}
