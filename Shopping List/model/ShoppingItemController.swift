//
//  ShoppingItemController.swift
//  Shopping List
//
//  Created by ronald huston jr on 4/24/20.
//  Copyright © 2020 Lambda School. All rights reserved.
//

import Foundation

class ShoppingItemController {
    
    let itemNames = ["Apple", "Grapes", "Milk", "Muffin", "Popcorn", "Soda", "Strawberries"]
    
    var items: [ShoppingItem] = []
    
    var listSave: Bool = false
    
    let listSaveKey = "key"
    
    var addedItems: [ShoppingItem] {
        return items.filter { $0.isAdded == true }
    }
    
    var fileLocation: URL? {
        
        let fileManager = FileManager.default
        
        //  unwrap document directory
        guard let documentDir = fileManager.urls(for: .documentDirectory, in: .userDomainMask).first else { return nil }
        
        //  append file location to doc dir; create file at path
        let fileURL = documentDir.appendingPathComponent("shoppingItems.plist")
        
        return fileURL
    }
    
    func createItem(name: String) {
        let newItem = ShoppingItem(name: name, isAdded: false)
        items.append(newItem)
        saveToPersistentStore()
    }
    
    //  access the property list stored on the device, and convert the information in it back into an array of objects
    func loadFromPersistentStore() {
        guard let fileURL = fileLocation else { return }
        
        do {
            let shoppingData = try Data(contentsOf: fileURL)
            
            let decoder = PropertyListDecoder()
            
            let shoppingArray = try decoder.decode([ShoppingItem].self, from: shoppingData)
            
            self.items = shoppingArray
            
        } catch {
            print("error loading itmes from plist")
        }
    }
    
    func saveToPersistentStore() {
        
        //  make sure the file url exists
        guard let fileURL = fileLocation else { return }
        
        do {
            //  create the encoder
            let encoder = PropertyListEncoder()
            
            //  convert into a plist
            let shoppingData = try encoder.encode(items)
            
            //  save the file to the documents directory
            try shoppingData.write(to: fileURL)
            
        } catch {
            //  handle the error that gets "thrown" here
            //  this catch statement will only run if a throwing method fails
            print("error saving shopping list: \(error)")
        }
    }
    
    func setList() {
        listSave = true
        UserDefaults.standard.set(listSave, forKey: listSaveKey)
    }
    
    func loadList() {
        listSave = UserDefaults.standard.bool(forKey: listSaveKey)
    }
    
}
