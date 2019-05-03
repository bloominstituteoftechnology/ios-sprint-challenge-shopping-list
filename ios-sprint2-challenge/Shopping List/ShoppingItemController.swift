//
//  ShoppingListController.swift
//  Shopping List
//
//  Created by Ryan Murphy on 5/3/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import Foundation



class ShoppingItemController {
    let myKey = "myKey"
    var shoppingItems: [ShoppingItem]  {
    
    let items =
           [ ShoppingItem(name: "Apple", imageName: "apple", hasBeenAdded: false),
            ShoppingItem(name: "Grapes", imageName: "grapes", hasBeenAdded: false),
            ShoppingItem(name: "Milk", imageName: "milk", hasBeenAdded: false),
            ShoppingItem(name: "Muffin", imageName: "muffin", hasBeenAdded: false),
            ShoppingItem(name: "Popcorn", imageName: "popcorn", hasBeenAdded: false),
            ShoppingItem(name: "Soda", imageName: "soda", hasBeenAdded: false),
            ShoppingItem(name: "Strawberries", imageName: "strawberries", hasBeenAdded: false)
        ]
      return items
        
    }
    init() {
        
        if UserDefaults.standard.bool(forKey: myKey) {
            loadFromPersistentStore()
        } else {
            let itemNames = ["Apple", "Grapes", "Milk", "Muffin", "Popcorn", "Soda", "Strawberries"]
            UserDefaults.standard.set(true, forKey: myKey)
        }
    }
//    func hasBeenSelected(for shoppingItem: ShoppingItem) {
//        guard let itemIndex = shoppingItems.firstIndex(of: shoppingItem) else { return }
//
//        var updatedShoppingItem = shoppingItems[itemIndex]
//
//        switch updatedShoppingItem.hasBeenAdded == false {
//        case true:
//           updatedShoppingItem.hasBeenAdded = true
//        case false:
//            updatedShoppingItem.hasBeenAdded = false
//        }
//    }
    
   
    
    
    var selectedItems: [ShoppingItem] {
        return shoppingItems.filter({ $0.hasBeenAdded == true})
    }
    
    private var shoppingListURL: URL? {
        let fileManager = FileManager.default
        guard let documents = fileManager.urls(for: .documentDirectory, in: .userDomainMask).first else { return nil }
        return documents.appendingPathComponent("shoppingList.plist")
    }
    
    func saveToPersistentStore() {
        
        let encoder = PropertyListEncoder()
        
        do {
            guard let url = shoppingListURL else { return }
            let itemData = try encoder.encode(shoppingItems)
            try itemData.write(to: url)
        } catch { print("Error, \(error)")}
    }
    
    func loadFromPersistentStore() {
        
        let fileManager = FileManager.default
        
        guard let url = shoppingListURL,
            fileManager.fileExists(atPath: url.path)
            else { return }
        
        do {
            let data = try Data(contentsOf: url)
            let decoder = PropertyListDecoder()
            shoppingItems = try decoder.decode([ShoppingItem].self, from: data)
        } catch { print("(Error, \(error))")}
    }
}
