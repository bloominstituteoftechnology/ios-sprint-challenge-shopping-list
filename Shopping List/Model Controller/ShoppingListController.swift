//
//  ShoppingListController.swift
//  Shopping List
//
//  Created by Morgan Smith on 12/13/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import Foundation
import UIKit

class ShoppingListController {
    
    init() {
        loadFromPersistentStore()
    }
    
    var shoppingItem: [ShoppingItem] {
        [ShoppingItem(name:  "Apple"),
         ShoppingItem(name: "Grapes"),
         ShoppingItem(name: "Milk"),
         ShoppingItem(name: "Muffin"),
         ShoppingItem(name: "Popcorn"),
         ShoppingItem(name: "Soda"),
         ShoppingItem(name: "Strawberries")]
    }
    private(set) var addedItems: [ShoppingItem] = []
    
   
    private func loadFromPersistentStore() {
        
        do {
            guard let fileURL = shoppingListURL else { return }
            
            let notebooksData = try Data(contentsOf: fileURL)
            
            let plistDecoder = PropertyListDecoder()
            
            self.addedItems = try plistDecoder.decode([ShoppingItem].self, from: notebooksData)
        } catch {
            NSLog("Error decoding memories from property list: \(error)")
        }
    }
    
    private func saveToPersistentStore() {
        
        let plistEncoder = PropertyListEncoder()
        
        do {
            let notebooksData = try plistEncoder.encode(addedItems)
            
            guard let fileURL = shoppingListURL else { return }
            
            try notebooksData.write(to: fileURL)
        } catch {
            NSLog("Error encoding memories to property list: \(error)")
        }
    }
    
    private var shoppingListURL: URL? {
        let documentDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first
        
        let fileName = "ShoppingList.plist"
        
        return documentDirectory?.appendingPathComponent(fileName)
    }
}
