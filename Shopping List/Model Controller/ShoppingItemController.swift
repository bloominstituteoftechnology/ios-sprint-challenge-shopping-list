//
//  ShoppingItemController.swift
//  Shopping List
//
//  Created by Bree Jeune on 2/29/20.
//  Copyright © 2020 Lambda School. All rights reserved.
//

import Foundation


class ShoppingItemController {
    
    struct PropertyKeys {
        static let existKey = "itemsExistKey"
    }
    
    
    var shoppingItems: [ShoppingItem] = []
    let itemsExist = UserDefaults.standard.bool(forKey: PropertyKeys.existKey)
    var addedShoppingItems: [ShoppingItem] {
        return shoppingItems.filter { $0.hasBeenAdded }
}

    var notAddedShoppingItems: [ShoppingItem] {
        return shoppingItems.filter { $0.hasBeenAdded == false }
    }
    
    func itemAddedToggled(for item: ShoppingItem) {
        guard let index = shoppingItems.firstIndex(of: item) else { return }

        shoppingItems[index].hasBeenAdded.toggle()
    }
    
        func fetchItems() {
            if itemsExist {
                loadFromPersistentStore()
            } else {
                createItems()
                saveToPersistentStore()
                UserDefaults.standard.set(true, forKey: PropertyKeys.existKey)
            }
        }
    
    func createItems() {
        let itemNames = ["Apple", "Grapes", "Milk", "Muffin", "Popcorn", "Soda", "Strawberries"]
        for itemName in itemNames {
            let item = ShoppingItem(item: itemName)
            shoppingItems.append(item)
        }
    }
    
    private var persistentFileURL: URL? {
        let fileManager = FileManager.default
        guard let directory = fileManager.urls(for: .documentDirectory, in: .userDomainMask).first else { return nil }
        return directory.appendingPathComponent("shoppingList-items.plist")
    }
    
    private func saveToPersistentStore() {
        guard let url = persistentFileURL else { return }

        do {
            let encoder = PropertyListEncoder()
            let data = try encoder.encode(shoppingItems)
            try data.write(to: url)
        } catch {
            print("Error saving shopping items")
        }
    }
    
        private func loadFromPersistentStore() {
            let fileManager = FileManager.default
            guard let url = persistentFileURL,
                fileManager.fileExists(atPath: url.path) else { return }

            do{
                let data = try Data(contentsOf: url)
                let decoder = PropertyListDecoder()
                shoppingItems = try decoder.decode([ShoppingItem].self, from: data)
            } catch {
                print("Error loading shopping items")
            }
        }

}
