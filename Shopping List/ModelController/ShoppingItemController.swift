//
//  ShoppingItemController.swift
//  Shopping List
//
//  Created by admin on 8/23/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import Foundation
import UIKit

class ShoppingItemController {
    var shoppingItems: [ShoppingItem] {
        
        var result = [
            ShoppingItem(itemName: "Apple", imageName: "Apple", added: false),
            ShoppingItem(itemName: "Grapes", imageName: "Grapes", added: false),
            ShoppingItem(itemName: "Milk", imageName: "Milk", added: false),
            ShoppingItem(itemName: "Muffin", imageName: "Muffin", added: false),
            ShoppingItem(itemName: "Popcorn", imageName: "Popcorn", added: false),
            ShoppingItem(itemName: "Soda", imageName: "Soda", added: false),
            ShoppingItem(itemName: "Strawberries", imageName: "Strawberries", added: false)
        ]
        
//        let selectItem = UserDefaults.standard.bool(forKey: .addItem)
//        if addItem {
//            result.
        }
        
        return result
    }
    
    var shoppingList: [ShoppingItem] = [] {
        
    }
    
    private var persistentFileURL: URL? {
        let fileManager = FileManager.default
        guard let documents = fileManager.urls(for: .documentDirectory, in: .userDomainMask).first else { return nil }
        
        return documents.appendingPathComponent("shoppingList.plist")
    }
    
    init() {
        loadFromPersistentStore()
    }
    
    @discardableResult func createShoppingList(named itemName: String, withImage imageName: String, withAdded added: Bool ) -> ShoppingItem {
        
        let shoppingItem = ShoppingItem(itemName: itemName, imageName: imageName, added: added)
        shoppingList.append(shoppingItem)
        saveToPersistentStore()
        return shoppingItem
    }
    
    func saveToPersistentStore() {
        guard let url = persistentFileURL else { return }
        
        do {
            let encoder = PropertyListEncoder()
            let data = try encoder.encode(shoppingList)
            try data.write(to: url)
        } catch {
            print("Error saving shopping list data: \(error)")
        }
    }
    
    func loadFromPersistentStore() {
        let fileManager = FileManager.default
        guard let url = persistentFileURL, fileManager.fileExists(atPath: url.path) else { return }
        
        do {
            let data = try Data(contentsOf: url)
            let decoder = PropertyListDecoder()
            shoppingList = try decoder.decode([ShoppingItem].self, from: data)
        } catch {
            print("Error loading shopping list data: \(error)")
        }
    }
}
