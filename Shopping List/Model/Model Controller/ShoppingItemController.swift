//
//  ShoppingItemController.swift
//  Shopping List
//
//  Created by Breena Greek on 2/21/20.
//  Copyright © 2020 Lambda School. All rights reserved.
//

import Foundation


class ShoppingItemController {
    var shoppingList: [ShoppingItem] = []
    var itemSelected = UserDefaults.standard.bool(forKey: .shoppingListKey)
    var itemNames = ["Apples", "Grapes", "Milk", "Muffin", "Popcorn", "Soda", "Strawberries"]


private var persistentFileURL: URL? {
    let fileManager = FileManager.default
    guard let documents = fileManager.urls(for: .documentDirectory, in: .userDomainMask).first else { return nil }
    
    return documents.appendingPathComponent("shoppingList.plist")
}

    init() {
    saveToPersistentStore()
    }


func saveToPersistentStore() {
    
    guard let url = persistentFileURL else { return }
    
    do {
        let encoder = PropertyListEncoder()
        let data = try encoder.encode(shoppingList)
        try data.write(to: url)
    } catch {
        print("Error saving Shopping List: \(error)")
    }
}

func loadFromPersistentStore() {
    
    let fileManager = FileManager.default
    guard let url = persistentFileURL, fileManager.fileExists(atPath: url.path) else {
        return }
    
    do {
        let data = try Data(contentsOf: url)
        let decoder = PropertyListDecoder()
        shoppingList = try decoder.decode([ShoppingItem].self, from: data)
        
    } catch {
        print("error loading Shopping List: \(error)")
        
        }
    }
}
