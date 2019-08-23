//
//  ShoppingItem.swift
//  Shopping List
//
//  Created by Lambda_School_Loaner_167 on 8/23/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import Foundation

struct shoppingItem: Codable {
    var nameOfShoppingItems: [String] = ["Apples", "Grapes", "Milk", "Popcorn", "Soda",  "Strawberries"]
    var addedShoppingItems: Bool

    let userDefaults = UserDefaults.standard.bool(forKey: "addedShoppingItems")
    
}

private func saveToPersistentStore() {
    let plistEncoder = PropertyListEncoder()
    
    do {
        let shoppingListData = try plistEncoder.encode(shoppingItems)
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

private(set) var shoppingItems: [shoppingItem] = nameOfShoppingItems
