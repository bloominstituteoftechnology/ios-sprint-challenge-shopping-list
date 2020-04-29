//
//  ShoppingItemController.swift
//  Shopping List
//
//  Created by ronald huston jr on 4/24/20.
//  Copyright © 2020 Lambda School. All rights reserved.
//

import UIKit

class ShoppingItemController {
    
    let itemNames = ["Apple", "Grapes", "Milk", "Muffin", "Popcorn", "Soda", "Strawberries"]
    
    var items: [ShoppingItem] =
            [
            ShoppingItem(name: "Apple", isAdded: false),
            ShoppingItem(name: "Grapes", isAdded: true),
            ShoppingItem(name: "Milk", isAdded: true),
            ShoppingItem(name: "Muffin", isAdded: false),
            ShoppingItem(name: "Popcorn", isAdded: true),
            ShoppingItem(name: "Soda", isAdded: true),
            ShoppingItem(name: "Strawberries", isAdded: true),
            ]
    
    
    init() {
        let added = UserDefaults.standard.bool(forKey: .addPreferenceKey)
        if added {
            loadFromPersistentStore()
        } else {
            UserDefaults.standard.set(true, forKey: .addPreferenceKey)
            saveToPersistentStore()
        }
    }
    
    var addedItems: [ShoppingItem] {
        return items.filter{ $0.isAdded == true }
    }
    
    var notAdded: [ShoppingItem] {
        return items.filter{ $0.isAdded == false }
    }
    
    var fileLocation: URL? {
        
        let fileManager = FileManager.default
        
        //  unwrap document directory
        guard let documentDir = fileManager.urls(for: .documentDirectory, in: .userDomainMask).first else { return nil }
        
        //  append file location to doc dir; create file at path
        let itemsURL = documentDir.appendingPathComponent("shoppingItems.plist")
        
        return itemsURL
    }
    
    func saveToPersistentStore() {
        //  make sure the file url exists
        guard let fileURL = fileLocation else { return }
        do {
            //  create the encoder
            let encoder = PropertyListEncoder()
            
            //  convert into a plist
            let data = try encoder.encode(items)
            
            //  save the file to the documents directory
            try data.write(to: fileURL)
            
        } catch {
            //  handle the error that gets "thrown" here
            //  this catch statement will only run if a throwing method fails
            print("error saving shopping list: \(error)")
        }
    }

    
    //  access the property list stored on the device,
    //  and convert the information in it back into an array of objects
    func loadFromPersistentStore() {
        
        guard let fileURL = fileLocation else { return }
        
        do {
            let data = try Data(contentsOf: fileURL)
            
            let decoder = PropertyListDecoder()
            
            let shoppingItemList = try decoder.decode([ShoppingItem].self, from: data)
            
            self.items = shoppingItemList
            
        } catch {
            print("error loading shopping list")
        }
    }
        
}

extension String { static var addPreferenceKey = "added" }
