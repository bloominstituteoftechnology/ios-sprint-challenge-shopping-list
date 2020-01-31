//
//  ShoppingListController.swift
//  Shopping List
//
//  Created by Nichole Davidson on 1/31/20.
//  Copyright © 2020 Lambda School. All rights reserved.
//

import Foundation

class ShoppingListController {
    var items: [ShoppingItem] {
    let itemNames = [ShoppingItem(name: "Apple", imageName: "apple"),
                    ShoppingItem(name: "Grapes", imageName: "grapes"),
                    ShoppingItem(name: "Milk", imageName: "milk"),
                    ShoppingItem(name: "Muffin", imageName: "muffin"),
                    ShoppingItem(name: "Popcorn", imageName: "popcorn"),
                    ShoppingItem(name: "Soda", imageName: "soda"),
                    ShoppingItem(name: "Strawberries", imageName: "strawberries")]
        
    
            func addToList() {
                let itemAdded = UserDefaults.standard.bool(forKey: <#T##String#>)
               }
            
   }
    
    var persistentFileURL: URL? {
        
        let fileManager = FileManager.default
        
        guard let documentsDir = fileManager.urls(for: .documentDirectory, in: .userDomainMask).first else { return nil }
        
        // ~/MyApp/Documents/stars.plist
        
        let shoppingListURL = documentsDir.appendingPathComponent("info.plist")
        
        return shoppingListURL
    }
    
    func saveToPersistentStore() {
       
       guard let fileURL = persistentFileURL else { return }
       
       let encoder = PropertyListEncoder()
       
       do {
           
           let shoppingListData = try encoder.encode(items)
           try shoppingListData.write(to: fileURL)
           
       } catch {
           print("Error encoding items array: \(error)")
          
       }
    }
    
    func loadFromPersistentStore() {
        
        guard let fileURL = persistentFileURL else { return }
        
        do {
            
            let shoppingListData = try Data(contentsOf: fileURL)
            
            let decoder = PropertyListDecoder()
            
            let shoppingListArray = try decoder.decode([ShoppingItem].self, from: shoppingListData)
            
            self.items = shoppingListArray
            
        } catch {
            
            print("Error decoding items: \(error)")
        }
    }
}
   

