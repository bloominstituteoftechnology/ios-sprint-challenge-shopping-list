//
//  ShoppingItemController.swift
//  Shopping List
//
//  Created by Percy Ngan on 7/26/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import Foundation

class ShoppingItemController {
    
    //var itemNames: [ShoppingItem] = ["Apples", "Grapes", "Milk", "Muffin", "Popcorn", "Soda", "Strawberries"]
    
    var shoppingListURL: URL? {
        let fm = FileManager.default
        guard let dir = fm.urls(for: .documentDirectory, in: .userDomainMask).first
            else { return nil }
        return dir.appendingPathComponent("shoppingList.plist")
    }
    
//    init() { loadFromPersistentStorage()}

//    var shoppingList: [ShoppingItem] {
//        var result: [ShoppingItem] = []
//        for index in 0..<itemNames.count {
//            let item = ShoppingItem(from: itemNames[index])
//            result.append(item)
//        }
//
//        return result
//    }
    
    
//    func saveToPersistentStore() {
//        guard let url = shoppingListURL else { return }
//        let encoder = PropertyListEncoder()
//        do {
//            let data = try encoder.encode(shoppingList)
//            try data.write(to: url)
//        } catch {
//            print("Error saving shopping list data: \(error)")
//        }
//    }
    
//    func loadFromPersistentStorage() {
//        let fm = FileManager.default
//        guard let url = shoppingListURL, fm.fileExists(atPath: url.path) else { return }
//        do {
//            let data = try Data (contentsOf: url)
//            let decoder = PropertyListDecoder()
//            itemNames = try decoder.decode([ShoppingItem].self, from: data)
//        }
//        catch {
//            print("Error loading data.")
//        }
//    }
    
    
}
