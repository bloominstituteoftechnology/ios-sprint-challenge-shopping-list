//
//  ShoppingItemController.swift
//  Shopping List
//
//  Created by Madison Waters on 9/14/18.
//  Copyright © 2018 Lambda School. All rights reserved.
//

import Foundation

class ShoppingItemController {
    
    init() {
        createShoppingListItems()
        loadFromPersistentStore()
    }
    
    var shoppingListItems: [ShoppingItem] = []
    var orderedItems: [ShoppingItem] = []
    
    func createShoppingListItems() {
        
        guard UserDefaults.standard.bool(forKey: "ItemsHaveBeenCreated") != true else { return }
        
        let itemNames = ["Apple", "Grapes", "Milk", "Muffin", "Popcorn", "Soda", "Strawberries"]

        for itemName in itemNames {
            let item = ShoppingItem(itemName: itemName)
            shoppingListItems.append(item)
        }
        
//        let itemNames = [
//        ShoppingItem(itemName: "Apple"),
//        ShoppingItem(itemName: "Grapes"),
//        ShoppingItem(itemName: "Milk"),
//        ShoppingItem(itemName: "Muffin"),
//        ShoppingItem(itemName: "Popcorn"),
//        ShoppingItem(itemName: "Soda"),
//        ShoppingItem(itemName: "Strawberries")
//        ]
        
        saveToPersistentStore()
        
        UserDefaults.standard.set(true, forKey: "ItemsHaveBeenCreated")
    }

    func toggleItem(for shoppingItem: ShoppingItem) {
        var scratch = shoppingItem
        scratch.wasAdded.toggle()
        
        if scratch.wasAdded == true {
            orderedItems.append(scratch)
        }
        
        saveToPersistentStore()
    }
    
    // MARK: - Private Persistent Store Functions
    
    private func loadFromPersistentStore() {
        
        do {
            guard let fileURL = shopppingItemFileURL else { return }
            
            let shoppingItemsData = try Data(contentsOf: fileURL)
            
            let plistDecoder = PropertyListDecoder()
            
            self.shoppingListItems = try plistDecoder.decode([ShoppingItem].self, from: shoppingItemsData)
            
        } catch {
            NSLog("Error decoding shopping list items from property list: \(error)")
        }
        
    }
    
    private func saveToPersistentStore() {
        
        let plistEncoder = PropertyListEncoder()
        
        do {
            let memoriesData = try plistEncoder.encode(shoppingListItems)
                //.encode(shoppingListItems)
            
            guard let fileURL = shopppingItemFileURL else { return }
            
            try memoriesData.write(to: fileURL)
            
        } catch {
            NSLog("Error encoding shopping list items to property list: \(error)")
        }
        
    }
    
    private var shopppingItemFileURL: URL? {
        let documentDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first
        
        let fileName = "shoppingItems.plist"
        
        return documentDirectory?.appendingPathComponent(fileName)
    }
    
}

