//
//  ShoppingItemController.swift
//  Shopping List
//
//  Created by LambdaSchoolVM_Catalina on 12/13/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import Foundation

class ShoppingItemController {
    
    struct PropertyKeys {
        static let existingKey = "shoppingItemExists"
    }
    
    
    // Properties
    var shoppingItems: [ShoppingItem] = []
    let ifItemsExist = UserDefaults.standard.bool(forKey: PropertyKeys.existingKey)
    
    var itemsAdded: [ShoppingItem] {
        return shoppingItems.filter { $0.hasBeenAddedToList}
    }
    
    var notAddedItems: [ShoppingItem] {
        return shoppingItems.filter { $0.hasBeenAddedToList == false}
    }
    
//        let userDefaults = UserDefaults.standard
    //    let itemNames = ["Apple", "Grapes", "Milk", "Muffin", "Popcorn", "Soda", "Strawberries"]
    

//    init() {
//        if userDefaults.bool(forKey: "shoppingItemExists") == false || shoppingItems.count == 0 {
//                createItems()
//        }
//    }
    
    
        // Functions
    
    //
    //    func update(item: ShoppingItem){
    ////        guard let index = shoppingItems.firstIndex(of: item) else { return }
    ////        var newItem = shoppingItems[index]
    //        item.hasBeenAddedToList = !item.hasBeenAddedToList
    //        //        shoppingItems[index] = newItem
    //        saveToPersistentStore()
    //    }
        
    func update(for item: ShoppingItem){
        guard let index = shoppingItems.firstIndex(of: item) else { return }
        
        shoppingItems[index].hasBeenAddedToList.toggle()
        saveToPersistentStore()
    }
    
    // fetch
    func fetchItems(){
        if ifItemsExist {
            loadFromPersistentStore()
        } else {
            createItems()
            saveToPersistentStore()
            UserDefaults.standard.set(true, forKey: PropertyKeys.existingKey)       }
    }
    
    //create

    func createItems() {
            let itemNames = ["Apple", "Grapes", "Milk", "Muffin", "Popcorn", "Soda", "Strawberries"]
            for itemName in itemNames {
                let item = ShoppingItem(name: itemName)
    //            shoppingItems.append(ShoppingItem(name: itemName, hasBeenAddedToList: false))
                shoppingItems.append(item)
            }
//            userDefaults.set(true, forKey: "itemsCreated")
//            saveToPersistentStore()
        }

    
    
    
// persistance
    
    private var shoppingListURL: URL? {
        let fm = FileManager.default
        guard let dir = fm.urls(for: .documentDirectory, in: .userDomainMask).first else { return nil}
        return dir.appendingPathComponent("ShoppingList.plist")
    }
    
    
    //load from persistant store
    
    private func loadFromPersistentStore() {
        let fm = FileManager.default
        guard let url = shoppingListURL,
            fm.fileExists(atPath: url.path) else { return }
        
        do {
            let shoppingData = try Data(contentsOf: url)
            let decoder = PropertyListDecoder()
            shoppingItems = try decoder.decode([ShoppingItem].self, from: shoppingData )
        } catch {
            print("Error Loading Shopping Data: \(error)")
        }
    }
    
    // save
    private func saveToPersistentStore() {
        guard let url = shoppingListURL else { return }
        do {
            let encoder = PropertyListEncoder()
            let shoppingData = try encoder.encode(shoppingItems)
            try shoppingData.write(to: url)
        } catch {
            print("Error saving items Data:\(error)")
        }
    }
    
    
    }

