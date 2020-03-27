//
//  ShoppingModelController.swift
//  Shopping List
//
//  Created by Mark Poggi on 3/27/20.
//  Copyright © 2020 Lambda School. All rights reserved.
//

import Foundation

class ShoppingController {
    
    var shoppingList: [ShoppingList] = []
   
    //Use a Bool and the UserDefaults to make sure that new shopping items are initialized only once.
    
    let itemNames = ["Apple", "Grapes", "Milk", "Muffin", "Popcorn", "Soda", "Strawberries"]
    
    init() {
        loadFromPersistentStore()
    }
    
    //MARK: - Persistence
    
    var persistentFileURL: URL? {
        
        let fileManger = FileManager.default
        
        // Grab the app's documents directory - ex. MyUser/Documents/
        let documentsDir = fileManger.urls(for: .documentDirectory, in: .userDomainMask).first
        
        // Create a unique locatino for the property lsit (plist)
        let shoppinglistURL = documentsDir?.appendingPathComponent("shoppinglist.plist")
        
        return shoppinglistURL
    }
    
    func saveToPersistentStore() {
        
        do {
            
            // Create the encoder
            let encoder = PropertyListEncoder()
            
            // Encode the shoppingList into a plist
            let shoppingPlist = try encoder.encode(shoppingList)
            
            // Grab the location we want to save the plist to.
            guard let persistentFileURL = persistentFileURL else { return }
            
            // Save the file to the documents directory
            try shoppingPlist.write(to: persistentFileURL)
            
        } catch {
            // Handle the error that gets "thrown" here.  iOS interpolates the error for you here.
            // This catch statement will only run if a throwing method fails.
            print("Error saving shopping list: \(error)")
        }
        
    }
    
    func loadFromPersistentStore() {
        
        guard let persistentFileURL = persistentFileURL else { return }
        
        do {
            
            // Creatge gthe decoder
            let decoder = PropertyListDecoder()
            
            // Grab the data (plist)
            let shoppingPlist = try Data(contentsOf: persistentFileURL)
            
            // Plist -> [ShoppingList]
            let shoppingList = try decoder.decode([ShoppingList].self, from: shoppingPlist)
            
            self.shoppingList = shoppingList
            
        } catch {
            print("Error decoding shopping list: \(error)")
        }
    }
    
    
    
    
}
