//
//  ShoppingList.swift
//  Shopping List
//
//  Created by Mike Nichols on 5/22/20.
//  Copyright © 2020 Lambda School. All rights reserved.
//

import Foundation
import UIKit

protocol ShoppingListDelegate: class {
    func updateList()
}

class ShoppingList: Codable {
    var shoppingList: [ShoppingItem] = []
    
    
    private func updateList() {
        let isNew = UserDefaults.standard.isNew
        
        if isNew = true {
            
            let itemNames = ["Apple", "Grapes", "Milk", "Muffin", "Popcorn", "Soda", "Strawberries"]
            for item in itemNames {
                let item = item
                shoppingList.append(item)
            } else {
                
                loadFromPersistentStore()
            }
        }
        
        func persistentFileURL() {
            var persistentFileURL: URL? {
                let fileManager = FileManager.default
                let documentsDir = fileManager.urls(for: .documentDirectory, in: .userDomainMask).first
                let url = documentsDir?.appendingPathComponent("shoppingItems.plist")
                
                return url
            }
        }
        
        func loadFromPersistentStore() {
            
        }
}
