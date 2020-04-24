//
//  ShoppingItemController.swift
//  Shopping List
//
//  Created by Violet Lavender Love on 4/24/20.
//  Copyright © 2020 Lambda School. All rights reserved.
//

import Foundation



class ShoppingItemController {
    
    init() {
        loadFromPersistentStore()
    }
    
    let itemNames: [ShoppingItem] = [ShoppingItem(name: "Apple",
                                                  isOnShoppingList: false, image: "apple"),
                                     ShoppingItem(name: "Grapes",
                                                  isOnShoppingList: false, image: "grapes"),
                                     ShoppingItem(name:"Milk", isOnShoppingList:
                                        false, image: "milk"),
                                     ShoppingItem(name: "Muffin",
                                                  isOnShoppingList: false, image: "muffin"),
                                     ShoppingItem(name: "Popcorn",
                                                  isOnShoppingList: false, image: "popcorn"),
                                     ShoppingItem(name: "Soda", isOnShoppingList:
                                        false, image: "soda"),
                                     ShoppingItem(name: "Strawberries",
                                                  isOnShoppingList: false, image: "strawberries")]
    
    
    
    let isOnShoppingList = UserDefaults.standard.bool(forKey: //Haven't madde this yet)
        
        if ShoppingItem.isOnShoppingList = true {
        //show as such in it's collection view cell.
    }
    
    var persistentFileURL: URL? {
        
        let fileManager = FileManager.default
        
        let documentsDir = fileManager.urls(for: .documentDirectory, in: .userDomainMask).first
        
        let shoppingListItemsURL = documentsDir?.appendingPathComponent("shoppingList.plist")
        
        return shoppingListItemsURL
    }
    
    func saveToPersistantStore() {
        
        do {
            
            let encoder = PropertyListEncoder()
            
            let shoppingListPlist = try encoder.encode(isOnShoppingList)
            
            guard let persistentFileURL = persistentFileURL else {
                return
            }
            
            try shoppingListPlist.write(to: persistentFileURL)
            
            
        } catch {
            
            print("things broke while trying to save status:\(error)")
            
        }
        
    }
    func loadFromPersistentStore() {
        
        guard let persistentFileURL = persistentFileURL else {
            
            return
            
        }
        
        do {
            
            let decoder = PropertyListDecoder()
            
            
            let shoppingListPlist = try Data(contentsOf: persistentFileURL)
            
            
            let shoppingItems = try decoder.decode([ShoppingItem].self, from: shoppingListPlist)
            
            self.shoppingItems = shoppingItems
            
        } catch {
            
            print("Error loading info from plist: \(error)")
            
        }
    }
}
