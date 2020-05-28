//
//  ShoppingItemController.swift
//  Shopping List
//
//  Created by Bryan Cress on 5/22/20.
//  Copyright © 2020 Lambda School. All rights reserved.
//

import Foundation

extension String { static var addedPreferenceKey = "added" }

class ShoppingItemController {
    
 //Read
    
//    var shoppingItems = [ShoppingItem(name: "Apples", addedToCart: false, imageName: "Apple"),
//                         ShoppingItem(name: "Grapes", addedToCart: false, imageName: "Grapes"),
//                         ShoppingItem(name: "Milk", addedToCart: false, imageName: "Milk"),
//                         ShoppingItem(name: "Muffin", addedToCart: false, imageName: "Muffin"),
//                         ShoppingItem(name: "Popcorn", addedToCart: false, imageName: "Popcorn"),
//                         ShoppingItem(name: "Soda", addedToCart: false, imageName: "Soda"),
//                         ShoppingItem(name: "Strawberries", addedToCart: false, imageName: "Strawberries")]
    
    
 let itemNames = ["Apple", "Grapes", "Milk", "Muffin", "Popcorn", "Soda", "Strawberries"]
    var shoppingItems: [ShoppingItem] = []
    func createShoppingListItem() {
          for item in itemNames {
              shoppingItems.append(ShoppingItem(name: item, addedToCart: true))
          }
          saveToPersistentStore()
      }
    
    
     init() {
            let added = UserDefaults.standard.bool(forKey: .addPreferenceKey)
            if added != false {
                createShoppingListItem()
                saveToPersistentStore()
                 }
            else {
                loadFromPersistentStore()
                UserDefaults.standard.set(true, forKey: .addPreferenceKey)
                saveToPersistentStore()
            }
        }
    

        var addedItems : [ShoppingItem] {
               return shoppingItems.filter{$0.addedToCart == true}
           }
        var notAddedItems : [ShoppingItem] {
                  return shoppingItems.filter{$0.addedToCart == false}

           }

    // MARK: - Persistence
    
        var shoppingListURL: URL? {
               let fileManager = FileManager.default
               guard let documentsDirectory = fileManager.urls(for: .documentDirectory, in: .userDomainMask).first
                   else { return nil }
               return documentsDirectory.appendingPathComponent("ShoppingList.plist")
           }

        func saveToPersistentStore() {
            guard let save = shoppingListURL else { return }
            do {
                let encoder = PropertyListEncoder()
                let data = try encoder.encode(shoppingItems)
                try data.write(to: save)
            } catch {
                print("Encoding Error")
            }
        }

        func loadFromPersistentStore() {
            guard let save = shoppingListURL else { return }
            do {
                let data = try Data(contentsOf: save)
                let decoder = PropertyListDecoder()
                let shoppingItemList = try decoder.decode([ShoppingItem].self, from: data)
                self.shoppingItems = shoppingItemList
            } catch {
                print("Decoding Error")
            }
        }
    }


//Create



//Update




//Delete

  


// MARK: - Persistence

//var persistentFileURL: URL? {
//
//    let fileManager = FileManager.default
//}


