//
//  ShoppingItemController.swift
//  Shopping List
//
//  Created by Welinkton on 9/14/18.
//  Copyright © 2018 Lambda School. All rights reserved.
//

import Foundation

class ShoppingItemController {
    
    // Crud
    
    // Read
    var shoppingItems: [ShoppingItem] = []
    
    private let itemNames = ["apple", "grapes", "milk", "muffin", "popcorn", "soda", "strawberries"]
    
//    // Create
//    func createList(){
//        for item in itemNames {
//            let shoppingItem = ShoppingItem(name: name, imageName: name)
//            shoppingItems.append(shoppingItem)
//        }
//        //UserDefaults.standard.set(true, forKey: .isInitiatedKey)
//        // saveToPersistentStore()
//    }
    
    // Update
    
    func update(shoppingItem: ShoppingItem) {
        guard let index = shoppingItems.index(of: shoppingItem) else {return}
        
        var scratchItem = shoppingItem
        scratchItem.isAdded = !shoppingItem.isAdded
        
        shoppingItems.remove(at: index)
        shoppingItems.insert(scratchItem, at: index)
        
        // saveToPersistentStore()
        
    }
   
    // MARK - Perssitence Functions
    
    private var shoppingItemsFileURL: URL? {
        let fm = FileManager.default
        guard let directory = fm.urls(for: .documentDirectory , in: .userDomainMask).first else {return nil}
        return directory.appendingPathComponent("shoppingItems.plist")
    }
    
    
    
    
    
    
    
    
}
