//
//  ShoppingItemController.swift
//  Shopping List
//
//  Created by Vijay Das on 1/25/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import UIKit

class ShoppingItemController {
    
    private(set) var shoppingList: [ShoppingItem] = []
    
    // properties
    // need to implement:

    // updateIsAdded method
    // filter methods for added and notadded items
    // persistence
    //
    
    // properties
    
   
    // create initial items and initialize
    // use provided snippet: let itemNames = ["apple", "grapes", "milk", "muffin", "popcorn", "soda", "strawberries"]
    
    init() {
        createItems()
    }
    
    func createItems() {
        let itemNames = ["apple", "grapes", "milk", "muffin", "popcorn", "soda", "strawberries"]
        for name in itemNames {
            let item = ShoppingItem(image: name, name: name)
            shoppingList.append(item)
        }
        
    }
    
    // updateIsAdded method
    
    func updateIsAdded(item: ShoppingItem) {
        guard let index = shoppingList.index(of: item) else { return }
        shoppingList[index].isAdded = !shoppingList[index].isAdded
        
    }
    
    
    // add computed properties:
    
    var addedItems: [ShoppingItem] {
        let addedItems = shoppingList.filter({ $0.isAdded == true })
        return addedItems
    }
    
    var notAddedItems: [ShoppingItem] {
        let notAddedItems = shoppingList.filter({ $0.isAdded == false })
        return notAddedItems
    }
    
    // Persistence
    
    private var shoppingListURL: URL? {
        let fileManager = FileManager.default
        
        guard let directory = fileManager.urls(for: .documentDirectory, in: .userDomainMask).first else { return nil }
        
        let path = directory.appendingPathComponent("shoppinglist.plist")
        
        return path
        
    }
    

    func saveToPersistence() {
        
        guard let url = shoppingListURL else { return }
        
        let encoder = PropertyListEncoder()
        
        do {
            let listData = try encoder.encode(shoppingList)
            try listData.write(to: url)
            
        } catch {
            print(error)
        }
        
        
    }
    
     func loadFromPersistence() {
        
        guard let url = shoppingListURL else { return }
        
        let decoder = PropertyListDecoder()
        
        do {
            let decodedList = try Data(contentsOf: url)
            shoppingList = try decoder.decode([ShoppingItem].self, from: decodedList)
        } catch {
            print(error)
        }
    }
    
}
