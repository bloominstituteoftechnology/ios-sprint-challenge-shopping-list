//
//  ShoppingItemController.swift
//  Shopping List
//
//  Created by Bhawnish Kumar on 2/28/20.
//  Copyright © 2020 Lambda School. All rights reserved.
//


import Foundation

class ShoppingItemController {

    private let defaultItemNames = ["Apple", "Grapes", "Milk", "Muffin", "Popcorn", "Soda", "Strawberries"]
    private let onlySavedKey = "onlySavedKey"

    private(set) var newItems: [ShoppingItem] = []

    var itemListURL: URL? {
        FileManager.default
            .urls(for: .documentDirectory, in: .userDomainMask).first?
            .appendingPathComponent("ShoppingItemList.plist")
    }

    var addedItems: [ShoppingItem] {
        newItems.filter { $0.didAdded }
    }

    init() {
        if UserDefaults.standard.bool(forKey: onlySavedKey) {
            loadFromPersistentStore()
        } else {
            for itemName in defaultItemNames {
                let item = ShoppingItem(name: itemName)
            newItems.append(item)
            }
            saveToPersistentStore()
            UserDefaults.standard.set(true, forKey: onlySavedKey)
        }
        
    }

    func loadFromPersistentStore() {
        guard let url = itemListURL else { return }
        do {
            let data = try Data(contentsOf: url)
            newItems = try PropertyListDecoder().decode([ShoppingItem].self, from: data)
        } catch {
            print("Error loading items: \(error)")
        }
    }

    func saveToPersistentStore() {
        guard let url = itemListURL else { return }
        do {
            let itemsData = try PropertyListEncoder().encode(newItems)
            try itemsData.write(to: url)
        } catch {
            print("Error saving items: \(error)")
        }
    }
}

extension ShoppingItemController: ShoppingItemCellDelegate {

    func itemUpdated(item: ShoppingItem) {
        guard let index = newItems.firstIndex(of: item) else { return }
        newItems[index] = item
    }
}
