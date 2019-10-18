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
    
    
    // MARK: - Methods
    
    func updateHasBeenAdded(_ item: ShoppingItem) {
        if let index = items.firstIndex(of: item) {
        var item = items[index]
            item.hasBeenAdded.toggle()
            items[index] = item
            saveToPersistentStore()
        }
    }

    
    
    
    
    // MARK: - Persistence
    
    private var shoppingListURL: URL? {
        let fm = FileManager.default
        guard let dir = fm.urls(for: .documentDirectory, in: .userDomainMask).first else { return nil }
        return dir.appendingPathComponent("ShoppingList.plist")
    }
    
     func saveToPersistentStore() {
        let itemNames = ["Apple", "Grapes", "Milk", "Muffin", "Popcorn", "Soda", "Strawberries"]
        
        for item in itemNames {
            items.append(ShoppingItem(name: item, hasBeenAdded: false))
        }
        guard let url = shoppingListURL else { return }
        
        do {
            let encoder = PropertyListEncoder()
            let shoppingData = try encoder.encode(itemNames)
            try shoppingData.write(to: url)
        } catch {
            print("Error loading shopping item data: \(error)")
            
        }
    }
    
     func loadFromPersistenceStore(){
        guard let url = shoppingListURL else { return }
        do {
            let data = try Data(contentsOf: url)
            let decoder = PropertyListDecoder()
            let decodedItems = try decoder.decode([ShoppingItem].self, from: data)
            items = decodedItems
        } catch {
            print("Error loading shopping item data: \(error)")
        }
    }
    
}
