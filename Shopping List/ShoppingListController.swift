//
//  ShoppingListController.swift
//  Shopping List
//
//  Created by conner on 2/21/20.
//  Copyright © 2020 Lambda School. All rights reserved.
//

import Foundation

class ShoppingListController {
    var items: [ShoppingItem] {
        [ShoppingItem(name: "Apple", added: false),
        ShoppingItem(name: "Grapes", added: false),
        ShoppingItem(name: "Milk", added: false),
        ShoppingItem(name: "Muffin", added: false),
        ShoppingItem(name: "Popcorn", added: false),
        ShoppingItem(name: "Soda", added: false),
        ShoppingItem(name: "Strawberries", added: false)]
    }
    
    var persistentFileURL: URL? {
        let fileManager = FileManager.default
        guard let documents = fileManager.urls(for: .documentDirectory, in: .userDomainMask).first else { return nil }

        return documents.appendingPathComponent("shoppingItems.plist")
    }
    
    func saveToPersistentStore() {
        guard let url = persistentFileURL else { return }
        do {
            let encoder = PropertyListEncoder()
            let data = try encoder.encode(items)
            try data.write(to: url)
        } catch {
            print("Error when saving to storage")
        }
    }
    /*
    func loadFromPersistentStore() {
        let fileManager = FileManager.default
        guard let url = persistentFileURL,
            fileManager.fileExists(atPath: url.path) else { return }
        do {
            let data = try Data(contentsOf: url)
            let decoder = PropertyListDecoder()
            items = try decoder.decode([ShoppingItem].self, from: data)
        } catch {
            print("Error when loading from storage")
        }
    }*/
}
