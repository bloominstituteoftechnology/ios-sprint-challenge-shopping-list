//
//  ShoppingItemController.swift
//  Shopping List
//
//  Created by Scott Bennett on 9/14/18.
//  Copyright © 2018 Lambda School. All rights reserved.
//

import Foundation
class ShoppingItemController {
    
//    private(set) var shoppingItems = [ShoppingItem]()
    
    var shoppingItems: [ShoppingItem] = [
        ShoppingItem(itemName: "apple", addToList: false, imageName: "apple"),
        ShoppingItem(itemName: "grapes", addToList: false, imageName: "grapes"),
        ShoppingItem(itemName: "milk", addToList: false, imageName: "milk"),
        ShoppingItem(itemName: "muffin", addToList: false, imageName: "muffin"),
        ShoppingItem(itemName: "popcorn", addToList: false, imageName: "popcorn"),
        ShoppingItem(itemName: "soda", addToList: false, imageName: "soda"),
        ShoppingItem(itemName: "strawberries", addToList: false, imageName: "strawberries"),
    ]
    
    func toggleAdd(for shoppingItem: ShoppingItem) {
        print(shoppingItem)
//        shoppingItem.addToList = !shoppingItem.addToList
//        shoppingItem.addToList.toggle()

        }
    
//    init() {
//        loadFromPersistentStore()
//    }
//
//    func createItem(withName itemName: String, addToList: String, imageData: Data) {
//        let item = ShoppingItem(itemName: itemName, addedToList: false, imageData: imageData)
//        shoppingItems.append(item)
//    }
//
//
//    // MARK: - Persistence
//
//    func saveToPersistentStore() {
//        guard let url = persistentFileURL else { return }
//
//        do {
//            let encoder = PropertyListEncoder()
//            let data = try encoder.encode(shoppingItems)
//            try data.write(to: url)
//        } catch {
//            NSLog("Error saving stars data: \(error)")
//        }
//    }
//
//    func loadFromPersistentStore() {
//        let fm = FileManager.default
//        guard let url = persistentFileURL,fm.fileExists(atPath: url.path) else { return }
//
//        do {
//            let data = try Data(contentsOf: url)
//            let decoder = PropertyListDecoder()
//            shoppingItems = try decoder.decode([ShoppingItem].self, from: data)
//        } catch {
//            NSLog("Error saving stars data: \(error)")
//        }
//    }
//
//    private var persistentFileURL: URL? {
//        let fm = FileManager.default
//        guard let documentsDir = fm.urls(for: .documentDirectory, in: .userDomainMask).first else { return nil }
//        return documentsDir.appendingPathComponent("Shopping List.plist")
//    }
    
}

extension Bool {
    mutating func toggle() {
        self = !self
    }
}
