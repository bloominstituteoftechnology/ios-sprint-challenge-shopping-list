//
//  ShoppingItemController.swift
//  Shopping List
//
//  Created by Chad Parker on 2/21/20.
//  Copyright © 2020 Lambda School. All rights reserved.
//

import Foundation

class ShoppingItemController {

    private let defaultItemNames = ["Apple", "Grapes", "Milk", "Muffin", "Popcorn", "Soda", "Strawberries"]
    private let alreadySavedKey = "alreadySavedKey"

    private(set) var items: [ShoppingItem] = []

    var itemListURL: URL? {
        FileManager.default
            .urls(for: .documentDirectory, in: .userDomainMask).first?
            .appendingPathComponent("ShoppingItemList.plist")
    }

    init() {
        if UserDefaults.standard.bool(forKey: alreadySavedKey) {
            loadFromPersistentStore()
        } else {
            for itemName in defaultItemNames {
                let item = ShoppingItem(name: itemName)
                items.append(item)
            }
            saveToPersistentStore()
            UserDefaults.standard.set(true, forKey: alreadySavedKey)
        }
        // if not run yet
        //   insert default items to array
        //   write to disk
        // else
        //   read from disk
    }

    func loadFromPersistentStore() {
        guard let url = itemListURL else { return }
        do {
            let data = try Data(contentsOf: url)
            items = try PropertyListDecoder().decode([ShoppingItem].self, from: data)
        } catch {
            print("Error loading items: \(error)")
        }
    }

    func saveToPersistentStore() {
        guard let url = itemListURL else { return }
        do {
            let itemsData = try PropertyListEncoder().encode(items)
            try itemsData.write(to: url)
        } catch {
            print("Error saving items: \(error)")
        }
    }
}

extension ShoppingItemController: ShoppingItemCellDelegate {

    func itemWasUpdated(item: ShoppingItem) {
        guard let index = items.firstIndex(of: item) else { return }
        items[index] = item
    }
}
