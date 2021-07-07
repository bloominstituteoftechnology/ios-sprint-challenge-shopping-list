//
//  ShoppingItemController.swift
//  Shopping List
//
//  Created by Rick Wolter on 10/19/18.
//  Copyright © 2018 Lambda School. All rights reserved.
//

import Foundation
import UIKit
class ShoppingItemController {
    
    
    private (set) var shoppingItems: [ShoppingItem] = []
    
    
    private var persistentFileURL: URL? {
        let documentDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first
        let fileName = "shopping-items.plist"
        return documentDirectory?.appendingPathComponent(fileName)
    }
    
    init() {
        let appStarted = UserDefaults.standard.bool(forKey: .appStartedKey)
        
        if !appStarted {
            let shoppingItems = ["apple", "grapes", "milk", "muffin", "popcorn", "soda", "strawberries"]
            for itemName in shoppingItems {
                createShoppingItem(name: itemName, image: UIImage(named: itemName) ?? UIImage())
            }
            UserDefaults.standard.set(true, forKey: .appStartedKey)
        } else { loadFromPersistentStore() }
    }
    
    
    func createShoppingItem(name: String, image: UIImage) {
        guard let imageData = UIImagePNGRepresentation(image) else { return }
        let item = ShoppingItem(image: imageData, name: name)
        shoppingItems.append(item)
        saveToPersistentStore()
    }
    
    func update(item: ShoppingItem) {
        guard let index = shoppingItems.index(of: item) else { return }
        let isInListScratch = !item.isInList
        let itemToInsert = ShoppingItem(image: item.image, name: item.name, isInList: isInListScratch)
        shoppingItems.remove(at: index)
        shoppingItems.insert(itemToInsert, at: index)
        saveToPersistentStore()
    }
    

    // Persisting between launches
    private func loadFromPersistentStore() {
        do {
            guard let persistentFileURL = persistentFileURL,
                FileManager.default.fileExists(atPath: persistentFileURL.path) else { return }
            let proprtyListDecoder = PropertyListDecoder()
            let shoppingItemsData = try Data(contentsOf: persistentFileURL)
            self.shoppingItems = try proprtyListDecoder.decode([ShoppingItem].self, from: shoppingItemsData)
        } catch { NSLog("There was an issue decoding shoppingItems:\(error)") }
    }
    
    private func saveToPersistentStore() {
        do {
            guard let persistentFileURL = persistentFileURL else { return }
            let proprtyListEncoder = PropertyListEncoder()
            let itemsData = try proprtyListEncoder.encode(shoppingItems)
            try itemsData.write(to: persistentFileURL)
        } catch { NSLog("There was an issue encoding shoppingItems:\(error)") }
    }
    
    
    
}
