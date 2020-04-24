//
//  ShoppingModelController.swift
//  Shopping List
//
//  Created by Marissa Gonzales on 3/27/20.
//  Copyright © 2020 Lambda School. All rights reserved.
//

import Foundation
import UIKit



class ShoppingModelController {
    
    var shoppingItems: [ShoppingItem] = [ShoppingItem(name: itemNames[0], isAdded: false),
                                         ShoppingItem(name: itemNames[1], isAdded: false),
                                         ShoppingItem(name: itemNames[2], isAdded: false),
                                         ShoppingItem(name: itemNames[3], isAdded: false),
                                         ShoppingItem(name: itemNames[4], isAdded: false),
                                         ShoppingItem(name: itemNames[5], isAdded: false),
                                         ShoppingItem(name: itemNames[6], isAdded: false)]
    init() {
        
        if !hasData {
            
            for item in itemNames { 
                
                createShoppingItem(name: item, isAdded: false)
                
            }
            
            saveToPersistentStore()
            
        } else {
            
            loadFromPersistentStore()
            
        }
    }
    
    var hasData: Bool {
        
        let data = UserDefaults.standard.bool(forKey: .shoppingItemKey)
        
        if !data {
            
            return false
        }
        
        return true
    }
    
    var totalItemsAdded: Int {
        
        let items = shoppingItems.filter { return $0.isAdded }
        
        return items.count
        
    }
    
    var persistentFileURL: URL? {
        
        let fileManager = FileManager.default
        
        guard let documentsDirectory = fileManager.urls(for: .documentDirectory, in: .userDomainMask).first else { return nil }
        
        let shoppingItemURL = documentsDirectory.appendingPathComponent("shoppingItems.plist")
        
        return shoppingItemURL
        
    }
    
    func saveToPersistentStore() {
        
        guard let fileURL = persistentFileURL else { return }
        
        do {
            
            let encoder = PropertyListEncoder()
            let data = try encoder.encode(shoppingItems)
            try data.write(to: fileURL)
            
            
        } catch {
            
            print(error)
        }
        
    }
    
    func loadFromPersistentStore() {
        
        guard let fileURL = persistentFileURL else { return }
        
        do {
            
            let decoder = PropertyListDecoder()
            
            let propertyListData = try Data(contentsOf: fileURL)
            
            let data = try decoder.decode([ShoppingItem].self, from: propertyListData)
            
            shoppingItems = data
            
        } catch {
            
            print(error)
        }
        
    }
    
    func createShoppingItem(name: String, isAdded: Bool) {
        
        let shoppingItem = ShoppingItem(name: name, isAdded: isAdded)
        shoppingItems.append(shoppingItem)
        saveToPersistentStore()
    }
    
    func toggleHasBeenAdded(for item: ShoppingItem) {
        if let shoppingItemIndex = shoppingItems.firstIndex(of: item) {
            var shoppingItem = shoppingItems[shoppingItemIndex]
            shoppingItem.isAdded.toggle()
            shoppingItems[shoppingItemIndex] = shoppingItem
            saveToPersistentStore()
            
        }
    }
}

extension ShoppingModelController: ItemAddedDelegate  {
    func itemAdded(_ item: ShoppingItem) {
        shoppingItems.append(item)
    }
}
