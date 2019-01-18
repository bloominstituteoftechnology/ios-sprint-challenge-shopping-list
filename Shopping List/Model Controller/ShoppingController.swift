//
//  ShoppingController.swift
//  Shopping List
//
//  Created by Nelson Gonzalez on 1/18/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import Foundation

class ShoppingController {
    private(set) var shoppingItems: [Shopping] = []
    private let itemNames = ["apple", "grapes", "milk", "muffin", "popcorn", "soda", "strawberries"]
    init(){
        if UserDefaults.standard.bool(forKey: .isInitiatedKey){
            
        } else {
          createItems()
        }
    }
    
    func createItems(){
        
        for name in itemNames {
            let items = Shopping(name: name, image: name)
            shoppingItems.append(items)
            UserDefaults.standard.set(true, forKey: .isInitiatedKey)
            saveToPersistentStore()
        }
    }
    
    func toggleIsAdded(shoppingItem: Shopping) {
        guard let index = shoppingItems.index(of: shoppingItem) else { return }
        shoppingItems[index].hasBeenAdded = !shoppingItems[index].hasBeenAdded
        saveToPersistentStore()
    }
    
    
    private var shoppingListURL: URL? {
        let documentDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first
        let fileName = "shoppinglist.plist"
        return documentDirectory?.appendingPathComponent(fileName)
    }
    
    // Persistence Functions
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
    
    private func loadFromPersistentStore() {
        do {
            guard let shoppingListURL = shoppingListURL,
                FileManager.default.fileExists(atPath: shoppingListURL.path) else { return }
            let shoppingListData = try Data(contentsOf: shoppingListURL)
            let plistDecoder = PropertyListDecoder()
            self.shoppingItems = try plistDecoder.decode([Shopping].self, from: shoppingListData)
        } catch {
            NSLog("Error decoding shopping list: \(error)")
        }
    }
    
}
