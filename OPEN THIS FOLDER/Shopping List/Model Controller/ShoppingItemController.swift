//
//  ShoppingItemController.swift
//  Shopping List
//
//  Created by Lambda_School_Loaner_141 on 8/16/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import Foundation

class ShoppingItemController {
    var itemNames: [ShoppingItem] = [
        
        ShoppingItem(name: "Apple", imageName: "Apple"),
        ShoppingItem(name: "Grapes", imageName: "Grapes"),
        ShoppingItem(name: "Milk", imageName: "Milk"),
        ShoppingItem(name: "Muffin", imageName: "Muffin"),
        ShoppingItem(name: "Popcorn", imageName: "Popcorn"),
        ShoppingItem(name: "Soda", imageName: "Soda"),
        ShoppingItem(name: "Strawberries", imageName: "Strawberries")
    ]
    let shouldShowShoppingItem = UserDefaults.standard.bool(forKey: String.shouldShowShoppingItemKey)

    private var persistentFileURL: URL? {
        let fileManager = FileManager.default
        guard let documents = fileManager.urls(for: .documentDirectory, in: .userDomainMask).first else {return nil}
        
        return documents.appendingPathComponent("itemNames.plist")
    }
        
    private func saveToPersistentStore() {
        guard let url = persistentFileURL else { return }
        
        do {
            let encoder = PropertyListEncoder()
            let data = try encoder.encode(itemNames)
            try data.write(to: url)
        } catch {
            print("Error saving the itemNames data: \(error)")
        }
    }
    
    private func loadFromPersistentStore() {
        let fileManager = FileManager.default
        guard let url = persistentFileURL, fileManager.fileExists(atPath: url.path) else { return }
        
        do {
            let data = try Data(contentsOf: url)
            let decoder = PropertyListDecoder()
            itemNames = try decoder.decode([ShoppingItem].self, from: data)
        } catch {
            print("Error loading itemNames data: \(error)")
        }
    }

}
