//
//  ShoppingItemController.swift
//  Shopping List
//
//  Created by Welinkton on 9/14/18.
//  Copyright © 2018 Lambda School. All rights reserved.
//

import Foundation

class ShoppingItemController {
    
    init() {
        let isInitiated = UserDefaults.standard.bool(forKey: .isInitiatedKey)
        
        if isInitiated {
            loadFromPersistentStore()
        } else {
           // createList()
        }
    }
    
    
    // Crud
    
    // Read
    
    var shoppingItems: [ShoppingItem] = []
    
    private let itemNames = ["apple", "grapes", "milk", "muffin", "popcorn", "soda", "strawberries"]
    
     // Create
    
//    func createList(){
//        for item in itemNames {
//            let shoppingItem = ShoppingItem(name: name, imageName: name)
//            shoppingItems.append(shoppingItem)
//        }
//        UserDefaults.standard.set(true, forKey: .isInitiatedKey)
//        saveToPersistentStore()
//    }
    
     // Update
    
    func update(shoppingItem: ShoppingItem) {
        guard let index = shoppingItems.index(of: shoppingItem) else {return}
        
        var scratchItem = shoppingItem
        scratchItem.isAdded = !shoppingItem.isAdded
        
        shoppingItems.remove(at: index)
        shoppingItems.insert(scratchItem, at: index)
        
        saveToPersistentStore()
        
    }
   
    // MARK - Persistence Functions
    
    private var shoppingItemsFileURL: URL? {
        let fm = FileManager.default
        guard let directory = fm.urls(for: .documentDirectory , in: .userDomainMask).first else {return nil}
        return directory.appendingPathComponent("shoppingItems.plist")
    }
    
    func saveToPersistentStore() {
        guard let url = shoppingItemsFileURL else {return}
        
        do {
            
            let encoder = PropertyListEncoder()
            
           
            let data = try encoder.encode(shoppingItems)
            
            
            try data.write(to: url)
            
        } catch  {
            
           
            NSLog("Error saving ShoppingList data: \(error)")
            
        }
    }
    
    func loadFromPersistentStore() {
        
       
        let fm = FileManager.default
        
        
        guard let url = shoppingItemsFileURL, fm.fileExists(atPath: url.path) else {return}
        
        do {
          
            let decoder = PropertyListDecoder ()
            
            
            let data = try Data(contentsOf: url)
            
          
            shoppingItems = try decoder.decode([ShoppingItem].self, from: data)
            
        } catch  {
            
            // this stores in the users' log for errors
            NSLog("Error loading ShoppingList data: \(error)")
            
        }
    }
    
    
    
    
}
