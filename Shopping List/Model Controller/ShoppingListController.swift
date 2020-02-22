//
//  ShoppingListController.swift
//  Shopping List
//
//  Created by Matthew Martindale on 2/22/20.
//  Copyright © 2020 Lambda School. All rights reserved.
//

import Foundation
import UIKit

class ShoppingListController {
    var shoppingItems: [ShoppingItem] = [
        ShoppingItem(name: "Apple"),
        ShoppingItem(name: "Grapes"),
        ShoppingItem(name: "Milk"),
        ShoppingItem(name: "Muffin"),
        ShoppingItem(name: "Popcorn"),
        ShoppingItem(name: "Soda"),
        ShoppingItem(name: "Strawberries"),
    ]
    
    func addItemToCart(item: ShoppingItem) {
        guard let index = shoppingItems.firstIndex(of: item) else { return }
        shoppingItems[index].hasBeenAddedToCart.toggle()
        saveToPersistentStore()
    }

    func getAddedItems() -> [ShoppingItem] {
        return shoppingItems.filter{$0.hasBeenAddedToCart == true}
    }
    
    //MARK: - CRUD
    private var persistentFileURL: URL? {
        let fileManager = FileManager.default
        guard let documents = fileManager.urls(for: .documentDirectory, in: .userDomainMask).first
            else { return nil }
        
        return documents.appendingPathComponent("shoppingList.plist")
    }
    
    init() {
        loadFromPersistentStore()
        print(shoppingItems)
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
        guard let url = persistentFileURL, fileManager.fileExists(atPath: url.path) else { return }
        
        do {
            let data = try Data(contentsOf: url)
            let decoder = PropertyListDecoder()
            shoppingItems = try decoder.decode([ShoppingItem].self, from: data)
        } catch {
            print("Error loading stars data: \(error)")
        }
    }
}
