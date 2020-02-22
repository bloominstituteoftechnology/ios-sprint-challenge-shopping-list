//
//  ShoppingListContoller.swift
//  Shopping List
//
//  Created by Lambda_School_Loaner_259 on 2/21/20.
//  Copyright © 2020 Lambda School. All rights reserved.
//

import Foundation

class ShoppingListController {
    
    // MARK: Properties
    var itemNames = ["Apple", "Grapes", "Milk", "Muffin", "Popcorn", "Soda", "Strawberries"]
    
    var shoppingList: [ShoppingItem] {
        if !UserDefaults.standard.bool(forKey: "DidInitializeShoppingList") {
            var slInitArray: [ShoppingItem] = []
            for i in 0..<itemNames.count {
                let newItem = ShoppingItem(itemName: itemNames[i], hasBeenAdded: false)
                slInitArray.append(newItem)
            }
            UserDefaults.standard.set(true, forKey: "DidInitializeShoppingList")
            return slInitArray
        } else {
            loadFromPersistentStore()
            return self.shoppingList
        }
    }
    
    var shoppingListSelected: [ShoppingItem] {
        var slArray: [ShoppingItem] = []
        for item in shoppingList {
            if item.hasBeenAdded {
                slArray.append(item)
            }
        }
        return slArray
    }
    
    private var persistentFileURL: URL? {
        let fileManager = FileManager.default
        guard let documents = fileManager.urls(for: .documentDirectory, in: .userDomainMask).first else { return nil }
        return documents.appendingPathComponent("shoppingList.plist")
    }
    
    func saveToPersistentStore() {
        guard let url = persistentFileURL else { return }
        
        do {
            let encoder = PropertyListEncoder()
            let data = try encoder.encode(shoppingList)
            try data.write(to: url)
        } catch {
            print("Error saving Shopping List data: \(error)")
        }
    }
    
    func loadFromPersistentStore() {
        let fileManager = FileManager.default
        guard let url = persistentFileURL, fileManager.fileExists(atPath: url.path) else {
            return }
        
//        do {
//            let data = try Data(contentsOf: url)
//            let decoder = PropertyListDecoder()
//            shoppingList = try decoder.decode([ShoppingItem].self, from: data)
//        } catch {
//            print("error loading Shopping List data: \(error)")
//        }
    }
}
