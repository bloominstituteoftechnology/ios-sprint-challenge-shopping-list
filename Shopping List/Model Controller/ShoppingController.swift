//
//  ShoppingController.swift
//  Shopping List
//
//  Created by Michael Flowers on 5/3/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import Foundation

class ShoppingController {
    
    var shoppingItems = [ShoppingItem]()
    
    init() {
        hasBeenCalled()
    }
    
    func toggleHasBeenChanged(shoppingItem: ShoppingItem){
        shoppingItem.hasBeenAdded = !shoppingItem.hasBeenAdded
        saveToPersistentStore()
    }
    
    var persistentURL: URL? {
        let fileManger = FileManager.default
        guard let documentDirectory = fileManger.urls(for: .documentDirectory, in: .userDomainMask).first else { return nil }
        let fileName = documentDirectory.appendingPathComponent("shoppingList.plist")
        return fileName
    }
    
    func saveToPersistentStore(){
        let ecoder = PropertyListEncoder()
        guard let url = persistentURL else { return }
        
        do {
            let data = try ecoder.encode(shoppingItems)
            try data.write(to: url)
        } catch {
            print("Error saving shopping item to persistent store: \(error.localizedDescription)")
        }
    }
    
    func loadFromPersistentStore(){
        let decoder = PropertyListDecoder()
        let fm = FileManager.default
        //unwrap the url and check to see if the file path to the url exists.
        guard let url = persistentURL, fm.fileExists(atPath: url.path)  else { return }
        
        do {
            let data = try Data(contentsOf: url)
            shoppingItems = try decoder.decode([ShoppingItem].self, from: data)
        } catch  {
            print("Error loading shopping items from the persistent store: \(error.localizedDescription)")
        }
    }
    
    func createItems(){
        let itemNames = ["apple", "grapes", "milk", "muffin", "popcorn", "soda", "strawberries"]
        for item in itemNames {
            shoppingItems.append(ShoppingItem(imageName: item , name: item))
            
            //save to persistence
            saveToPersistentStore()
        }
        
        //Because we wll call this function in our conditional statement, we have to change/switch the value of the boolean to true.
        UserDefaults.standard.set(true, forKey: "HasCalledCreateFunction")
    }
    
    //create a computed property array that returns an array of items that have been added and that have not been added.
    var hasBeenAddedArray: [ShoppingItem] {
        return shoppingItems.filter { $0.hasBeenAdded == true }
    }
    
    func hasBeenCalled(){
        
        //create an instance of userDefault
        let userDefaults = UserDefaults.standard
        
        //check userDefault boolean value. If it == false then the createdFunction has NOT been called, so we need to call it. If it has, then we just call the loadFromPersistentstore function
        if userDefaults.bool(forKey: "HasCalledCreateFunction" ) == false {
            //in the create function we will set the value for the key to true so that, in the future, it will always be true and always load from persstent.
            createItems()
        } else {
            loadFromPersistentStore()
        }
    }
}
