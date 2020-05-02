//
//  ShoppingListController.swift
//  Shopping List
//
//  Created by Bohdan Tkachenko on 5/2/20.
//  Copyright © 2020 Lambda School. All rights reserved.
//

import Foundation


class ShoppingListController {
    
    let itemName = ["Apple", "Grapes", "Milk", "Muffin", "Popcorn", "Soda", "Strawberries"]
    var shoppingList: [ShoppingItem] = []
    
        var fruitItem : [ShoppingItem] {
            return shoppingList.filter{$0.hasBeenAdded == true}
        }
    
    private var shoppingListURL: URL? {
        let fm = FileManager.default
        guard let documents = fm.urls(for: .documentDirectory, in: .userDomainMask).first else { return nil }
        return documents.appendingPathComponent("ShoppingItem.plist")
    }
    
    func saveToPresistentStore() {
        guard let url = shoppingListURL else { return }
        
        do {
            
            let encoder = PropertyListEncoder()
            let shoppingListData = try encoder.encode(shoppingList)
            try shoppingListData.write(to: url)
            
        } catch {
            print("Error saving")
        }
    }
    
    func loadFromPresistentStore() {
        let fm = FileManager.default
        do {
            guard let url = shoppingListURL, fm.fileExists(atPath: url.path) else { return }
            let shoppingListData = try Data(contentsOf: url)
            let decoder = PropertyListDecoder()
            let decodedShoppingList = try decoder.decode([ShoppingItem].self, from: shoppingListData)
            self.shoppingList = decodedShoppingList
        } catch {
            print("Error loading")
        }
    }
    
    init() {
        loadFromPresistentStore()
        if shoppingList.count == 0 {
            
            for item in itemName {
                shoppingList.append(ShoppingItem(name: item))
            }
            saveToPresistentStore()
        }
    }
    
    
    func addedItem(name: ShoppingItem, hasBeenAdded: Bool) {
        guard let itemIndex = fruitItem.firstIndex(of: name) else { return }
    }
    
}
