//
//  ShoppingItemController.swift
//  Shopping List
//
//  Created by Alex Perse on 5/3/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import Foundation

class ShoppingItemController {
    
    init () {
        storeShoppingItems()
        loadShoppingItems()
    }
    
    
    let itemNames = ["apple", "grapes", "milk", "muffin", "popcorn", "soda", "strawberries"]
    var shoppingItems: [ShoppingItem] = []
    

    func storeShoppingItems() {
        
        guard UserDefaults.standard.bool(forKey: "DataHasBeenCreated") == false else { return }
        
        let encoder = PropertyListEncoder()
        
        do {
            let data = try encoder.encode(itemNames)
            
            let url = try FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: true).appendingPathComponent("data").appendingPathExtension("plist")
            
            try data.write(to: url)
            
            UserDefaults.standard.set(true, forKey: "DataHasBeenCreated")
        } catch {
            NSLog("Error: \(error)")
        }
    }
    
    func loadShoppingItems() {
        
        do {
            let url = try FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: true).appendingPathComponent("data").appendingPathExtension("plist")
            
            let data = try Data(contentsOf: url)
            
            let decoder = PropertyListDecoder()
            
            self.shoppingItems = try decoder.decode([itemNames], from: data)
        } catch {
            NSLog("Error: \(error)")
        }
        
    }
}



/*
 
 
 The old sprint challenge data storage method ...
 
    
    func create(imageName: String, name: String, addedToShoppingList: Bool) {
        let shoppingItem = ShoppingItem(imageName: imageName, name: name, addedToShoppingList: addedToShoppingList)
        shoppingItems.append(shoppingItem)
    }
    
    
    
    func saveToPersistentStore() {
        guard let url = persistentURL else { return }
        
        do {
            let encoder = PropertyListEncoder()
            let data = try encoder.encode(shoppingItems)
            try data.write(to: url)
        } catch {
            print("Error saving shopping list: \(error)")
        }
        }
    
    func loadFromPersistentStore() {
        //Check to see if file exists
        let fileManager = FileManager.default
        guard let url = persistentURL, fileManager.fileExists(atPath: url.path) else {
            print("cannot find a file")
            return
        }
    }
    
    }
    
    private var persistentURL: URL? {
        let fileManager = FileManager.default
        guard let documents = fileManager.urls(for: .documentDirectory, in: .userDomainMask).first
            else { return nil }
        print("Documents: \(documents.path)")
        return documents.appendingPathComponent("ShoppingList.plist")
    }
    
    //Encapsulation, protecting data
    private(set) var shoppingItems: [ShoppingItem] = [] //does this need to be private?

*/


