//
//  ShoppingListController.swift
//  Shopping List
//
//  Created by Lambda_School_Loaner_241 on 2/21/20.
//  Copyright © 2020 Lambda School. All rights reserved.
//

import Foundation

// redo step 2

class ShoppingListController {
    
    var shoppingList: [ShoppingItem]{
    let itemNames = ["Apple", "Grapes", "Milk", "Muffin", "Popcorn", "Soda", "Strawberries"]
        
        
        
        if UserDefaults.standard.bool(forKey: "ShoppingItems" ) {
          var persistentShoppingURL: URL? {
                   // Singleton - Single Instance that can be used throughout the app
                   let fileManager = FileManager.default
                   guard let documents = fileManager.urls(for: .documentDirectory, in: .userDomainMask).first else { return nil }
                   
        
                   
                   return documents.appendingPathComponent("shoppingList.plist")
               }
               
            func saveToPersistentStore() {
                
                // Stars -> Data -> Plist
                guard let url = persistentShoppingURL else { return }
                do {
                    let encoder = PropertyListEncoder()
                    let data = try encoder.encode(itemNames)
                    try data.write(to: url)
                } catch {
                    print("Error saving shopping list data: \(error)")
                }
            }
            
            

}
        
       
}
    
}





