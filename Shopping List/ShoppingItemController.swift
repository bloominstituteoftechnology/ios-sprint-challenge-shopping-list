//
//  ShoppingItemController.swift
//  Shopping List
//
//  Created by Victor  on 5/3/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import Foundation
import UIKit

class ShoppingItemController {
    
    var shoppingItems: [ShoppingItem] = []
     let itemNames = ["apple", "grapes", "milk", "muffin", "popcorn", "soda", "strawberries"]
    
    init() {
        let hasRunBefore = UserDefaults.standard.bool(forKey: "hasRunBefore")
        print(hasRunBefore)
        if hasRunBefore {
            print("loaded")
            loadFromPersistentStore()
            print("Loaded")
        } else {
            create()
            print("created")
        }
    }
    
    
    
    func create() {
        for name in itemNames {
            let shoppingItem = ShoppingItem(name: name, title: name)
            shoppingItems.append(shoppingItem)
        }
        UserDefaults.standard.set(true, forKey: "hasRunBefore")
        saveToPersistentStore()
    }
    
    
    func update(shoppingItem: ShoppingItem) {
        guard let index = shoppingItems.index(of: shoppingItem) else {
            print("no index")
            return }
        var item = shoppingItem
        item.isAddedToList = !shoppingItem.isAddedToList
        shoppingItems[index] = item
        saveToPersistentStore()
    }

    
    func saveToPersistentStore() {
        let plistEncoder = PropertyListEncoder()
        do {
            let data = try plistEncoder.encode(shoppingItems)
            guard let shoppingItemsFileURL = shoppingItemsFileURL else { return }
            try data.write(to: shoppingItemsFileURL)
        } catch {
            NSLog("Error enconding shopping items: \(error)")
        }
        
    }
    
    func loadFromPersistentStore() {
        do {
            guard let shoppingItemsFileURL = shoppingItemsFileURL,
                FileManager.default.fileExists(atPath: shoppingItemsFileURL.path) else  { return }
            let data = try Data(contentsOf: shoppingItemsFileURL)
            let plistDecoder = PropertyListDecoder()
            self.shoppingItems = try plistDecoder.decode([ShoppingItem].self, from: data)
        } catch {
            print(error)
        }
    }
    
    
    
    var shoppingItemsFileURL: URL? {
        let documentDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first
        let fileName = "shoppingItems.plist"
        return documentDirectory?.appendingPathComponent(fileName)
    }
    
}
