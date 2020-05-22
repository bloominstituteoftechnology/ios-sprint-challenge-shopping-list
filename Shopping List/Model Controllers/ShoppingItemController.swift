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
            ShoppingItem(name: "Apple", added: true, imageName: "apple"),
            ShoppingItem(name: "Grapes", added: true, imageName: "grapes"),
            ShoppingItem(name: "Milk", added: true, imageName: "milk"),
            ShoppingItem(name: "Muffin", added: true, imageName: "muffin"),
            ShoppingItem(name: "Popcorn", added: true, imageName: "popcorn"),
            ShoppingItem(name: "Soda", added: true, imageName: "soda"),
            ShoppingItem(name: "Strawberries", added: true, imageName: "strawberries"),
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
