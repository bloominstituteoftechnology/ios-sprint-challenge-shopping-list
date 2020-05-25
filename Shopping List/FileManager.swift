//
//  FileManager.swift
//  Shopping List
//
//  Created by Drew Miller on 5/22/20.
//  Copyright © 2020 Lambda School. All rights reserved.
//

import Foundation

class ShoppingListControler {

var shoppingList: [ShoppingItem] = []
    
let itemNames = ["Apple", "Grapes", "Milk", "Muffin", "Popcorn", "Soda", "Strawberries"]
    

private var shoppingListURL: URL? {
       
       let fileManager = FileManager.default
       
       let documentsDir = fileManager.urls(for: .documentDirectory, in: .userDomainMask).first
       
       let shoppingItemURL = documentsDir?.appendingPathComponent("shoppingList.plist")
       
       return shoppingItemURL
    
}
   
    func saveToPersistentStore() {
        
        do {
            
            guard let shoppingListURL = shoppingListURL else { return }
            
            //This is the machine that we can run our array of stars through that turns it into a property list
            let encoder = PropertyListEncoder()
            // Try to turn the stars into a property list
            let shoppingPlist = try encoder.encode(shoppingList)
            // Save the stars plist to the location that we specified in the persistentFileURL
            try shoppingPlist.write(to: shoppingListURL)
            
        } catch {
            print("Error saving star \(error)")
            
        }
        
    }

}


