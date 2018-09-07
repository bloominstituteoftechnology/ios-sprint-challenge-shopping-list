//
//  ShoppingItemController.swift
//  Shopping List
//
//  Created by Moin Uddin on 9/7/18.
//  Copyright © 2018 Lambda School. All rights reserved.
//

import Foundation


class ShoppingItemController {
    
    init() {
        loadFromPersistentStore()
    }
    
    func create(item: String, addedToList: Bool, imageData: Data) {
        let shoppingItem = ShoppingItem(item: item, addedToList: addedToList, imageData: imageData)
        shoppingItems.append(shoppingItem)
        saveToPersistentStore()
    }
    
    func toggleIsAdded(shoppingItem: ShoppingItem) {
        guard let index = shoppingItems.index(of: shoppingItem) else { return }
        shoppingItems[index].addedToList = !shoppingItems[index].addedToList
        saveToPersistentStore()
    }
    
//Persistence Functions
    private func loadFromPersistentStore() {
        do {
            guard let shoppingListURL = shoppingListURL,
                FileManager.default.fileExists(atPath: shoppingListURL.path) else { return }
            
            let shoppingListData = try Data(contentsOf: shoppingListURL)
            
            let plistDecoder = PropertyListDecoder()
            
            self.shoppingItems = try plistDecoder.decode([ShoppingItem].self, from: shoppingListData)
            
        } catch {
            NSLog("Error decoding shopping list: \(error)")
        }
    }
    
    private func saveToPersistentStore() {
        let plistEncoder = PropertyListEncoder()
        
        do {
            let shoppingListData = try plistEncoder.encode(shoppingItems)
            
            guard let shoppingListURL = shoppingListURL else { return }
            
            try shoppingListData.write(to: shoppingListURL)
            
        } catch {
            NSLog("Error encoding shoppping list: \(error)")
        }
    }
    
    private var shoppingListURL: URL? {
        
        let documentDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first
        
        let fileName = "shoppinglist.plist"
        
        return documentDirectory?.appendingPathComponent(fileName)
    }
    
    private(set) var shoppingItems: [ShoppingItem] = []
}
