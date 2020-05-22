//
//  ShoppingItemController.swift
//  Shopping List
//
//  Created by Richard Gibbs on 5/22/20.
//  Copyright © 2020 Lambda School. All rights reserved.
//

import Foundation

class ShoppingItemController: Codable {
    var shoppingItems: [ShoppingItem] {
        
        let list = [
            ShoppingItem(name: "Apple", imageName: "apple"),
            ShoppingItem(name: "Grapes", imageName: "grapes"),
            ShoppingItem(name: "Milk", imageName: "milk"),
            ShoppingItem(name: "Muffin", imageName: "muffin"),
            ShoppingItem(name: "Popcorn", imageName: "popcorn"),
            ShoppingItem(name: "Soda", imageName: "soda"),
            ShoppingItem(name: "Strawberries", imageName: "strawberries"),
        ]
        
        
        return list
    }
    
    // MARK: - Persistence
    
    // Where are we going to store the items? (Where are we going to load them from?)
    var persistentFileURL: URL? {
        
        let fileManager = FileManager.default
        
        // Get the documents directory
        
        // myApp/documents/Shopping.plist
        let documentsDir = fileManager.urls(for: .documentDirectory, in: .userDomainMask).first
        
        // myApp/documents/shopping.plist
        let shoppingURL = documentsDir?.appendingPathComponent("shopping.plist")
        
        return shoppingURL
    }
    
}
