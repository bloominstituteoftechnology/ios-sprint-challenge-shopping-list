//
//  ShoppingItemController.swift
//  Shopping List
//
//  Created by Moin Uddin on 9/7/18.
//  Copyright © 2018 Lambda School. All rights reserved.
//

import Foundation
import UIKit

class ShoppingItemController {
    
    init() {
        loadFromPersistentStore()
        if self.shoppingItems.isEmpty {
           self.shoppingItems  = [
                ShoppingItem(item: "apple", addedToList: true, imageData: UIImagePNGRepresentation(UIImage(named: "apple")!)!),
                ShoppingItem(item: "grapes", addedToList: false, imageData: UIImagePNGRepresentation(UIImage(named: "grapes")!)!),
                ShoppingItem(item: "milk", addedToList: true, imageData: UIImagePNGRepresentation(UIImage(named: "milk")!)!),
                ShoppingItem(item: "muffin", addedToList: true, imageData: UIImagePNGRepresentation(UIImage(named: "muffin")!)!),
                ShoppingItem(item: "popcorn", addedToList: false, imageData: UIImagePNGRepresentation(UIImage(named: "popcorn")!)!),
                ShoppingItem(item: "soda", addedToList: false, imageData: UIImagePNGRepresentation(UIImage(named: "soda")!)!),
                ShoppingItem(item: "strawberries", addedToList: false, imageData: UIImagePNGRepresentation(UIImage(named: "strawberries")!)!)
            ]
        }
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

//    let itemNames = ["apple", "grapes", "milk", "muffin", "popcorn", "soda", "strawberries"]
//
//    func loadAssets() {
//        for item in itemNames {
//            self.create(item: item, addedToList: false, imageData: <#T##Data#>)
//        }
//    }
    
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
    
    func totalInCart() -> Int {
        var count: Int = 0
        for item in shoppingItems {
            if item.addedToList == true {
                count += 1
            }
        }
        return count
    }
    
    private(set) var shoppingItems: [ShoppingItem] = []
}
