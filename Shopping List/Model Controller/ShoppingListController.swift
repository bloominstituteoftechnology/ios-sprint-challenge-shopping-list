//
//  ShoppingListController.swift
//  Shopping List
//
//  Created by Morgan Smith on 12/13/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import Foundation

class ShoppingListController {
    
    
    init() {
        loadFromPersistentStore()
    }
 
    
    var shoppingItem: [ShoppingItem] =
        [ShoppingItem(name:  "Apple"),
         ShoppingItem(name: "Grapes"),
         ShoppingItem(name: "Milk"),
         ShoppingItem(name: "Muffin"),
         ShoppingItem(name: "Popcorn"),
         ShoppingItem(name: "Soda"),
         ShoppingItem(name: "Strawberries")]
    
    func updateList(for item: ShoppingItem) {
        guard let index = shoppingItem.firstIndex(of: item) else {return}
        shoppingItem[index].hasBeenAdded = !shoppingItem[index].hasBeenAdded
        saveToPersistentStore()
    }
    
    
    var addedItems: [ShoppingItem] {
        return shoppingItem.filter({ $0.hasBeenAdded })
    }
   
    private func loadFromPersistentStore() {
        
        do {
            guard let fileURL = shoppingListURL else { return }
            
            let notebooksData = try Data(contentsOf: fileURL)
            
            let plistDecoder = PropertyListDecoder()
            
            self.shoppingItem = try plistDecoder.decode([ShoppingItem].self, from: notebooksData)
        } catch {
            NSLog("Error decoding memories from property list: \(error)")
        }
    }
    
    private func saveToPersistentStore() {
        
        let plistEncoder = PropertyListEncoder()
        
        do {
            let notebooksData = try plistEncoder.encode(shoppingItem)
            
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
