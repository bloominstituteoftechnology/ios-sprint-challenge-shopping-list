//
//  ShoppingItemController.swift
//  Shopping List
//
//  Created by Breena Greek on 2/21/20.
//  Copyright © 2020 Lambda School. All rights reserved.
//

import Foundation


class ShoppingItemController {

    var shoppingListItems: [ShoppingItem] = []
    var itemSelectedAdd: [ShoppingItem] = []
    
    func toggleItemSelected(shoppingItem: ShoppingItem) {
        guard let index = shoppingListItems.firstIndex(of: shoppingItem) else { return }
        shoppingListItems[index].itemSelected = !shoppingListItems[index].itemSelected
        saveToPersistentStore()
    }

    
    private var persistentFileURL: URL? {
        let documentsDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first
        let fileName = "shoppingItems.plist"
        
        return documentsDirectory?.appendingPathComponent(fileName)
    }
    
    init() {
       createShoppingItem()
        loadFromPersistentStore()
    }
    
    func createShoppingItem() {
        
        guard UserDefaults.standard.bool(forKey: "itemsHaveBeenCreated") != true else { return }
        let itemNames = ["Apple", "Grapes", "Milk", "Muffin", "Strawberries", "Soda", "Popcorn"]
        for itemName in itemNames {
            let item = ShoppingItem(name: itemName)
            shoppingListItems.append(item)
        }
        saveToPersistentStore()
        UserDefaults.standard.set(true, forKey: "itemsHaveBeenCreated")
    }
    
    func saveToPersistentStore() {
        
        guard let url = persistentFileURL else { return }
        
        let plistEncoder = PropertyListEncoder()
        do {
            let data = try plistEncoder.encode(shoppingListItems)
            try data.write(to: url)
        } catch {
            print("Error saving Shopping List: \(error)")
        }
    }
    
    func loadFromPersistentStore() {
        
        let fileManager = FileManager.default
        guard let url = persistentFileURL, fileManager.fileExists(atPath: url.path) else {
            return }
        
        do {
            let data = try Data(contentsOf: url)
            let decoder = PropertyListDecoder()
            self.shoppingListItems = try decoder.decode([ShoppingItem].self, from: data)
            print("\(shoppingListItems)")
            
        } catch {
            print("error loading Shopping List: \(error)")
            
        }
    }
}
