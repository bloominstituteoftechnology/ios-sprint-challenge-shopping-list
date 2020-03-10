//
//  ShoppingItemController.swift
//  Shopping List
//
//  Created by J-Skenandore on 2/24/20.
//  Copyright © 2020 Lambda School. All rights reserved.
//

import Foundation

class ShoppingItemController {
    var itemNames: [ShoppingItem] {
        var itemNames = [
    
        ShoppingItem(name: "Apple", imageName: "Apple"),
        ShoppingItem(name: "Grapes", imageName: "Grapes"),
        ShoppingItem(name: "Milk", imageName: "Milk"),
        ShoppingItem(name: "Muffin", imageName: "Muffin"),
        ShoppingItem(name: "Popcorn", imageName: "Popcorn"),
        ShoppingItem(name: "Soda", imageName: "Soda"),
        ShoppingItem(name: "Strawberries", imageName: "Strawberries")
        ]
    
        if UserDefaults.standard.bool(forKey: .shouldShowShoppingItem){
            itemNames.append(ShoppingItem(name: String, imageName: String))
        }
        
        return itemNames
    }
    
    private var persistentFileURL: URL? {
        let fileManager = FileManager.default
        guard let documents = fileManager.urls(for: .documentDirectory, in: .userDomainMask).first else { return nil }
        
        return documents.appendingPathComponent("itemNames.plist")
    }
    
    init() {
        loadFromPersistentStore()
    }
    
    @discardableResult func createShoppingItem(named name: String, nameOfImage imageName: String) -> ShoppingItem {
        let shoppingItem = ShoppingItem(name: name, imageName: imageName)
        itemNames.append(shoppingItem)
        saveToPersistentStore()
        return shoppingItem
    }
    
    func saveToPersistentStore() {
        guard let url = persistentFileURL else { return }
        
        do {
            let encoder = PropertyListEncoder()
            let data = try encoder.encode(itemNames)
            try data.write(to: url)
        } catch {
            print("Error saving Shopping Items data: \(error)")
        }
    }
}
