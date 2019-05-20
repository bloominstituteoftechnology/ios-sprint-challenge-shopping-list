//
//  ShoppingItemController.swift
//  Shopping List
//
//  Created by Stephanie Bowles on 5/20/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import Foundation

class ShoppingItemController {
    
    
    init() {
//        loadFromPersistenceStore()
        createShoppingItem()
    }
    
    private(set) var shoppingItems : [ShoppingItem] = []
//     private(set) var shoppingItems = [ShoppingItem]() what's the difference between the two?
    
//    private var persistentFileURL: URL? {
//        let fileManager = FileManager.default
//        guard let documentsDirectory = fileManager.urls(for: .documentDirectory, in: .userDomainMask) .first else {return nil}
//
//
//        return documentsDirectory.appendingPathComponent("shoppingitems.plist")
//
//
//    }
    func createShoppingItem() {
        let itemNames = ["Apple", "Grapes", "Milk", "Muffin", "Popcorn", "Soda", "Strawberries"]
        for item in itemNames{
            
            let item = ShoppingItem(itemNames: item)
            shoppingItems.append(item)
            
        }
//        saveToPersistenceStore()
        
        
    }
    
//    func toggleAdd(for shoppingItem: ShoppingItem) {
    func toggleAdd(shoppingItem: ShoppingItem){
//        guard let index = shoppingItems.index(of: shoppingItem) else { return }
//        shoppingItems[index].hasBeenAdded.toggle()
        
//        saveToPersistentStore()
//        shoppingItems.hasBeenAdded.toggle()

        guard let index = shoppingItems.index(of: shoppingItem) else { return }
            shoppingItems[index].hasBeenAdded = !shoppingItems[index].hasBeenAdded
//            saveToPersistentStore()
        }
    
    
    func addingCount() -> Int {
        var count = 0
        for items in shoppingItems {
            if items.hasBeenAdded == true {
                count += 1
            }
        }
        
        return count
    }
    
    
   
//    func saveToPersistenceStore() {
//        guard let url = self.persistentFileURL else {return}
//
//        do {
//            let encoder = PropertyListEncoder()
//            let data = try encoder.encode(shoppingItems)
//            try data.write(to: url)
//        } catch {
//            NSLog("Error saving shopping data: \(error)")
//        }
//    }

//    func loadFromPersistenceStore() {
//        let fileManager = FileManager.default
//        guard let url = persistentFileURL,
//            fileManager.fileExists(atPath: url.path) else {return}
//        do {
//            let data = try Data(contentsOf: url)
//            let decoder = PropertyListDecoder()
//            self.shoppingItems = try decoder.decode([ShoppingItem].self, from: data)
//
//        } catch {
//            NSLog("Error loading shopping data: \(error)")
//
//        }
//    }
    
    
}


