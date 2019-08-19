//
//  ShoppingList.swift
//  Shopping List
//
//  Created by Eoin Lavery on 19/08/2019.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import Foundation

class ShoppingList {
    
    //Create blank array to hold ShoppingItem Objects either loaded from local storage or created during runtime.
    private(set) var shoppingList: [ShoppingItem] = []
    
    //loadDataOnLaunch called when an instance of ShoppingList is created.
    init() {
        loadDataOnLaunch()
    }
    
    //Get URL file for local storage .plist
    var shoppingListURL: URL? = {
        let fileManager = FileManager()
        guard let documents = fileManager.urls(for: .documentDirectory, in: .userDomainMask).first else { return nil}
        return documents.appendingPathComponent("shoppinglist.plist")
    }()
    
    //Check if data is present in UserDefaults local storage, and if not, initialise ShoppingItem Objects one by one based on their names in the array. Items will be loaded with a default isListed value of false, allowing users to have an empty shopping list if none already exists.
    func loadDataOnLaunch() {
        let userDefaults = UserDefaults.standard
        if userDefaults.bool(forKey: String.shoppingListKey) {
            loadFromPersistentStore()
        } else {
            let itemNames = ["Apple", "Grapes", "Milk", "Muffin", "Popcorn", "Soda", "Strawberries"]
            for shoppingItem in itemNames {
                shoppingList.append(ShoppingItem(name: shoppingItem))
            }
            saveToPersistentStore()
            userDefaults.set(true, forKey: String.shoppingListKey)
        }
    }
    
    //Decide data from local file
    func loadFromPersistentStore() {
        let fileManager = FileManager.default
        guard let url = shoppingListURL, fileManager.fileExists(atPath: url.path) else { return }
        let decoder = PropertyListDecoder()
        
        do {
            let data = try Data.init(contentsOf: url)
            shoppingList = try decoder.decode([ShoppingItem].self, from: data)
        } catch {
            print("Error retrieving Shopping List from file: \(error)")
        }
        
    }
    
    //Encode data and save to local file for Persistence between App Launches
    func saveToPersistentStore() {
        guard let url = shoppingListURL else { return }
        let encoder = PropertyListEncoder()
        
        do{
            let shoppingData = try encoder.encode(shoppingList)
            try shoppingData.write(to: url)
        } catch {
            print("Error saving Shopping List to file: \(error)")
        }
        
    }
    
    func shoppingItemToggle(for item: ShoppingItem){
        guard let itemIndex = shoppingList.index(of: item) else { return }
        shoppingList[itemIndex].isListed.toggle()
        saveToPersistentStore()
    }
    
}
