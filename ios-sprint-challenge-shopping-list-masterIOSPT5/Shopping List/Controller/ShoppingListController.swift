//
//  ShoppingListController.swift
//  Shopping List
//
//  Created by David Williams on 2/23/20.
//  Copyright © 2020 Lambda School. All rights reserved.
//

import Foundation

class ShoppingController {
    var itemNames: [Items] = []
    init() {
        saveArray()
        loadFromPersistentStore()
    }
    
    var items: [Items] {
        
        let item = [
            Items(name: "Apple"),//, wasAdded: false),
            Items(name: "Grapes"),//, wasAdded: false),
            Items(name: "Milk"),//, wasAdded: false),
            Items(name: "Muffin"),//, wasAdded: false),
            Items(name: "Popcorn"),//,  wasAdded: false),
            Items(name: "Soda"),//,  wasAdded: false),
            Items(name: "Strawberries"),//, wasAdded: false),
        ]
        
        _ = UserDefaults.standard.bool(forKey: .added)
        return item
    }

    func saveArray() {
        for item in items {
            itemNames.append(item)
            saveToPersistentStore()
        }
    }
    
    
    var shoppingListURL: URL? {
        let fileManager = FileManager.default
        guard let documents = fileManager.urls(for: .documentDirectory, in: .userDomainMask).first else { return nil }
        
        return documents.appendingPathComponent("shoppingList.plist")
    }
    
    func saveToPersistentStore() {
        do {
            guard let url = shoppingListURL else { return }
            let encoder = PropertyListEncoder()
            let listsData = try encoder.encode(itemNames)
            try listsData.write(to: url)
        } catch {
            print("Something went wrong: \(error)")
        }
    }
    
    func loadFromPersistentStore() {
        do {
            guard let url = shoppingListURL else { return }
            let listsData = try Data(contentsOf: url)
            let decodedLists = PropertyListDecoder()
            itemNames  = try decodedLists.decode([Items].self, from: listsData)
        } catch {
            print("Something went wrong: \(error)")
        }
    }
}
