//
//  ShoppingItemController.swift
//  Shopping List
//
//  Created by Jon Bash on 2019-10-18.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import Foundation

class ShoppingItemController {
    // MARK: - Settings
    let itemNames = ["Apple", "Grapes", "Milk", "Muffin", "Popcorn", "Soda", "Strawberries"]
    var itemsListInitialized: Bool {
        // returns false if key not found
        return UserDefaults.standard.bool(forKey: .itemsListInitializedKey)
    }
    
    // MARK: - Properties
    
    var items = [ShoppingItem]()
    var shoppingCart: [ShoppingItem] {
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
    
    // MARK: - Private Methods
    
    private func initializeItemsList() {
        for itemName in itemNames {
            items.append(ShoppingItem(name: itemName, added: false))
        }
        UserDefaults.standard.set(true, forKey: .itemsListInitializedKey)
    }
    
    // MARK: -- Persistence
    
    private var shoppingCartURL: URL? {
        let fm = FileManager.default
        guard let dir = fm.urls(for: .documentDirectory, in: .userDomainMask).first else {
            print("cannot get url; invalid directory")
            return nil
        }
        return dir.appendingPathComponent("ItemList.plist")
    }
    
    private func saveToPersistenceStore() {
        guard let url = shoppingCartURL else {
            print("cannot save; invalid url?")
            return
        }
        
        do {
            let encoder = PropertyListEncoder()
            let cartData = try encoder.encode(shoppingCart)
            try cartData.write(to: url)
        } catch {
            print("Error saving cart data: \(error)")
        }
    }
    
    private func loadFromPersistenceStore() {
        let fm = FileManager.default
        guard let url = shoppingCartURL else {
            print("cannot load; invalid url?")
            return
        }
        if !fm.fileExists(atPath: url.path) {
            print("error loading; cart data file does not yet exist")
        }
        #warning("check this section!")
        do {
            let cartData = try Data(contentsOf: url)
            let decoder = PropertyListDecoder()
            let cart = try decoder.decode([ShoppingItem].self, from: cartData)
            for i in 0..<items.count {
                if cart.contains(where: { $0.name == items[i].name }) {
                    items[i].added = true
                }
            }
        } catch {
            print("Error loading cart data: \(error)")
        }
    }
}

extension String {
    static let itemsListInitializedKey = "ItemsListInitialized"
}
