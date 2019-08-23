//
//  ShoppingItem.swift
//  Shopping List
//
//  Created by Lambda_School_Loaner_167 on 8/23/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import Foundation

struct shoppingItem:Encodable {
    var nameOfShoppingItems: [String] = ["Apples", "Grapes", "Milk", "Popcorn", "Soda",  "Strawberries"]
    var addedShoppingItems: Bool

    let userDefaults = UserDefaults.standard.bool(forKey: "addedShoppingItems")
    
}
// MARK: - Private Functions
    private func loadFromPersistentStore() {
        
        do {
            guard let fileURL = shoppingListURL else { return }
            let shoppingListData = try Data(contentsOf: fileURL)
            let plistDecoder = PropertyListDecoder()
            shoppinglistItems = try plistDecoder.decode([shoppinglistItems].self, from: shoppingListData.data)
        } catch {
            NSLog("Error decoding items from property list: \(error)")
        }
}

            private func saveToPersistentStore() {
                let plistEncoder = PropertyListEncoder()
                do {
                let shoppingListData = try plistEncoder.encode(shoppingItem.init(nameOfShoppingItems: ["Apples", "Grapes", "Milk", "Popcorn", "Soda",  "Strawberries"], addedShoppingItems: false))
                guard let fileURL = shoppingListURL else { return }
        
                    try shoppingListData.write(to: fileURL)
                } catch {
                    NSLog("Error encoding items to property list: \(error)")
    }
}
//  MARK: - Properties

private var shoppingListURL: URL? {
    let documentDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first
    
    let fileName = "ShoppingList.plist"
    
    return documentDirectory?.appendingPathComponent(fileName)
}

    private(set) var shoppinglistItems: [shoppingItem] = []

var unaddedItems: [shoppingItem] {
    return shoppinglistItems.filter({ $0.addedShoppingItems == false })
}

var addedItems: [shoppingItem] {
    return shoppinglistItems.filter({$0.addedShoppingItems})
}
