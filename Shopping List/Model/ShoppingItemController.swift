//
//  ShoppingItemController.swift
//  Shopping List
//
//  Created by Rick Wolter on 9/14/18.
//  Copyright © 2018 Lambda School. All rights reserved.
//

import Foundation
import UIKit

class ShoppingItemController {
    
    
    private var appStartedKey = "appStartedKey"
    private(set) var shoppingItems: [ShoppingItem] = []
    
    private var persistentFileURL: URL? {
        let documentDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first
        let fileName = "shopping-items.plist"
        return documentDirectory?.appendingPathComponent(fileName)
    }
    
    
     //Use `UserDefaults` to make sure that new shopping items are initialized only once.
    init() {
        let appStarted = UserDefaults.standard.bool(forKey: appStartedKey)
   
            if !appStarted {
                let shoppingItems = ["apple", "grapes", "milk", "muffin", "popcorn", "soda", "strawberries"]
                for itemName in shoppingItems {
                    createShoppingItem(name: itemName, image: UIImage(named: itemName) ?? UIImage())
                }
                UserDefaults.standard.set(true, forKey: appStartedKey)
           } else { loadFromPersistentStore() }
    }
    
    
    // C.R.U.D.
    func createShoppingItem(name: String, image: UIImage) {
        guard let imageData = UIImagePNGRepresentation(image) else { return }
        let item = ShoppingItem(image: imageData, name: name)
        shoppingItems.append(item)
        saveToPersistentStore()
    }
    
    func update(item: ShoppingItem, isInList: Bool) {
        
        guard let index = shoppingItems.index(of: item) else { return }
        let itemToInsert = ShoppingItem(image: item.image, name: item.name, isInList: isInList)
        
        shoppingItems.remove(at: index)
        shoppingItems.insert(itemToInsert, at: index)

        saveToPersistentStore()
    }
    
    
    
//    **These shopping items should be persisted between launches of the application.**
    

    private func loadFromPersistentStore() {
        let proprtyListDecoder = PropertyListDecoder()
        do {
            guard let persistentFileURL = persistentFileURL,
                FileManager.default.fileExists(atPath: persistentFileURL.path) else { return }
            let shoppingItemsData = try Data(contentsOf: persistentFileURL)
            self.shoppingItems = try proprtyListDecoder.decode([ShoppingItem].self, from: shoppingItemsData)
        } catch { NSLog("There was an issue encoding shoppingItems:\(error)") }
    }
    
    
    private func saveToPersistentStore() {
        let proprtyListEncoder = PropertyListEncoder()
        do {
            guard let persistentFileURL = persistentFileURL else { return }
            let itemsData = try proprtyListEncoder.encode(shoppingItems)
            try itemsData.write(to: persistentFileURL)
        } catch { NSLog("There was an issue encoding shoppingItems:\(error)") }
    }
    
    
    
    
}
