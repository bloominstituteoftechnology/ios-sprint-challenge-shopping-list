//
//  ShoppingItemController.swift
//  Shopping List
//
//  Created by admin on 8/23/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import Foundation
import UIKit


class ShoppingItemController {
    
    var  items: [ShoppingItem] = []
    
    init() {
        createItem()
        loadFromPersistenceStore()
    }
    
    
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
    func createItem() {
        guard UserDefaults.standard.bool(forKey: "ItemsHaveBeenCreated") != true else { return }
        
        let itemNames = ["Apple", "Grapes", "Milk", "Muffin", "Popcorn", "Soda", "Strawberries"]
        
        for name in itemNames {
            let shoppingItem = ShoppingItem(itemName: name)
            items.append(shoppingItem)
        }
        
        saveToPersistenceStore()
    }
    
    func updateHasSeen(forShoppingItem shoppingItem: ShoppingItem) {
        shoppingItem.added = !shoppingItem.added
        saveToPersistenceStore()
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

