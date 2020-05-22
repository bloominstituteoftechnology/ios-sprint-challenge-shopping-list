//
//  ShoppingItemController.swift
//  Shopping List
//
//  Created by Violet Lavender Love on 5/22/20.
//  Copyright © 2020 Lambda School. All rights reserved.
//

import Foundation

class ShoppingListController {
    
    var shoppingListItems: [ShoppingItem] {
        var shoppingListItems =
            [ShoppingItem(name: "Apple", hasBeenAdded: false, imageName: "Apple"),
             ShoppingItem(name: "Grapes", hasBeenAdded: false, imageName: "Grapes"),
             ShoppingItem(name: "Milk", hasBeenAdded: false, imageName: "Milk"),
             ShoppingItem(name: "Muffin", hasBeenAdded: false, imageName: "Muffin"),
             ShoppingItem(name: "Popcorn", hasBeenAdded: false, imageName: "Popcorn"),
             ShoppingItem(name: "Soda", hasBeenAdded: false, imageName: "Soda"),
             ShoppingItem(name: "Strawberries", hasBeenAdded: false, imageName: "Strawberries")
        ]
        let hasBeenAdded = UserDefaults.standard.bool(forKey: .hasBeenAddedKey)
        
        if hasBeenAdded {
            //change button to show that, something i haven't had time to teach myself because i'm exhausted 
        }
        
        return shoppingListItems
    }
    
    //MARK: - Persistence
    
    var persistentFileURL: URL? {
        
        let fileManager = FileManager.default
        
        let documentsDir = fileManager.urls(for: .documentDirectory, in: .userDomainMask).first
        
        let shoppingItemsURL = documentsDir?.appendingPathComponent("shoppingItems.plist")
        
        return shoppingItemsURL
    }
    func saveToPersistentStore() {
        do {
            
            guard let persistentFileURL = persistentFileURL else { return }
            
            let encoder = PropertyListEncoder()
            
            let shoppingItemsPlist = try encoder.encode(shoppingListItems)
            
            try shoppingItemsPlist.write(to: persistentFileURL)
            
        } catch {
            
            print("Error saving Shopping List: \(error)")
            
        }
    }
    func loadFromPersistentStore() {
        do{
            
            guard let persistentFileURL = persistentFileURL else { return }
            
            let shoppingItemsPlist = try Data(contentsOf: persistentFileURL)
            
            let decoder = PropertyListDecoder()
            
            let decodedShoppingListItems = try decoder.decode([ShoppingItem].self, from: shoppingItemsPlist)
            
            self.shoppingListItems = decodedShoppingListItems
            
        } catch {
            
            print("Error loading shopping list from plist \(error)")
            
        }
        
    }
}
