//
//  ShoppingListPersistenceExtension.swift
//  Shopping List
//
//  Created by Lisa Sampson on 5/3/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import Foundation

extension ShoppingItemController {
    
    // MARK: - Properties
    var shoppingItemURL: URL? {
        guard let documentsDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first else { return nil }
        let fileName = "Shopping List.plist"
        return documentsDirectory.appendingPathComponent(fileName)
    }
    
    // MARK: - Persistence Methods
    func saveToPersistence() {
        let plistEncoder = PropertyListEncoder()
        do {
            guard let shoppingItem = shoppingItemURL else { return }
            let shoppingItemArray = try plistEncoder.encode(shoppingItems)
            try shoppingItemArray.write(to: shoppingItem)
        } catch let error {
            print("Error trying to save data: \(error)")
        }
    }
    
    func loadFromPersistence() {
        do {
            guard let shoppingItem = shoppingItemURL else { return }
            let shoppingItemArray = try Data(contentsOf: shoppingItem)
            let plistDecoder = PropertyListDecoder()
            let decodedShoppingItems = try plistDecoder.decode([ShoppingItem].self, from: shoppingItemArray)
            self.shoppingItems = decodedShoppingItems
            
        } catch let error {
            print("Error trying to load data: \(error)")
        }
    }
}
