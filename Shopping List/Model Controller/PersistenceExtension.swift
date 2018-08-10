//
//  PersistenceExtension.swift
//  Shopping List
//
//  Created by Lisa Sampson on 8/10/18.
//  Copyright © 2018 Lambda School. All rights reserved.
//

import Foundation

extension ShoppingItemController {
    
    var shoppingItemURL: URL? {
        guard let documentsDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first else { return nil }
        let fileName = "Shopping List.plist"
        return documentsDirectory.appendingPathComponent(fileName)
    }
    
    func saveToPersistence() {
        let plistEncoder = PropertyListEncoder()
        do {
            guard let shoppingItem = shoppingItemURL else { return }
            let shoppingItemArray = try plistEncoder.encode(shoppingItems)
            try shoppingItemArray.write(to: shoppingItem)
        } catch let error {
            print("Error trying to save data! \(error.localizedDescription)")
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
            print("Error trying to save data! \(error.localizedDescription)")
        }
    }
}
