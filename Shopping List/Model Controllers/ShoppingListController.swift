//
//  ShoppingController.swift
//  Shopping List
//
//  Created by Niranjan Kumar on 10/18/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import Foundation

class ShoppingListController {
    
    // MARK: - Properties

    var items: [ShoppingItem] = []
    
    let itemNames = ["Apple", "Grapes", "Milk", "Muffin", "Popcorn", "Soda", "Strawberries"]

    
    init() {
        loadFromPersistenceStore()
        if items.count == 0 {
            for item in itemNames {
            items.append(ShoppingItem(name: item, hasBeenAdded: false))
            saveToPersistentStore()
            }
        }
    }
    
    // MARK: - Methods
    
    func updateItems(item: ShoppingItem) {
        guard let index = items.index(of: item) else { return }
        let hasBeenAdded = item.hasBeenAdded
        items[index].hasBeenAdded = !hasBeenAdded
        saveToPersistentStore()
    }


    
    // MARK: - Persistence
    
    private var shoppingListURL: URL? {
        let fm = FileManager.default
        guard let dir = fm.urls(for: .documentDirectory, in: .userDomainMask).first else { return nil }
        return dir.appendingPathComponent("ShoppingList.plist")
    }
    
     func saveToPersistentStore() {
//        let itemNames = ["Apple", "Grapes", "Milk", "Muffin", "Popcorn", "Soda", "Strawberries"]
//
//        for item in itemNames {
//            items.append(ShoppingItem(name: item, hasBeenAdded: false))
//        }
        guard let url = shoppingListURL else { return }
        
        do {
            let encoder = PropertyListEncoder()
            let shoppingData = try encoder.encode(items)
            try shoppingData.write(to: url)
        } catch {
            print("Error loading shopping item data: \(error)")
            
        }
    }
    
     func loadFromPersistenceStore(){
        guard let url = shoppingListURL else { return }
        do {
            let decoder = PropertyListDecoder()
            let data = try Data(contentsOf: url)
            let decodedItems = try decoder.decode([ShoppingItem].self, from: data)
            items = decodedItems
        } catch {
            print("Error loading shopping item data: \(error)")
        }
    }
    
}
