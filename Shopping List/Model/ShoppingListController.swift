//
//  ShoppingListController.swift
//  Shopping List
//
//  Created by Alex Ladines on 5/3/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import Foundation
import UIKit

class ShoppingListController {
    // MARK: - Properties
    
    private(set) var shoppingList: [ShoppingItem] = []
    
    // User selected items
    var addedShoppingListItems: [ShoppingItem] {
        get {
            return self.shoppingList.filter { $0.addedToList == true }
        }
    }
    
    let itemNames = ["apple", "grapes", "milk", "muffin", "popcorn", "soda", "strawberries"]

    // MARK: - Methods
    
    // Items should only load once
    init() {
        print("Documents folder is \(documentsDirectory())")
        print("Data file path is \(dataFilePath())")
        // At first should be 0
        print(shoppingList.count)
        
        self.loadFromPersistantStorage()
        self.registerDefaults()
        self.handleFirstTime()

        // Then should be 7
        print(shoppingList.count)

    }

    func createShoppingItem(imageData: Data, name: String) {
        self.shoppingList.append(ShoppingItem(imageData: imageData, name: name))
    }

    func updateShoppingItem(item: ShoppingItem) {
        guard let i = self.shoppingList.index(of: item) else { return }
        self.shoppingList[i].addedToList.toggle()
        self.saveToPersistentStorage()
    }
}
// MARK: - UserDefaults
// First time a user installs the app
extension ShoppingListController {
    func registerDefaults() {
        let dictionary = ["FirstTime": true] as [String: Any]
        UserDefaults.standard.register(defaults: dictionary)
    }
    
    //Create array of shopping items
    func handleFirstTime() {
        let userDefaults = UserDefaults.standard
        let firstTime = userDefaults.bool(forKey: "FirstTime")
        
        if firstTime
        {
            for item in self.itemNames
            {
                guard let image = UIImage(named: item),
                    let imageData = UIImagePNGRepresentation(image) else { return }
                
                self.createShoppingItem(imageData: imageData, name: item)
            }
            
            // Save just in case person quits app after installing without updating anything.
            self.saveToPersistentStorage()
        }
        
        userDefaults.set(false,forKey: "FirstTime")
        userDefaults.synchronize()
    }
}

// MARK: - Data Persistance
extension ShoppingListController {
    
    // Get Documents Directory URL
    func documentsDirectory() -> URL {
        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        return paths[0]
    }
    
    // Get Data File Path URL
    func dataFilePath() -> URL {
        return self.documentsDirectory().appendingPathComponent("ShoppingListItems.plist")
    }
    
    // Saving
    func saveToPersistentStorage() {
        let encoder = PropertyListEncoder()
        do
        {
            let data = try encoder.encode(self.shoppingList)
            
            try data.write(to: self.dataFilePath(), options: Data.WritingOptions.atomic)
        }
        catch
        {
            print("Error encoding item array: \(error.localizedDescription)")
        }
    }
    
    // Loading
    func loadFromPersistantStorage() {
        let path = dataFilePath()
        
        if let data = try? Data(contentsOf: path)
        {
            let decoder = PropertyListDecoder()
            do
            {
                self.shoppingList = try decoder.decode([ShoppingItem].self,from: data)
            }
            catch
            {
                print("Error decoding item array: \(error.localizedDescription)")
            }
        }
    }
}
