//
//  ShoppingItemController.swift
//  Shopping List
//
//  Created by Isaac Lyons on 9/20/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import Foundation

class ShoppingItemController {
    
    init() {
        loadFromPersistentStore()
        
        if shoppingItems.isEmpty {
            let itemNames = ["Apple", "Grapes", "Milk", "Muffin", "Popcorn", "Soda", "Strawberries"]
            for item in itemNames {
                let shoppingItem = ShoppingItem(name: item, onList: false)
                shoppingItems.append(shoppingItem)
            }
            saveToPersistentStore()
        }
    }
    
    var shoppingItems: [ShoppingItem] = []
    
    var shoppingItemsOnList: [ShoppingItem] {
        return shoppingItems.filter {$0.onList}
    }
    
    var shoppingItemsNotOnList: [ShoppingItem] {
        return shoppingItems.filter {!$0.onList}
    }
    
    var shoppingItemsURL: URL? {
        let fileManager = FileManager.default
        guard let documents = fileManager.urls(for: .documentDirectory, in: .userDomainMask).first else { return nil }
        
        return documents.appendingPathComponent("ShoppingItems.plist")
    }
    
    func saveToPersistentStore() {
        guard let url = shoppingItemsURL else { return }
        let encoder = PropertyListEncoder()
        
        do {
            let shoppingItemsData = try encoder.encode(shoppingItems)
            try shoppingItemsData.write(to: url)
        } catch {
            print("Error saving shopping items data: \(error)")
        }
    }
    
    func loadFromPersistentStore() {
        do {
            guard let url = shoppingItemsURL else { return }
            let data = try Data(contentsOf: url)
            let decoder = PropertyListDecoder()
            let decodedShoppingItems = try decoder.decode([ShoppingItem].self, from: data)
            shoppingItems = decodedShoppingItems
        } catch {
            print("Error loading shopping items data: \(error)")
        }
    }
}
