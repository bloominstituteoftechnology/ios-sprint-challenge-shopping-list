//
//  ShoppingList.swift
//  Shopping List
//
//  Created by Lambda_School_Loaner_167 on 8/24/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import Foundation
import UIKit


class ShoppingListController {
    
    
     var nameOfShoppingItems: [String] = ["Apples", "Grapes", "Milk", "muffin", "Popcorn", "Soda",  "Strawberries"]
    
    var shoppingListItem: [ShoppingListItems] = []
    
    init() {
        loadFromPersistentStore()
        for name in nameOfShoppingItems {
            let item = ShoppingListItems(name: name)
            shoppingListItem.append(item)
        }
    }
    
    
     func loadFromPersistentStore() {
        let fm = FileManager.default
        guard let url = shoppingListURL else {return}
        fm.fileExists(atPath: url.path)
    
        do {
            let decoder = PropertyListDecoder()
            let data = try Data(contentsOf: url)
            shoppinglistItems = try decoder.decode([shoppingItem].self, from: data)
        } catch {
            print("Error loading List data: \(error)")
        }
    }
    private func saveToPersistentStore() {
        guard let url = shoppingListURL else { return }
        do {
            let encoder = PropertyListEncoder()
            let data = try encoder.encode(shoppinglistItems)
            try data.write(to: url)
        } catch {
            NSLog("Error saving Shopping List Data: \(error)")
        }
    }
    
    private var shoppingListURL: URL? {
        let documentDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first
        let fileName = "ShoppingList.plist"
        return documentDirectory?.appendingPathComponent(fileName)
    }
        var shoppinglistItems: [shoppingItem] = []
    var unaddedItems: [shoppingItem] {
        return shoppinglistItems.filter({ $0.addedShoppingItems == false })
    }
    var addedItems: [shoppingItem] {
        return shoppinglistItems.filter({$0.addedShoppingItems == true})
    }
    

}
