//
//  ShoppingListController.swift
//  Shopping List
//
//  Created by Harmony Radley on 2/28/20.
//  Copyright © 2020 Lambda School. All rights reserved.
//

import Foundation

class ShoppingListController {
    
    var itemNames: [ShoppingItem] = [
        ShoppingItem(name: "Apple"),
        ShoppingItem(name: "Grapes"),
        ShoppingItem(name: "Milk"),
        ShoppingItem(name: "Muffin"),
        ShoppingItem(name: "Popcorn"),
        ShoppingItem(name: "Soda"),
        ShoppingItem(name: "Strawberries"),
    ]
    
    var name = ""
    var address = ""
    
 
    
       // MARK: - Persistence
        
           var shoppingListURL: URL? {
               
               let fileManager = FileManager.default
               
               let documentsDir = fileManager.urls(for: .documentDirectory, in: .userDomainMask).first
               
               let itemsURL = documentsDir?.appendingPathComponent("ShoppingList.plist")
               
               return itemsURL
           }
           
        
        func saveToPersistentStore() {
            
            let encoder = PropertyListEncoder()
            
            do {
                
                let itemsData = try encoder.encode(shoppingListURL)
                
                guard let itemsURL = shoppingListURL else { return }
                
                try itemsData.write(to: itemsURL)
                
            } catch {
                
                print("Unable to save item(s) to plist: \(error)")
            }
            
        }
       
       func loadFromPersistentStore() {
           guard let itemsURL = shoppingListURL else { return }
           do {
               var itemsData = try Data(contentsOf: itemsURL)
//               itemsData = try PropertyListDecoder().decode([ShoppingItem], from: itemsData)
           } catch {
               print("Error decoding items: \(error)")
           }
       }
    
    
    
    }
    
    
    
    
    
    
    

