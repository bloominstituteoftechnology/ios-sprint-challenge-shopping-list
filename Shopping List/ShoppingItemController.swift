//
//  ShoppingItemController.swift
//  Shopping List
//
//  Created by Gladymir Philippe on 6/12/20.
//  Copyright © 2020 Lambda School. All rights reserved.
//

import Foundation

class ShoppingItemController {
    // MARK: - Settings
    let itemNames = ["Apple", "Grapes", "Milk", "Muffin", "Popcorn", "Soda", "Strawberries"]
    var itemsListInitialized: Bool {
        // returns false if key not found
        return UserDefaults.standard.bool(forKey: .itemsListInitializedKey)
    }
    var name: String {
        if let name = UserDefaults.standard.string(forKey: .nameKey) {
            return name
        } else {
            return ""
        }
    }
    var address: String {
        if let address = UserDefaults.standard.string(forKey: .addressKey) {
            return address
        } else {
            return ""
        }
    }

    // MARK: - Properties
    
    var items = [ShoppingItem]()
    var cart: [ShoppingItem] {
        return items.filter { $0.added }
    }

    init() {
        if !itemsListInitialized {
            initializeItemsList()
            saveToPersistenceStore()
        } else {
            loadFromPersistenceStore()
        }
    }

    // MARK: - Public Methods
    
    func update(item: ShoppingItem, to added: Bool) {
        if let itemIndex = items.firstIndex(where: { $0.name == item.name }) {
            items[itemIndex].added = added
        }
        saveToPersistenceStore()
    }

    func saveDefaults(name: String, address: String) {
        UserDefaults.standard.set(name, forKey: .nameKey)
        UserDefaults.standard.set(address, forKey: .addressKey)
    }

    // MARK: - Private Methods
    
    private func initializeItemsList() {
        let itemNames = ["Apple", "Grapes", "Milk", "Muffin", "Popcorn", "Soda", "Strawberries"]
        for itemName in itemNames {
          let newItemName = ShoppingItem(name: itemName, added: false)
            items.append(newItemName)
        }
        UserDefaults.standard.set(true, forKey: .itemsListInitializedKey)
    }

    // MARK: -- Persistence
    
    private var itemsListURL: URL? {
        let fm = FileManager.default
        guard let dir = fm.urls(for: .documentDirectory, in: .userDomainMask).first else {
            print("cannot get url; invalid directory?")
            return nil
        }
        return dir.appendingPathComponent("ItemList.plist")
    }

    private func saveToPersistenceStore() {
        guard let url = itemsListURL else {
            print("cannot save items list; invalid url?")
            return
        }

        do {
            let encoder = PropertyListEncoder()
            let itemsListData = try encoder.encode(items)
            try itemsListData.write(to: url)
        } catch {
            print("Error saving items list data: \(error)")
        }
    }

    private func loadFromPersistenceStore() {
        let fm = FileManager.default
        guard let url = itemsListURL else {
            print("cannot load; invalid url?")
            return
        }
        if !fm.fileExists(atPath: url.path) {
            print("error loading; items list data file does not yet exist")
        }

        do {
            let itemListData = try Data(contentsOf: url)
            let decoder = PropertyListDecoder()
            items = try decoder.decode([ShoppingItem].self, from: itemListData)
        } catch {
            print("Error loading items list data: \(error)")
        }
    }
}

extension String {
    static let itemsListInitializedKey = "ItemsListInitialized"
    static let nameKey = "Name"
    static let addressKey = "Address"
}
