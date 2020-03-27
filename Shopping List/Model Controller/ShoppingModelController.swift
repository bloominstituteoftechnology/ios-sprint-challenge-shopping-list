//
//  ShoppingModelController.swift
//  Shopping List
//
//  Created by Marissa Gonzales on 3/27/20.
//  Copyright © 2020 Lambda School. All rights reserved.
//

import Foundation

class ShoppingController {
    
    let itemNames = ["Apple", "Grapes", "Milk", "Muffin", "Popcorn", "Soda", "Strawberries"]
    
    
    
    
    var shoppingListURL: URL? {
        
        let fileManager = FileManager.default
        
        
        let documentsDirectory = fileManager.urls(for: .documentDirectory, in: .userDomainMask).first
        
        let shoppingURL = documentsDirectory?.appendingPathComponent("shoppingItems.plist")
        
        return shoppingURL
    }
    
    func saveToPersistenceStore() {
        do {
            
            let encoder = PropertyListEncoder()
            
            let shoppingItemsPlist = try encoder.encode(itemNames)
            
            guard let myPersFile = shoppingListURL else { return }
            
            try shoppingItemsPlist.write(to: myPersFile)
            
            } catch let saveError {
            print("Error Saving Shopping List: \(saveError)")
        }
    }
    
    
    
    
    
    
}
