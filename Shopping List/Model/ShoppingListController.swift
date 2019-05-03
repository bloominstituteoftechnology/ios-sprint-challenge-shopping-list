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
    
    private var persistentURL: URL? {
        let fileManager = FileManager.default
        guard let documents = fileManager.urls(for: .documentDirectory, in: .userDomainMask).first else {
            return nil
        }
        print("Documents: \(documents.path)")
        return documents.appendingPathComponent("shoppingList.plist")
    }
    
    // MARK: - UserDefaults
    let userDefaults = UserDefaults.standard

    // MARK: - Methods
    
    // Items should only load once
    init() {
        // At first should be 0
        print(shoppingList.count)
        
        let user = userDefaults.bool(forKey: "CheckUser")
        // If bool is nil then it means it's the first time installing this app.
        if user
        {
            for item in itemNames
            {
                guard let image = UIImage(named: item),
                    let imageData = UIImagePNGRepresentation(image) else { return }
                
                self.createShoppingItem(imageData: imageData, name: item)
            }
            
            self.saveToPersistentStore()
            
            // Set key
            userDefaults.set(true, forKey: "CheckUser")
            
        }
        else
        {
            self.loadFromPersistentStore()
        }
        
        // Then should be 7
        print(shoppingList.count)
        
    }
    
    func saveToPersistentStore() {
        guard let url = persistentURL else { return }
        
        do {
            let encoder = PropertyListEncoder()
            let data = try encoder.encode(self.shoppingList)
            try data.write(to: url)
        } catch {
            print("Error saving items: \(error)")
        }
    }
    
    func loadFromPersistentStore() {
        // Make sure file exists
        let fileManager = FileManager.default
        guard let url = persistentURL, fileManager.fileExists(atPath: url.path) else {
            print("load failed to find file")
            return }
        
        // Load and decode
        do {
            let data = try Data(contentsOf: url)
            let decoder = PropertyListDecoder()
            self.shoppingList = try decoder.decode([ShoppingItem].self, from: data)
        } catch {
            print("Error loading data from disk: \(error)")
        }
    }
    
    func createShoppingItem(imageData: Data, name: String) {
        self.shoppingList.append(ShoppingItem(imageData: imageData, name: name))
    }
    
    func updateShoppingItem(item: ShoppingItem) {
        guard let i = self.shoppingList.index(of: item) else { return }
        self.shoppingList[i].addedToList.toggle()
        self.saveToPersistentStore()
    }
}
