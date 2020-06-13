//
//  shoppingListController.swift
//  Shopping List
//
//  Created by Norlan Tibanear on 6/12/20.
//  Copyright © 2020 Lambda School. All rights reserved.
//

import Foundation


class ShoppingListController {
    
    
    let items: Bool = UserDefaults.standard.bool(forKey: .isAddedKey)
    
    init() {
        if items {
            createInitialShoppingItems()
            UserDefaults.standard.set(true, forKey: .isAddedKey)
        } else {
            loadFromPersistenceStore()
        }
    }
    
    
    let itemNames = [
                    "Apple", "Grapes", "Milk", "Muffin",
                    "Popcorn", "Soda", "Strawberries"
                    ]
    
    var shoppingItems: [ShoppingItem] = []
    
    
    
    
    // Persistence
    var shoppingListURL: URL? {
        let fm = FileManager.default
        guard let dir = fm.urls(for: .documentDirectory, in: .userDomainMask).first else { return nil }
        return dir.appendingPathComponent("ShoppingList.plist")
    }

    func saveToPersistenceStore() {
        guard let url = shoppingListURL else { return }
        do {
            let encoder = PropertyListEncoder()
            let data = try encoder.encode(shoppingItems)
            try data.write(to: url)
        } catch {
            print("Was not able to encode data")
        }
    }
    
    
    func loadFromPersistenceStore() {
        let fm = FileManager.default
        guard let url = shoppingListURL, fm.fileExists(atPath: url.path) else { return }
        
        do {
            let data = try Data(contentsOf: url)
            let decoder = PropertyListDecoder()
            let decoderList = try decoder.decode([ShoppingItem].self, from: data)
            shoppingItems = decoderList
        } catch {
            print("No data was save: \(error)")
        }
        
    }
    
    
    
    
    
    func toggleLabel(product: ShoppingItem) {
        if let index = shoppingItems.firstIndex(of: product) {
            
            var selectItem = shoppingItems[index]
            selectItem.hasBeenAdded.toggle()
            shoppingItems[index] = selectItem
            saveToPersistenceStore()
        }
    }
    
    func createInitialShoppingItems() {
        for item in itemNames {
            let newItem = ShoppingItem(itemName: item, imageString: item)
            shoppingItems.append(newItem)
        }
        saveToPersistenceStore()
    }
    
    
} // END

extension String {
    static let isAddedKey = "isAddedKey"
}
