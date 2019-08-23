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
        let item = ShoppingItem(itemName: item, added: added)
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



//class ShoppingItemController {
//    var shoppingItems: [ShoppingItem] {
//
//        var result = [
//            ShoppingItem(itemName: "Apple",  added: false),
//            ShoppingItem(itemName: "Grapes", added: false),
//            ShoppingItem(itemName: "Milk", added: false),
//            ShoppingItem(itemName: "Muffin", added: false),
//            ShoppingItem(itemName: "Popcorn", added: false),
//            ShoppingItem(itemName: "Soda", added: false),
//            ShoppingItem(itemName: "Strawberries", added: false)
//        ]
////        let itemNames = ["Apple", "Grapes", "Milk", "Muffin", "Popcorn", "Soda", "Strawberries"]
////        let selectItem = UserDefaults.standard.bool(forKey: .addItem)
////        if addItem {
////            result.
//         return result
//        }
//
//    var shoppingList: [ShoppingItem] {
//
//    }
//
//    
//
//
//    private var persistentFileURL: URL? {
//        let fileManager = FileManager.default
//        guard let documents = fileManager.urls(for: .documentDirectory, in: .userDomainMask).first else { return nil }
//
//        return documents.appendingPathComponent("shoppingList.plist")
//    }
//
//    init() {
//        loadFromPersistentStore()
//        saveToPersistentStore()
//
//    }
//
//
//
//
//    @discardableResult func createShoppingList(named itemName: String, withAdded added: Bool ) -> ShoppingItem {
//
//        let shoppingItem = ShoppingItem(itemName: itemName, added: added)
//        shoppingList.append(shoppingItem)
//        saveToPersistentStore()
//        return shoppingItem
//    }
//
//    func saveToPersistentStore() {
//        guard let url = persistentFileURL else { return }
//
//        do {
//            let encoder = PropertyListEncoder()
//            let data = try encoder.encode(shoppingList)
//            try data.write(to: url)
//        } catch {
//            print("Error saving shopping list data: \(error)")
//        }
//    }
//
//    func loadFromPersistentStore() {
//        let fileManager = FileManager.default
//        guard let url = persistentFileURL, fileManager.fileExists(atPath: url.path) else { return }
//
//        do {
//            let data = try Data(contentsOf: url)
//            let decoder = PropertyListDecoder()
//            shoppingList = try decoder.decode([ShoppingItem].self, from: data)
//        } catch {
//            print("Error loading shopping list data: \(error)")
//        }
//    }
//}
