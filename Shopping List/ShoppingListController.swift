//
//  ShoppingListController.swift
//  Shopping List
//
//  Created by Craig Belinfante on 6/14/20.
//  Copyright © 2020 Lambda School. All rights reserved.
//

import UIKit

class ShoppingListController {
    
    
    let itemNames = ["Apple", "Grapes", "Milk", "Muffin", "Popcorn", "Soda", "Strawberries"]
    
    init() {
        loadFromPersistentStore()
        if shoppingList.count == 0 {
            for item in itemNames {
                let nItem = ShoppingList(name: item, imageName: item, itemAdded: false)
                shoppingList.append(nItem)
            }
        }
    }
    
    var shoppingList: [ShoppingList] = [] {
        didSet {
            updateViews()
        }
    }
    
    var shoppingListURL: URL? {
        let fileManager = FileManager.default
        let documentsDirectory = fileManager.urls(for: .documentDirectory, in: .userDomainMask).first
        let shoppingListURL = documentsDirectory?.appendingPathComponent("ShoppingListURL.plist")
        return shoppingListURL
    }
    
    
    
    func saveToPersistentStore () {
        do {
            let encoder = PropertyListEncoder()
            let data = try encoder.encode(itemNames)
            try data.write(to: shoppingListURL!)
        } catch {
            print("Error")
        }
    }
    
    func loadFromPersistentStore () {
        do {
            let decoder = PropertyListDecoder()
            let data = try Data(contentsOf: shoppingListURL!)
            shoppingList = try decoder.decode([ShoppingList].self, from: data)
        } catch {
            print("Persistent Error")
        }
    }
    
    func addedItem(item: ShoppingList) {
        guard let index: Int = shoppingList.firstIndex(of: item) else {return}
        
        shoppingList.remove(at: index)
        saveToPersistentStore()
    }
    
    func cartItems() -> Int {
        var count = 0
        for cartItems in shoppingList {
            if cartItems.itemAdded {
                count += 1
            }
        }
        return count
    }
    
    func updateViews() {
        _ = shoppingList
    }
    
}

