//
//  ShoppingLIstController.swift
//  Shopping List
//
//  Created by Claudia Contreras on 2/21/20.
//  Copyright © 2020 Lambda School. All rights reserved.
//

import Foundation


class ShoppingListController {

    var shoppingItems: [ShoppingItem] = []
    
    let itemNames = ["Apple", "Grapes", "Milk", "Muffin", "Popcorn", "Soda", "Strawberries"]
    
    var hasData: Bool {
        let setting = UserDefaults.standard.bool(forKey: .isFirstRunKey)
        
        if !setting {
            return false
        }
        
        return true
        
    }
    var addedItems: [ShoppingItem] {
        let added = shoppingItems.filter( { return $0.addedToShoppingList })
        return added
    }
    var notAddedItems: [ShoppingItem] {
        let notAdded = shoppingItems.filter( { return !$0.addedToShoppingList} )
        return notAdded
    }
    
    var numberOfItemsAdded: Int {
        let filtered = shoppingItems.filter { return $0.addedToShoppingList }
        return filtered.count
    }
    
    init() {
        if !hasData {
            for item in itemNames {
                createShoppingItem(name: item, addedToShoppingList: false)
            }

            UserDefaults.standard.set(true, forKey: .isFirstRunKey)

        } else {
          loadFromPersistentStore()
        }


    }

    var persistentFileURL: URL? {
        let fileManager = FileManager.default

        guard let documentsDirectory = fileManager.urls(for: .documentDirectory, in: .userDomainMask).first else { return nil }

        let shoppingItemURL = documentsDirectory.appendingPathComponent("shoppingItems.plist")

        return shoppingItemURL

    }

    func saveToPersistentStore() {
        guard let fileURL = persistentFileURL else { return }

        do {
            let encoder = PropertyListEncoder()
            let data = try encoder.encode(shoppingItems)
            try data.write(to: fileURL)


        } catch {
            print(error)
        }

    }

    func loadFromPersistentStore() {
        guard let fileURL = persistentFileURL else { return }

        do {

            let decoder = PropertyListDecoder()

            let propertyListData = try Data(contentsOf: fileURL)
            let data = try decoder.decode([ShoppingItem].self, from: propertyListData)

            shoppingItems = data


        } catch {
            print(error)
        }

    }

    func createShoppingItem(name: String, addedToShoppingList: Bool) {
        let shoppingItem = ShoppingItem(name: name, addedToShoppingList: addedToShoppingList)
        shoppingItems.append(shoppingItem)
        saveToPersistentStore()
    }

    func toggleHasBeenAdded(for item: ShoppingItem) {
        if let shoppingItemIndex = shoppingItems.firstIndex(of: item) {
            var shoppingItem = shoppingItems[shoppingItemIndex]
            shoppingItem.addedToShoppingList.toggle()
            shoppingItems[shoppingItemIndex] = shoppingItem
            saveToPersistentStore()

        }

    }
}

extension String {
    static let isFirstRunKey = "ShoppingListIsFirstRunKey"
}
