//
//  ShoppingModelController.swift
//  Shopping List
//
//  Created by Nonye on 4/24/20.
//  Copyright © 2020 Lambda School. All rights reserved.
//

import UIKit

class ShoppingController {
    
    let itemNames = ["Apple", "Grapes", "Milk", "Muffin", "Popcorn", "Soda", "Strawberries"]
    var shoppingList: [ShoppingList] = []
    
    
    
    var foodItems: [ShoppingList] {
        return shoppingList.filter{ $0.addedItem == true }
    }
    
    private var shoppingListURL: URL? {
        let fileManager = FileManager.default
        guard let documents = fileManager.urls(for: .documentDirectory, in: .userDomainMask).first else { return nil }
        return documents.appendingPathComponent("ShoppingList.plist")
    }
    
    func saveToPresistentStore() {
        guard let url = shoppingListURL  else { return }
        
        do {
            let encoder = PropertyListEncoder()
            let shoppingListData = try encoder.encode(shoppingList)
            try shoppingListData.write(to: url)
        } catch {
            print("Error saving shopping list")
        }
    }
    func loadFromPersistentStore() {
        let fileManager = FileManager.default
        do {
            guard let url = shoppingListURL, fileManager.fileExists(atPath: url.path) else { return }
            let shoppingListData = try Data(contentsOf: url)
            let decoder = PropertyListDecoder()
            let decodedShoppingList = try decoder.decode([ShoppingList].self, from: shoppingListData)
            
        } catch {
            print("error loading shopping list")
        }
    }
    
    init() {
        loadFromPersistentStore()
        if shoppingList.count == 0 {
            for name in itemNames {
                shoppingList.append(ShoppingList(itemName: name))
            }
            saveToPresistentStore()
        }
    }
    
    func addedItems(itemName: ShoppingList, addedItem: Bool) {
        guard let itemIndex = foodItems.firstIndex(of: itemName) else { return }
        
    }
    
}






