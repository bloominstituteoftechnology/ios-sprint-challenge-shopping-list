//
//  ShoppingItemController.swift
//  Shopping List
//
//  Created by Bhawnish Kumar on 2/28/20.
//  Copyright © 2020 Lambda School. All rights reserved.
//

import Foundation

class ShoppingController {
    private let onlyOnceKey = "onlyOnceKey"
    
    var shoppingItems: [ShoppingItem]  = []
    
            let itemNames = ["Apple", "Grapes", "Milk", "Muffin", "Popcorn", "Soda", "Strawberries"]
        
    var shoppingListURL: URL? {
            let fileMananger = FileManager.default
            
            let documentsDir = fileMananger.urls(for: .documentDirectory, in: .userDomainMask).first
            
            let shoppingURL = documentsDir?.appendingPathComponent("ShoppingList.plist") // Not working because of BOOK array
            
            return shoppingURL
        }
        
        func saveToPersistentStore() {
            
            let encoder = PropertyListEncoder()
            
            do {
                let shoppingData = try encoder.encode(shoppingItems) // has to see with books array.
                
                guard let shoppingURL = shoppingListURL else { return }
                try shoppingData.write(to: shoppingURL)
            } catch {
                print("Unable to save into Plist \(error)")
            }
        }
        
        func loadFromPersistentStore() {
            guard let shoppingURL = shoppingListURL else { return }
            let decoder = PropertyListDecoder()
            
            do {
                let shoppingData = try Data(contentsOf: shoppingURL)
                try decoder.decode([ShoppingItem].self, from: shoppingData)
            
            } catch {
                print("error decoding \(error)")
            }
        }
    }


    
      
        
    
