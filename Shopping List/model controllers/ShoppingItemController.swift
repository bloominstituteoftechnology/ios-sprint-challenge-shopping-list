//
//  ShoppingItemController.swift
//  Shopping List
//
//  Created by Thomas Sabino-Benowitz on 10/18/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import Foundation

class ShoppingItemController {
    
    // peg userdefaults to loadfrompersistentStore
        
    var shoppingItems: [ShoppingItem] = []
    var cart: [ShoppingItem] {
        return shoppingItems.filter { $0.hasBeenAdded }
    }
    
    init() {
         createItem()
         }
 /*   init() {
           let listInitialized = UserDefaults.standard.bool(forKey: "ItemsHaveBeenCreated")
        if !listInitialized {
            createItem()
        }
*/
    func updateHasBeenAdded(for item: ShoppingItem) {
    if let index = shoppingItems.firstIndex(of: item) {
        shoppingItems[index].hasBeenAdded.toggle()
        saveToPersistentStore()
            }
        }

    func createItem() {
        let userDefaults = UserDefaults.standard
        if userDefaults.bool(forKey: "ItemsHaveBeenCreated") {
            loadFromPersistentStore()
        } else {

      let itemNames = ["Apple", "Grapes", "Milk", "Muffin", "Popcorn", "Soda", "Strawberries"]

      for name in itemNames {
          let shoppingItem = ShoppingItem(itemName: name)
          shoppingItems.append(shoppingItem)
      }
            saveToPersistentStore()
            userDefaults.set(true, forKey: "ItemsHaveBeenCreated")
    }
    
    
    }
// if person has used app, load persistent store, if person has used app = false, load original model.
    


// MARK: -PERSISTENCE


    private var persistentFileURL: URL? {
        let fm = FileManager.default
        guard let dir = fm.urls(for: .documentDirectory, in: .userDomainMask).first else { return nil }
        return dir.appendingPathComponent("shoppingItems.plist")
    }
    
    
    
    private func loadFromPersistentStore() {
        let fm = FileManager.default
        
        guard let url = persistentFileURL,
            fm.fileExists(atPath: url.path) else { return }
        
        do {
            let data = try Data(contentsOf: url)
            let decoder = PropertyListDecoder()
            shoppingItems = try decoder.decode([ShoppingItem].self, from: data)
            
        } catch {
            print("error loading shopping item data: \(error)")
        }
    }
    
    private func saveToPersistentStore() {
        guard let url = persistentFileURL else { return }
        
        do {
            let encoder = PropertyListEncoder()
            let data = try encoder.encode(shoppingItems)
            try data.write(to: url)
        } catch {
            print("error loading shopping item data: \(error)")
        }
    }
    
}
        
        

    


