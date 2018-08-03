//
//  ShoppingItemController.swift
//  Shopping List
//
//  Created by Jeremy Taylor on 8/3/18.
//  Copyright © 2018 Lambda School. All rights reserved.
//

import Foundation

class ShoppingItemController {
    
    private(set) var shoppingItems = [ShoppingItem]()
    
    // MARK: - Data Persistence Methods
    
    private var persistentFileURL: URL? {
        let fm = FileManager.default
        
        guard let documentsDirectory = fm.urls(for: .documentDirectory, in: .userDomainMask).first else { return nil }
        
        return documentsDirectory.appendingPathComponent("shoppingList.plist")
    }
    
    func saveToPersistentStore() {
        guard let url = persistentFileURL else { return }
        
        let encoder = PropertyListEncoder()
        do {
            let data = try encoder.encode(shoppingItems)
            try data.write(to: url)
        } catch {
            NSLog("Couldn't save shopping list data: \(error)")
        }
    }
    
    func loadFromPersistentStore() {
        do {
            let fm = FileManager.default
            guard let url = persistentFileURL, fm.fileExists(atPath: url.path) else { return }
            let data = try Data(contentsOf: url)
            let decoder = PropertyListDecoder()
            let decodedShoppingList = try decoder.decode([ShoppingItem].self, from: data)
            shoppingItems = decodedShoppingList
        } catch {
            NSLog("Couldn't load shopping list data: \(error)")
        }
    }
    
    func create(withImageData imageData: Data, named name: String) {
        let item = ShoppingItem(image: imageData, name: name, addedToList: false)
        shoppingItems.append(item)
        saveToPersistentStore()
    }
    
    func update(withShoppingItem shoppingItem: ShoppingItem, addedToList: Bool) {
        guard let index = shoppingItems.index(of: shoppingItem) else { return }
        
        var tempShoppingItem = shoppingItem
        
        // For now we just toogle if the item is on our shopping list
        tempShoppingItem.addedToList = !tempShoppingItem.addedToList
        shoppingItems.remove(at: index)
        shoppingItems.insert(tempShoppingItem, at: index)
        saveToPersistentStore()
    }
}
