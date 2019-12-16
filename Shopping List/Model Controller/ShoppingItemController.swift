//
//  ShoppingItemController.swift
//  Shopping List
//
//  Created by David Wright on 12/16/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

//import Foundation
//
//class ShoppingItemController {
//
//    // MARK: - Properties
//
//    var itemList: [ShoppingItem] = []
//
//    // MARK: - Initializer
//
//    init() {
//        let userDefaults = UserDefaults.standard
//        let itemsHaveBeenInitialized = userDefaults.bool(forKey: .itemsHaveBeenInitializedKey)
//
//        if itemsHaveBeenInitialized {
//            loadFromPersistentStore()
//        } else {
//            let itemNames = ["Apple", "Grapes", "Milk", "Muffin", "Popcorn", "Soda", "Strawberries"]
//            var itemList: [ShoppingItem] = []
//
//            for name in itemNames {
//                let item = ShoppingItem(name: name)
//                itemList.append(item)
//            }
//            shoppingList = itemList
//            saveToPersistentStore()
//            userDefaults.set(true, forKey: .itemsHaveBeenInitializedKey)
//        }
//    }
//
//}

//extension String {
//    static var itemsHaveBeenInitializedKey = "ItemsHaveBeenInitialized"
//}
