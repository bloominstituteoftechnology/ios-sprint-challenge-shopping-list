//
//  ShoppingItemController.swift
//  Shopping List
//
//  Created by Stuart on 1/25/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import UIKit

class ShoppingItemController {
    
    // MARK - Initializer
    
//    init() {
//        createItem()
//        loadFromPersistentStore()
//    }
//
//    var shoppingItems = [ShoppingItem]()
//
//    func createItem() {
//        shoppingItems.append(ShoppingItem(name: "apple"))
//        shoppingItems.append(ShoppingItem(name: "grapes"))
//        shoppingItems.append(ShoppingItem(name: "milk"))
//        shoppingItems.append(ShoppingItem(name: "muffin"))
//        shoppingItems.append(ShoppingItem(name: "popcorn"))
//        shoppingItems.append(ShoppingItem(name: "soda"))
//        shoppingItems.append(ShoppingItem(name: "strawberries"))
//    }
//
    func changeStatus(for item: ShoppingItem) {
        guard let index = shoppingItems.index(of: item) else { return }
        
        shoppingItems[index].hasBeenAdded = !shoppingItems[index].hasBeenAdded
    }
    
    private(set) var shoppingItems: [ShoppingItem] = [
        ShoppingItem(name: "apple"),
        ShoppingItem(name: "grapes"),
        ShoppingItem(name: "milk"),
        ShoppingItem(name: "muffin"),
        ShoppingItem(name: "popcorn"),
        ShoppingItem(name: "soda"),
        ShoppingItem(name: "strawberries")
        ]
    
    // MARK: Persistence
    
//    var persistentFileURL: URL? {
//        let fm = FileManager.default
//        guard let documentDir = fm.urls(for: .documentDirectory, in: .userDomainMask).first else { return nil }
//        return documentDir.appendingPathComponent("shoppinglist.plist")
//    }
//    
//    func saveToPersistentStore() {
//        guard let url = persistentFileURL else { return }
//
//        do {
//            let plistEncoder = PropertyListEncoder()
//            let data = try plistEncoder.encode(shoppingItems)
//            try data.write(to: url)
//        } catch {
//            NSLog("Error saving data: \(error)")
//        }
//    }
//
//    func loadFromPersistentStore() {
//        let fm = FileManager.default
//        guard let url = persistentFileURL, fm.fileExists(atPath: url.path) else { return }
//
//        do {
//            let data = try Data(contentsOf: url)
//            let plistDecoder = PropertyListDecoder()
//            shoppingItems = try plistDecoder.decode([ShoppingItem].self, from: data)
//        } catch {
//            NSLog("Error loading data: \(error)")
//        }
//    }
}
