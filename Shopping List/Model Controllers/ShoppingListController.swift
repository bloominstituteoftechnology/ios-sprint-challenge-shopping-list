//
//  ShoppingListController.swift
//  Shopping List
//
//  Created by Alex Shillingford on 6/14/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import Foundation

class ShoppingList {
    //MARK: - Properties
    let itemNames = ["Apple", "Grapes", "Milk", "Muffin", "Popcorn", "Soda", "Strawberries"]
    var list: [ShoppingItem] {
        let result = [
            ShoppingItem(name: itemNames[0], imageName: itemNames[0]),
            ShoppingItem(name: itemNames[1], imageName: itemNames[1]),
            ShoppingItem(name: itemNames[2], imageName: itemNames[2]),
            ShoppingItem(name: itemNames[3], imageName: itemNames[3]),
            ShoppingItem(name: itemNames[4], imageName: itemNames[4]),
            ShoppingItem(name: itemNames[5], imageName: itemNames[5]),
            ShoppingItem(name: itemNames[6], imageName: itemNames[6]),
        ]
        
        return result
    }
    
    private var persistenFileURL: URL? {
        let fileManager = FileManager.default
        
        // Creates "/Users/shillwil/Documents" - documents directory path
        guard let documents = fileManager.urls(for: .documentDirectory, in: .userDomainMask).first
            else {
                return nil
        }
        
        // Creates "/Users/shillwil/Documents/stars.plist" - full file path
        return documents.appendingPathComponent("itemNames.plist")
    }
    
    // MARK: - Encoder/Decoder methods
//    func saveToPersistentStore() {
//        guard let url = persistenFileURL else { return }
//        // whenever you option click on a method like '.encode()' anything that "throws" an error you need to 'try' in a do block, and have a 'catch' block readied up in case an error is thrown
//        do {
//            let encoder = PropertyListEncoder()
//            let data = try encoder.encode(itemNames)
//            try data.write(to: url)
//        } catch {
//            print("Error saving shopping list data: \(error)")
//        }
//
//    }
//
//    func loadFromPersistentStore() {
//        let fileManager = FileManager.default
//        guard let url = persistenFileURL,
//            fileManager.fileExists(atPath: url.path) else { return }
//
//        do {
//            let data = try Data(contentsOf: url)
//            let decoder = PropertyListDecoder()
//            itemNames = try decoder.decode([String].self, from: data)
//        } catch {
//            print("Error loading shopping list data: \(error)")
//        }
//    }
}
