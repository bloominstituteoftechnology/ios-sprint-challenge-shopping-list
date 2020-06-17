//
//  ShoppingListController.swift
//  Shopping List
//
//  Created by Ufuk Türközü on 20.12.19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import Foundation

class ShoppingListController/*: Codable*/ {
    
    var selectedItems: [ShoppingItem] = []

    var shoppingList: [ShoppingItem] {

        let result = [ShoppingItem(itemName: "Apple", itemImageName: "Apple"),
                      ShoppingItem(itemName: "Grapes", itemImageName: "Grapes"),
                      ShoppingItem(itemName: "Milk", itemImageName: "Milk"),
                      ShoppingItem(itemName: "Muffin", itemImageName: "Muffin"),
                      ShoppingItem(itemName: "Popcorn", itemImageName: "Popcorn"),
                      ShoppingItem(itemName: "Soda", itemImageName: "Soda"),
                      ShoppingItem(itemName: "Strawberries", itemImageName: "Strawberries")]

        let hasBeenAdded = UserDefaults.standard.bool(forKey: .hasBeenAdded)
    
        return result
    }
    
  

/*    private var shoppingListURL: URL? {
         let fileManager = FileManager.default
               
               guard let documentsDir = fileManager.urls(for: .documentDirectory, in: .userDomainMask).first else { return nil }
               
               return documentsDir.appendingPathComponent("ShoppingList.plist")
    }
    
    func saveToPersistentStore() {
        
       guard let fileURL = shoppingListURL else { return }
       
       do {
        
           let encoder = PropertyListEncoder()
           
           let shoppingListData = try encoder.encode(fileURL)
           
           try shoppingListData.write(to: fileURL)
            
        } catch {
            print("Error saving shoppings list: \(error)")
        }
    }
    
    func loadFromPersistentStore() {
        
      //  let fileManager = FileManager.default
        
        do {
            guard let fileURL = shoppingListURL
                else { return }
            
            let shoppingListData = try Data(contentsOf: fileURL)
            
            let decoder = PropertyListDecoder()
            
            let  decodedShoppingList = try decoder.decode([ShoppingItem].self, from: shoppingListData)
            
            shoppingList = decodedShoppingList
            
        } catch {
            print("Error loading shoppings list data: \(error)")
        }
        
    } */
}

extension String {
    static var hasBeenAdded = "HasBeenAddedKey"
}


