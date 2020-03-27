//
//  ShoppingItemController.swift
//  Shopping List
//
//  Created by Nihal Erdal on 3/27/20.
//  Copyright © 2020 Lambda School. All rights reserved.
//

import Foundation

class ShoppingListController {
    
    var shoppingItems : [ShoppingItem] = [ShoppingItem(name: "Apple", hasAdded: false),
                                          ShoppingItem(name: "Grapes", hasAdded: false),
                                          ShoppingItem(name: "Apple", hasAdded: false),
                                          ShoppingItem(name: "Apple", hasAdded: false),
                                          ShoppingItem(name: "Apple", hasAdded: false),
                                          ShoppingItem(name: "Apple", hasAdded: false),
                                          ShoppingItem(name: "Apple", hasAdded: false),
    ]
    
    //    let itemNames = ["Apple", "Grapes", "Milk", "Muffin", "Popcorn", "Soda", "Strawberries"]
    
    func creatItem(name: String, hasAdded: Bool) -> ShoppingItem {
        let item = ShoppingItem(name: name, hasAdded: hasAdded)
        shoppingItems.append(item)
        saveToPersistentStore()
        return item
    }
    
    
    var persistentFileURL : URL?{
         let fileManager = FileManager.default
         guard let documentsDir = fileManager.urls(for: .documentDirectory, in: .userDomainMask).first else {return nil}
         let shoppingListURL = documentsDir.appendingPathComponent("shoppingList.plist")
         return shoppingListURL
     }
    
    func saveToPersistentStore(){
        
        guard let fileURL = persistentFileURL else {return}
        
        do {
            
            let encoder = PropertyListEncoder()
            let shoppingData = try encoder.encode(shoppingItems)
            try shoppingData.write(to: fileURL)
            
        }catch{
            print("Error encoding shoppingItems array: \(error)")
        }
    }
    
    func loadFromPersistentStore(){
        
        guard let fileURL = persistentFileURL else {return}
        
        do {
            
            let data = try Data(contentsOf: fileURL)
            let decoder = PropertyListDecoder()
            let shoppingItemsArray = try decoder.decode([ShoppingItem].self, from: data)
            shoppingItems = shoppingItemsArray
            
        }catch{
            print("Error decoding shoppingList: \(error)")
        }
    }
    
}



