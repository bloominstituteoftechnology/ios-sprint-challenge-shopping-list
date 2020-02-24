//
//  ShoppingController.swift
//  Shopping List
//
//  Created by David Williams on 12/15/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import Foundation

class ShoppingController {
    var items: [Items] {
        
   var item = [
    Items(name: "Apple", imageName: "Apple"),
        Items(name: "Grapes", imageName: "Grapes"),
        Items(name: "Milk", imageName: "Milk"),
        Items(name: "Muffin", imageName: "Muffin"),
        Items(name: "Popcorn", imageName: "Popcorn"),
        Items(name: "Soda", imageName: "Soda"),
        Items(name: "Strawberries", imageName: "Strawberries"),
        ]

        let wasAdded = UserDefaults.standard.bool(forKey: .added)
    return item
    }
    
    
    var shoppingListURL: URL? {
        let fileManager = FileManager.default
        guard let documents = fileManager.urls(for: .documentDirectory, in: .userDomainMask).first else { return nil }
        
        return documents.appendingPathComponent("shoppingList.plist")
    }
    
//    func saveToPersistentStore() {
//        do {
//            guard let url = shoppingListURL else { return }
//            let encoder = PropertyListEncoder()
//            let listsData = try encoder.encode(items)
//            try listsData.write(to: url)
//        } catch {
//            print("Something went wrong: \(error)")
//        }
//    }
    
    func loadFromPersistentStore() {
        do {
            guard let url = shoppingListURL else { return }
            let listsData = try Data(contentsOf: url)
            let decodedLists = PropertyListDecoder()
           // items  = try decodedLists.decode([Items].self, from: listsData)
        } catch {
            print("Something went wrong: \(error)")
        }
    }
    
    
}
