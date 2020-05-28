//
//  ShoppingController.swift
//  Shopping List
//
//  Created by Lambda_School_Loaner_151 on 8/20/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import Foundation


// var item names gives you a variable to call an array of items
// var myShoppingItems gives you a variable to call the item named Shopping from an array as an array
// func createShoppingList is a function that for each item in the variable myShoppingItemss
class ShoppingController {
    var itemNames = ["Apple", "Grapes", "Milk", "Muffin", "Popcorn", "Soda", "Strawberries"]
    var myShoppingItems: [Shopping] = []
    func createShoppingList() {
        for name in itemNames {
            let shopping = Shopping(name: name)
            myShoppingItems.append(shopping)
            }
        saveToPersistentStore()
    }
    
    func updateBeenAdded(for shopping: Shopping) {
        
        guard let index = myShoppingItems.index(of: shopping) else { return }
        var shopping = myShoppingItems[index]
        if shopping.beenAdded == false {
            shopping.beenAdded = true
        } else {
            shopping.beenAdded = false
        }

        myShoppingItems[index] = shopping
        
        saveToPersistentStore()
    }
    
    private var persistentFileURL: URL? {
        let fileManager = FileManager.default
        guard let documents = fileManager.urls(for: .documentDirectory, in: .userDomainMask).first else { return nil }
        
        return documents.appendingPathComponent("info.plist")
    }
    
    init() {
        saveToPersistentStore()
    }
    
    private func saveToPersistentStore() {
        guard let url = persistentFileURL else { return }
        
        do {
            let encoder = PropertyListEncoder()
            let data = try encoder.encode(persistentFileURL)
            try data.write(to: url)
        } catch {
            print("\(String(describing: persistentFileURL))")
        }
    }
    private func loadFromPersistentStore() {
        
        let fileManager = FileManager.default
        guard let url = persistentFileURL, fileManager.fileExists(atPath: url.path) else { return }
        do {
            let data = try Data(contentsOf: url)
            let decoder = PropertyListDecoder()
            items = try decoder.decode([Shopping].self, from: data)
        } catch {
            print("\(String(describing: persistentFileURL))")
        }
    }
}

// add user defaults
