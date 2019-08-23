//
//  File.swift
//  Shopping List
//
//  Created by Ciara Beitel on 8/23/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import Foundation
import UIKit

class ShoppingItemController {
    var shoppingItems: [ShoppingItem] = []
    
    private var persistentFileURL: URL? {
        let fileManager = FileManager.default
        guard let documentDirectory = fileManager.urls(for: .documentDirectory, in: .userDomainMask).first else { return nil }
        return documentDirectory.appendingPathComponent("shoppingItems.plist")
    }
    
    init() {
        loadFromPersistentStore()

        let shoppingList = [
            ShoppingItem(itemName: "Apple", addedToList: false, image: "Apple"),
            ShoppingItem(itemName: "Grapes", addedToList: false, image: "Grapes"),
            ShoppingItem(itemName: "Milk", addedToList: false, image: "Milk"),
            ShoppingItem(itemName: "Muffin", addedToList: false, image: "Muffin"),
            ShoppingItem(itemName: "Popcorn", addedToList: false, image: "Popcorn"),
            ShoppingItem(itemName: "Soda", addedToList: false, image: "Soda"),
            ShoppingItem(itemName: "Strawberries", addedToList: false, image: "Strawberries")
        ]
        
        let shouldAddItem = UserDefaults.standard.bool(forKey: "ShouldAddItem")
        if !shouldAddItem {
            shoppingItems.append(contentsOf: shoppingList)
        }
    }
    
    private func saveToPersistentStore() {
        guard let url = persistentFileURL else { return }
        do {
            let encoder = PropertyListEncoder()
            let data = try encoder.encode(shoppingItems)
            try data.write(to: url)
        } catch {
            NSLog("Error saving shopping items data: \(error)")
        }
    }
    
    private func loadFromPersistentStore() {
        let fileManager = FileManager.default
        guard let url = persistentFileURL, fileManager.fileExists(atPath: url.path)
            else { return }
        do {
            let data = try Data(contentsOf: url)
            let decoder = PropertyListDecoder()
            shoppingItems = try decoder.decode([ShoppingItem].self, from: data)
        } catch {
            NSLog("Error loading shopping items data: \(error)")
        }
    }
}
