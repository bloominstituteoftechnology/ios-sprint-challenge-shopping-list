//
//  ShoppingController.swift
//  Shopping List
//
//  Created by Yvette Zhukovsky on 10/19/18.
//  Copyright © 2018 Lambda School. All rights reserved.
//



import Foundation
import UIKit


 var shoppingItems = [ShoppingItem]()

class UserDefaultsManager {
    
    let shoppingListInitKey: String = "ShoppingListInitKey"
    
    func initShoppingList() {
        UserDefaults.standard.set(true, forKey: shoppingListInitKey)
    }
    
    var hasShoppingListBeenInitialized: Bool {
        let shoppingInit = UserDefaults.standard.bool(forKey: shoppingListInitKey)
        return shoppingInit
    }
}



class ShoppingController {
    
    init() {
        loadFromPersistentStore()
        if userDefaultsManager.hasShoppingListBeenInitialized == false {
            let itemNames = ["apple", "grapes", "milk", "muffin", "popcorn", "soda", "strawberries"]
            for itemName in itemNames {
                guard let image = Data(image:imageData),
                    let imageData = UIImagePNGRepresentation(image) else { return }
                createItem(imageData: image, name: uname)
                userDefaultsManager.initShoppingList()
            }
        } else { return }
    }
    

    // Create items
    func createItem(imageData: Data, name: String, addedToList: Bool = false) {
        let shoppingItem = ShoppingItem(image: imageData, name: name, added: Bool)
        shoppingItems.append(shoppingItem)
        saveToPersistentStore()
    }
    
    
 
    func updateAddedToList(shoppingItem: ShoppingItem) {
        guard let index = shoppingItems.index(of: shoppingItem) else { return }
        shoppingItems[index].added = !shoppingItems[index].added
        saveToPersistentStore()
    }
    
   
    func saveToPersistentStore() {
        guard let url = persistentFileURL else { return }
        do {
            let encoder = PropertyListEncoder()
            let data = try encoder.encode(shoppingItems)
            try data.write(to: url)
        } catch {
            NSLog("Error saving shopping items: \(error)")
        }
    }
    
    func loadFromPersistentStore() {
        let fm = FileManager.default
        guard let url = persistentFileURL, fm.fileExists(atPath: url.path) else { return }
        do {
            let data = try Data(contentsOf: url)
            let decoder = PropertyListDecoder()
            shoppingItems = try decoder.decode([ShoppingItem].self, from: data)
        } catch {
            NSLog("Error loading shopping items: \(error)")
        }
    }
    

    private var persistentFileURL: URL? {
        let fm = FileManager.default
        guard let docsDir = fm.urls(for: .documentDirectory, in: .userDomainMask).first else { return nil }
        return docsDir.appendingPathComponent("shoppingList.plist")
    }
    
    
    var shoppingItems = [ShoppingItem]()
    

    let userDefaultsManager = UserDefaultsManager()
    
}


