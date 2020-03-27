//
//  ShoppingCartController.swift
//  Shopping List
//
//  Created by Cameron Collins on 3/27/20.
//  Copyright © 2020 Lambda School. All rights reserved.
//

import Foundation


class ShoppingCartController {
    
    //Variables
    var key = "myKey"
    var shoppingItems: [ShoppingItem] = [ShoppingItem(name: itemNames[0], hasBeenAdded: false),
        ShoppingItem(name: itemNames[1], hasBeenAdded: false),
        ShoppingItem(name: itemNames[2], hasBeenAdded: false),
        ShoppingItem(name: itemNames[3], hasBeenAdded: false),
        ShoppingItem(name: itemNames[4], hasBeenAdded: false),
        ShoppingItem(name: itemNames[5], hasBeenAdded: false),
        ShoppingItem(name: itemNames[6], hasBeenAdded: false)]
    
    //Initializer
    init() {
        checkPersistence()
    }
    
    //Get URL
    var persistentURL: URL? {
        let documents = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first
        let url = documents?.appendingPathComponent("ShoppingList.plist")
        return url
    }
    
    //Functions
    
    //Check Persistence
    func checkPersistence() {
        if UserDefaults.standard.bool(forKey: key) == false {
            saveToPersistence()
            return
        }
    }
    
    func saveToPersistence() {
        let userDefault = UserDefaults.standard
        userDefault.set(true, forKey: key)
        
        do {
            //Encoder
            let encoder = PropertyListEncoder()
            guard let url = persistentURL else { return }
            
            //Encode
            let encode = try encoder.encode(shoppingItems)
            
            //Write to file
            try encode.write(to: url)
            print("Saved")
        } catch {
            print("Error Saving: \(error)")
        }
    }
    
    func loadToPersistence() {
        
    }
    
    
    
}
