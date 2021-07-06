//
//  ShoppingListController.swift
//  Shopping List
//
//  Created by Jarren Campos on 2/21/20.
//  Copyright © 2020 Lambda School. All rights reserved.
//

import Foundation

class ShoppingListController {
    
    init() {
        loadFromPersistentStore()
    }
    
    var shoppingItem: [ShoppingItem] =
        [
            ShoppingItem(name: "Apple"),
            ShoppingItem(name: "Grapes"),
            ShoppingItem(name: "Milk"),
            ShoppingItem(name: "Muffin"),
            ShoppingItem(name: "Popcorn"),
            ShoppingItem(name: "Soda"),
            ShoppingItem(name: "Strawberries")]
    
    func updateList(for item: ShoppingItem) {
        guard let index = shoppingItem.firstIndex(of: item) else { return }
        shoppingItem[index].addedItem = !shoppingItem[index].addedItem
        saveToPersistentStore()
    }
    
    var addedItems: [ShoppingItem] {
        return shoppingItem.filter({ $0.addedItem })
    }
    
    private func loadFromPersistentStore() {
        
        do {
            guard let fileURL = shoppingListURL else { return }
            let fileData = try Data(contentsOf: fileURL)
            let plistDecoder = PropertyListDecoder()
            self.shoppingItem = try plistDecoder.decode([ShoppingItem].self, from: fileData)
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
