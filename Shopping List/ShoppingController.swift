//
//  ShoppingController.swift
//  Shopping List
//
//  Created by Yvette Zhukovsky on 10/19/18.
//  Copyright © 2018 Lambda School. All rights reserved.
//



import Foundation
import UIKit




//func didSelectShoppingItem(on shoppingItem: ShoppingItem)
//{
//    if let index = shoppingItem.index(of: shoppingItem)
//    {
//        shoppingItem[index].isSelected = shoppingItem.isSelected ? false : true
//
//    }
//}
class UserDefaultsManager {
    
    let shoppingListInitKey: String = "ShoppingListInitKey"
    
    func initShoppingList() {
        UserDefaults.standard.set(true, forKey: shoppingListInitKey)
    }
    
    var hasShoppingListBeenInitialized: Bool {
        return UserDefaults.standard.bool(forKey: shoppingListInitKey)
    }
}



class ShoppingController {
 
    var shoppingItems = [ShoppingItem]()
    
    
    let userDefaultsManager = UserDefaultsManager()
    
    init() {
        if !userDefaultsManager.hasShoppingListBeenInitialized {
            let itemNames = ["apple", "grapes", "milk", "muffin", "popcorn", "soda", "strawberries"]
            for itemName in itemNames {
                guard let image = UIImage(named: itemName) else {return}
                guard let imageData = UIImagePNGRepresentation(image) else { return }
                createItem(image: imageData, name: itemName)
            }
            userDefaultsManager.initShoppingList()
        } else {
            loadFromPersistentStore()

        }
    }
    

    // Create items
    func createItem(image: Data, name: String, added: Bool = false) {
        let shoppingItem = ShoppingItem(image: image, name: name, added:added )
        shoppingItems.append(shoppingItem)
        saveToPersistentStore()
    }
    
    
 
    func updateAddedToList(item: ShoppingItem) {
        item.added.toggle()
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
            for item in shoppingItems {
                print(item.added)
            }
        } catch {
            NSLog("Error loading shopping items: \(error)")
        }
    }
    

    private var persistentFileURL: URL? {
        let fm = FileManager.default
        guard let docsDir = fm.urls(for: .documentDirectory, in: .userDomainMask).first else { return nil }
        return docsDir.appendingPathComponent("shoppingList.plist")
    }
    
    
  
    
    
    
    
}


