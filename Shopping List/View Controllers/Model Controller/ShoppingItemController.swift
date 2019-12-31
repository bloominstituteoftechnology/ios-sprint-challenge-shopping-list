//
//  ShoppingItemController.swift
//  Shopping List
//
//  Created by LambdaSchoolVM_Catalina on 12/13/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import Foundation

class ShoppingItemController {
    
    let userDefaults = UserDefaults.standard
    let itemNames = ["Apple", "Grapes", "Milk", "Muffin", "Popcorn", "Soda", "Strawberries"]
    var shoppingItems: [ShoppingItem] = []

    init() {
        if userDefaults.bool(forKey: "itemsCreated") == false || shoppingItems.count == 0 {
                createItems()
        }
    }
    
    
    private var shoppingListURL: URL? {
        let fileManager = FileManager.default
        guard let URL = fileManager.urls(for: .documentDirectory, in: .userDomainMask).first else { return nil}
        return URL.appendingPathComponent("ShoppingList.plist")
    }
    
    //create
    
    var itemsAdded: [ShoppingItem] {
        return shoppingItems.filter { $0.hasBeenAddedToList}
    }
    
    
    // save , add, & load from persistent store
    func saveToPersistentStore() {
        guard let URL = shoppingListURL else { return }
        do {
            let encoder = PropertyListEncoder()
            let shoppingData = try encoder.encode(shoppingItems)
            try shoppingData.write(to: URL)
        } catch {
            print("Error saving items Data:\(error)")
        }
    }
    
    func loadFromPersistentStore() {
        let fileManager = FileManager.default
        guard let URL = shoppingListURL,
            fileManager.fileExists(atPath: URL.path) else { return }
        
        do {
            let shoppingData = try Data(contentsOf: URL)
            let decoder = PropertyListDecoder()
            shoppingItems = try decoder.decode([ShoppingItem].self, from: shoppingData )
        } catch {
            print("Error Loading Shopping Data: \(error)")
        }
    }
    func createItems() {
        for itemName in itemNames {
            shoppingItems.append(ShoppingItem(name: itemName, hasBeenAddedToList: false))
        }
        userDefaults.set(true, forKey: "itemsCreated")
        saveToPersistentStore()
    }

    func update(item: ShoppingItem){
//        guard let index = shoppingItems.firstIndex(of: item) else { return }
//        var newItem = shoppingItems[index]
        item.hasBeenAddedToList = !item.hasBeenAddedToList
        //        shoppingItems[index] = newItem
        saveToPersistentStore()
    }
    
    
    }

