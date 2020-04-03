//
//  ShoppingListController.swift
//  Shopping List
//
//  Created by Chris Dobek on 3/30/20.
//  Copyright © 2020 Lambda School. All rights reserved.
//

import Foundation

class ShoppingListController {
    
    var shoppingItems: [ShoppingItem] = [ShoppingItem(name: itemNames[0], isAdded: false),
                                         ShoppingItem(name: itemNames[1], isAdded: false),
                                         ShoppingItem(name: itemNames[2], isAdded: false),
                                         ShoppingItem(name: itemNames[3], isAdded: false),
                                         ShoppingItem(name: itemNames[4], isAdded: false),
                                         ShoppingItem(name: itemNames[5], isAdded: false),
                                         ShoppingItem(name: itemNames[6], isAdded: false)]
    
     init() {
           let added = UserDefaults.standard.bool(forKey: .addedPreferenceKey)
           if added {
               loadFromPersistentStore() }
           else {
               UserDefaults.standard.set(true, forKey: .addedPreferenceKey)

               saveToPersistentStore()
           }
       }
    
    var addedItems : [ShoppingItem] {
           return shoppingItems.filter{$0.isAdded == true}
       }
    var notAddedItems : [ShoppingItem] {
              return shoppingItems.filter{$0.isAdded == false}

       }
    
    var persistentFileURL: URL? {
        guard let documentsDir = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first else {return nil}
        let shoppingListURL = documentsDir.appendingPathComponent("shoppingList.plist")
        return shoppingListURL
    }
    
    func saveToPersistentStore() {
        guard let save = persistentFileURL else { return }
        do {
            let encoder = PropertyListEncoder()
            let data = try encoder.encode(shoppingItems)
            try data.write(to: save)
        } catch {
            print("Encoding Error")
        }
    }

    func loadFromPersistentStore() {
        guard let save = persistentFileURL else { return }
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

extension String { static var addedPreferenceKey = "Added"}
