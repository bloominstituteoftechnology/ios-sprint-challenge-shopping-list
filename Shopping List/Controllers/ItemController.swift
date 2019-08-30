//
//  ItemController.swift
//  Shopping List
//
//  Created by Aaron on 8/18/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import UIKit

class ItemController {
    
    let cell = ShoppingListCollectionViewCell()
    var names = ["Apple", "Grapes", "Milk", "Muffin", "Strawberries", "Popcorn", "Soda"]
    var shoppingItems: [ShoppingItem] = []
    var addedItems: [ShoppingItem] {

        return shoppingItems.filter {$0.addedToList}
    }
    
    init() {
        let userDefaults = UserDefaults.standard
        if userDefaults.bool(forKey: "didCreateItems") {
            loadFromPersistentStore()
        } else { 
            createItems()
        }
    }
    

    func createItems() {
        for name in names {
          shoppingItems.append(ShoppingItem(name: name))
            
        }
        let userDefaults = UserDefaults.standard
        userDefaults.set(true, forKey: "didCreateItems")
        saveToPersistentStore()
    }
    
    func removeShoppingItem() {
        shoppingItems.removeFirst()
    }
    
    func addShoppingItem(item: ShoppingItem) {
            shoppingItems.append(item)
        }

    var shoppingListURL: URL?  {
        
        let userDoc = FileManager.default
        guard let list = userDoc.urls(for: .documentDirectory, in: .userDomainMask).first else { return nil }
        return list.appendingPathComponent("ShoppingList.plist")
        
    }
    
    func saveToPersistentStore() {
        guard let url = shoppingListURL else { return }
        do {
            let encoder = PropertyListEncoder()
            let itemData = try encoder.encode(shoppingItems)
            try itemData.write(to: url)
        } catch {
            print("error saving: \(error)")
        }
        
    }
    
    func loadFromPersistentStore() {
        let userDoc = FileManager.default
        guard let url = shoppingListURL, userDoc.fileExists(atPath: url.path) else { return }
        do {
            let decoder = PropertyListDecoder()
            let itemData = try Data(contentsOf: url)
            let decodedItems = try decoder.decode([ShoppingItem].self, from: itemData)
            shoppingItems = decodedItems
        } catch  {
            print("Cant find Books: \(error)")
        }
    }
    
    
}

extension ItemController: addItemDelegate {
    func itemWasAdded(_ item: ShoppingItem) {
        shoppingItems.append(item)
    }
    
    
}

