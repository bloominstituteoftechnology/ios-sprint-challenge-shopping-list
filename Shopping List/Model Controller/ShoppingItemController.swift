//
//  ShoppingItemController.swift
//  Shopping List
//
//  Created by Alex Perse on 5/3/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import Foundation

class ShoppingItemController {
    
    let itemNames = ["apple", "grapes", "milk", "muffin", "popcorn", "soda", "strawberries"]
    
    func create(imageData: Data, title: String, addedToShoppingList: Bool) {
        let shoppingItem = ShoppingItem(imageData: imageData, title: title, addedToShoppingList: addedToShoppingList)
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
            else {
                return nil
        }
        print("Documents: \(documents.path)")
        return documents.appendingPathComponent("ReadingList.plist")
    }
    
    //Encapsulation, protecting data
    private(set) var shoppingItems: [ShoppingItem] = []

