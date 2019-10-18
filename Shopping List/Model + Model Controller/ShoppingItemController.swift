//
//  ShoppingItemController.swift
//  Shopping List
//
//  Created by Rick Wolter on 10/18/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import Foundation
import UIKit

class ShoppingItemController {
    
    private (set) var shoppingItems: [ShoppingItem] = []
    
    
    private var persistentFileURL: URL? {
           let documentDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first
           let fileName = "shoppingCart.plist"
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
        let item = ShoppingItem(name: name, image: imageData)
        shoppingItems.append(item)
       
    }
    
    
    
    
    
    private func saveToPersistentStore() {
        do {
            guard let persistentFileURL = persistentFileURL else { return }
            let proprtyListEncoder = PropertyListEncoder()
            let itemsData = try proprtyListEncoder.encode(shoppingItems)
            try itemsData.write(to: persistentFileURL)
        } catch { NSLog("Error with the encoding:\(error)") }
    }
    
    
    private func loadFromPersistentStore() {
           do {
               guard let persistentFileURL = persistentFileURL,
                   FileManager.default.fileExists(atPath: persistentFileURL.path) else { return }
               let proprtyListDecoder = PropertyListDecoder()
               let shoppingItemsData = try Data(contentsOf: persistentFileURL)
               self.shoppingItems = try proprtyListDecoder.decode([ShoppingItem].self, from: shoppingItemsData)
           } catch { NSLog("Error with the decoding:\(error)") }
       }
    
    
    
    
    
    
    
    
    
}

