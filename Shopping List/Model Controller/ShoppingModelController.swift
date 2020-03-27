//
//  ShoppingModelController.swift
//  Shopping List
//
//  Created by Marissa Gonzales on 3/27/20.
//  Copyright © 2020 Lambda School. All rights reserved.
//

import Foundation
import UIKit

class ShoppingController: Codable {
    
    
    
    
    var itemNames: [ShoppingItem]  {
        
        var result = [
            ShoppingItem(name: "Apple", hasBeenAdded: false),
            ShoppingItem(name: "Grapes", hasBeenAdded: false),
            ShoppingItem(name: "Milk", hasBeenAdded: false),
            ShoppingItem(name: "Muffin", hasBeenAdded: false),
            ShoppingItem(name: "Popcorn", hasBeenAdded: false),
            ShoppingItem(name: "Soda", hasBeenAdded: false),
            ShoppingItem(name: "Strawberries", hasBeenAdded: false)
            ]
        
        
        
        
            return result
    
    }

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
    
    func loadFromPersistenceStore() {
        
        guard let shoppingURL = shoppingListURL else { return }
        
        do {
            let decoder = PropertyListDecoder()
            
            let shoppingPlist = try Data(contentsOf: shoppingURL)
            
            let shoppingItems = try decoder.decode([ShoppingItem].self, from: shoppingPlist)
            
            

        } catch let decodeError {
            print("Error Decoding: \(decodeError)")
            
        }
        
        
        
        
        
        
        
    }
    
    
    
    
}
