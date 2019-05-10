//
//  ShoppingItemController.swift
//  Shopping List
//
//  Created by Jordan Davis on 5/10/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import Foundation
import UIKit

let myKey = "myKey"

class ShoppingItemController {
    
    init() {
        if UserDefaults.standard.bool(forKey: myKey) {
            loadFromPersistentStore()
        } else {
            let itemNames = ["Apple", "Grapes", "Milk", "Muffin", "Popcorn", "Soda", "Strawberries"]
            for itemName in itemNames {
                let item = ShoppingItem(name: itemName, imageName: itemName, isOnList: true)
                shoppingItems.append(item)
            }
    
            UserDefaults.standard.set(true, forKey: myKey)
        }
    }
    
    //MARK: -Functions
    
    func createShoppingItem(name: String, imageName: String) {
        let shoppingItem = ShoppingItem(name: name, imageName: imageName, isOnList: false)
        shoppingItems.append(shoppingItem)
        saveToPersistentStore()
    }
    
    func update(shoppingItem: ShoppingItem) {
        guard let index = shoppingItems.firstIndex(of: shoppingItem) else { return }
        shoppingItems[index].isOnList = !shoppingItems[index].isOnList
        saveToPersistentStore()
    }
    
    
    //MARK: -Persistence
    
    func saveToPersistentStore() {
        guard let url = shoppingListURL else { return }
        
        let encoder = PropertyListEncoder()
        do {
            let itemData = try encoder.encode(shoppingItems)
            try itemData.write(to: url)
        } catch {
            print(error)
        }
    }
    
    func loadFromPersistentStore() {
        guard let url = shoppingListURL,
            FileManager.default.fileExists(atPath: url.path) else { return }
        
        let decoder = PropertyListDecoder()
        do {
            let data = try Data(contentsOf: url)
            let decodedShoppingItems = try decoder.decode([ShoppingItem].self, from: data)
            shoppingItems = decodedShoppingItems
        } catch {
            print("Error decoding data: \(error)")
        }
    }
    
    //MARK: -Properties
    
    private var shoppingListURL: URL? {
        let fileManager = FileManager.default
        guard let documentsDirectory = fileManager.urls(for: .documentDirectory, in: .userDomainMask).first else { return nil }
        
        let finalURL = documentsDirectory.appendingPathComponent("shoppingList.plist")
        return finalURL
    }
    
    var shoppingItems: [ShoppingItem] = []
}

extension UIImage {
    func imageName() -> String? {
        let data: Data? = self.pngData()
        return data?.base64EncodedString(options: .endLineWithLineFeed)
    }
}
