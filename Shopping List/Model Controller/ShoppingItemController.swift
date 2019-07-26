//
//  ShoppingItemController.swift
//  Shopping List
//
//  Created by admin on 7/26/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import Foundation

class ShoppingItemController {
    var  items = [ShoppingItem]()
    
    init() {
        loadFromPersistenceStore()
        saveToPersistenceStore()
    }
    
    
    
    let itemNames = ["Apple", "Grapes", "Milk", "Muffin", "Popcorn", "Soda", "Strawberries"]
    
 //   let showItems = UserDefaults.standard.bool(forKey: .showItemsKey)
    
    func saveToPersistenceStore() {
        guard let url = shoppingListURL else { return }
        do {
            let encoder = PropertyListEncoder()
            let itemData = try encoder.encode(items)
            try itemData.write(to: url)
        } catch {
            print("Error loading items data: \(error)")
        }
    }
    
    func createItem(withName item: String, added: Bool ) -> ShoppingItem {
        let item = ShoppingItem(item: item, added: added)
        items.append(item)
        saveToPersistenceStore()
        
        return item
    }
    
    func loadFromPersistenceStore() {
        do {
            guard let url = shoppingListURL else { return }
            let data = try Data(contentsOf: url)
            let decodeItems = PropertyListDecoder()
            items = try decodeItems.decode([ShoppingItem].self, from: data)
        } catch {
            print("Error loading items data: \(error)")
        }
    }
    
    
    
    private var shoppingListURL: URL? {
        let fm = FileManager.default
        guard let dir = fm.urls(for: .documentDirectory, in: .userDomainMask).first else { return nil }
        return dir.appendingPathComponent("ShoppingList.plist")
    }

}
