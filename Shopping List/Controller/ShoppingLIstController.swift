//
//  ShoppingLIstController.swift
//  Shopping List
//
//  Created by Claudia Contreras on 2/21/20.
//  Copyright © 2020 Lambda School. All rights reserved.
//

import Foundation

class ShoppingList {
    var shoppingItems: [ShoppingItem] {
        var shoppingItems = [
            ShoppingItem(name: "Apple", addedToShoppingList: false),
            ShoppingItem(name: "Grapes", addedToShoppingList: false),
            ShoppingItem(name: "Milk", addedToShoppingList: false),
            ShoppingItem(name: "Muffin", addedToShoppingList: false),
            ShoppingItem(name: "Popcorn", addedToShoppingList: false),
            ShoppingItem(name: "Soda", addedToShoppingList: false),
            ShoppingItem(name: "Strawberries", addedToShoppingList: false)
        ]
        
        return shoppingItems
    }
    

    //MARK: - Persistance
    private var persistentFileURL: URL? {
        let fileManager = FileManager.default
        guard let documents = fileManager.urls(for: .documentDirectory, in: .userDomainMask).first else { return nil }
        return documents.appendingPathComponent("shoppingList.plist")
    }

    init() {
        loadFromPersistentStore()
    }
    
   //MARK: - Functions
    func updateItem(ShoppingItem: ShoppingItem, addedToShoppinglist: Bool) {
        
    }

    //MARK: - Persistance Methods
    func saveToPersistentStore() {
        
        //place to store the data
        guard let url = persistentFileURL else { return }
        
        //Need to convert the data to something that can be stored on the phone
        do {
            //Get ready to encode the data
            let encoder = PropertyListEncoder()
            
            //the encoded data
            let data = try encoder.encode(shoppingItems)
            
            //write to the url
            try data.write(to: url)
            
        } catch {
            print("Error saving data: \(error)")
        }
        
    }

    func loadFromPersistentStore() {
        let fileManager = FileManager.default
        //Make sure that the file exists at our selected path
        guard let url = persistentFileURL, fileManager.fileExists(atPath: url.path) else { return }
        
        do {
            //pull the data from the url
            let data = try Data(contentsOf: url)
            
            //to decode the data
            let decoder = PropertyListDecoder()
            
            // Decode the data and place in array (we specify what type to decode itself into)
            shoppingItems = try decoder.decode([ShoppingItem].self, from: data)
            
        } catch {
            print("error loading data: \(error)")
        }
    }
    
    func savePreference() {
        UserDefaults.standard.set(shoppingItems, forKey: itemPreferenceKey)
    }

    func loadPerference() {
        let itemPerference = UserDefaults.standard.string(forKey: itemPreferenceKey)
    }

    let itemPreferenceKey = "itemPreference"
}
