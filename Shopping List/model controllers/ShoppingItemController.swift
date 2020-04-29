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
    
    var items: [ShoppingItem] {
        get {
            [
            ShoppingItem(name: "Apple", isAdded: false),
            ShoppingItem(name: "Grapes", isAdded: true),
            ShoppingItem(name: "Milk", isAdded: true),
            ShoppingItem(name: "Muffin", isAdded: false),
            ShoppingItem(name: "Popcorn", isAdded: true),
            ShoppingItem(name: "Soda", isAdded: true),
            ShoppingItem(name: "Strawberries", isAdded: true),
            ]
            }
        set { }
    }
    
    var fileLocation: URL? {
        
        let fileManager = FileManager.default
        //  unwrap document directory
        guard let documentDir = fileManager.urls(for: .documentDirectory, in: .userDomainMask).first else { return nil }
        //  append file location to doc dir; create file at path
        let itemsURL = documentDir.appendingPathComponent("shoppingItems.plist")
        
        return itemsURL
    }
    
    func updateIsAdded(item: ShoppingItem) {
        guard let itemIndex = items.firstIndex(of: item) else { return }
        items[itemIndex].isAdded = !items[itemIndex].isAdded
        saveToPersistentStore()
    }
    
    func createItem(name: String) {
        let newItem = ShoppingItem(name: name, isAdded: false)
        items.append(newItem)
        saveToPersistentStore()
    }
    
    //  access the property list stored on the device,
    //  and convert the information in it back into an array of objects
    func loadFromPersistentStore() {
        
        guard let fileURL = fileLocation else { return }
        
        do {
            let decoder = PropertyListDecoder()
            let shoppingPList = try Data(contentsOf: fileURL)
            let shoppingArray = try decoder.decode([ShoppingItem].self, from: shoppingPList)
            
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
            let shoppingPlist = try encoder.encode(items)
            
            //  save the file to the documents directory
            try shoppingPlist.write(to: fileURL)
            
        } catch {
            //  handle the error that gets "thrown" here
            //  this catch statement will only run if a throwing method fails
            print("error saving shopping list: \(error)")
        }
    }
    
}
