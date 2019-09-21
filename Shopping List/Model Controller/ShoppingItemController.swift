//
//  ShoppingItemController.swift
//  Shopping List
//
//  Created by Jesse Ruiz on 9/20/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import Foundation

class ShoppingItemController {
    
    // MARK: - Properties
    var shoppingList: [ShoppingItem] = []
    let shoppingItems = ["Apple", "Grapes", "Milk", "Muffin", "Popcorn", "Soda", "Strawberries"]
    //    var shoppingItems: [ShoppingItem] = [ShoppingItem(name: "Apple", imageName: "Apple"),
    //                                        ShoppingItem(name: "Grapes", imageName: "Grapes"),
    //                                        ShoppingItem(name: "Milk", imageName: "Milk"),
    //                                        ShoppingItem(name: "Muffin", imageName: "Muffin"),
    //                                        ShoppingItem(name: "Popcorn", imageName: "Popcorn"),
    //                                        ShoppingItem(name: "Soda", imageName: "Soda"),
    //                                        ShoppingItem(name: "Strawberries", imageName: "Strawberries")]
    
    // MARK: - Methods
    func shoppingItemInstance() {
        for item in shoppingItems {
            shoppingList.append(ShoppingItem(name: item, imageName: ))
        }
    }

    
    
    
    // MARK: - Persistence
    private var persistentFileURL: URL? {
        let filemanager = FileManager.default
        guard let documents = filemanager.urls(for: .documentDirectory, in: .userDomainMask).first else { return nil}
        return documents.appendingPathComponent("shoppingItems.plist")
    }

    func saveToPersistentStore() {
        guard let url = persistentFileURL else { return }
        do {
            let encoder = PropertyListEncoder()
            let data = try encoder.encode(shoppingItems)
            try data.write(to: url)
        } catch {
            print("Error saving stars data: \(error)")
        }
    }

    func loadFromPersistentStore() {
        let fileManager = FileManager.default
        guard let url = persistentFileURL,
            fileManager.fileExists(atPath: url.path) else { return }
        do {
            let data = try Data(contentsOf: url)
            let decoder = PropertyListDecoder()
            //shoppingItems = try decoder.decode(ShoppingItem.self, from: data)
        } catch {
            print("Error loading stars data: \(error)")
        }
    }
}
