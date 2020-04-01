//
//  ShoppingModelController.swift
//  Shopping List
//
//  Created by Mark Poggi on 3/27/20.
//  Copyright © 2020 Lambda School. All rights reserved.
//

import Foundation
import UIKit

class ShoppingController {
    
    // MARK: - PROPERTIES
    
    var shoppingList: [ShoppingList] = []
    //    private(set) var addresses = Address(name: String, address: String)
    
    init() {
        createItems()
        loadFromPersistentStore()
    }
    
    // MARK: - C.R.U.D Method
    
    func createItems() {
        
        let itemNames = ["Apple", "Grapes", "Milk", "Muffin", "Popcorn", "Soda", "Strawberries"]
        for item in itemNames {
            let myShoppingList = ShoppingList(itemName: item, itemAdded: true)
            shoppingList.append(myShoppingList)
        }
    }
    
    func toggleBool(myshoppingList: ShoppingList) {
        guard let index = shoppingList.firstIndex(of: myshoppingList) else {return}
        shoppingList[index].itemAdded = !shoppingList[index].itemAdded
    }
    
    //   func storeAddress(name: String, address: String) {
    //       let myAddress = Address(name: name, address: address)
    //   }
    
 
    //MARK: - Persistence
    
    private var shoppingURL: URL? {
        let fileManager = FileManager.default
        let documentsDir = fileManager.urls(for: .documentDirectory, in: .userDomainMask).first
        let shoppinglistURL = documentsDir?.appendingPathComponent("shopping.plist")
        
        return shoppinglistURL
    }
    
    func saveToPersistentStore() {
        let encoder = PropertyListEncoder()
        
        do {
            
            let shoppingData = try encoder.encode(shoppingList)
            guard let persistentFileURL = shoppingURL else { return }
            try shoppingData.write(to: persistentFileURL)
        } catch {
            NSLog("Error saving shopping list: \(error)")
        }
    }
    
    func loadFromPersistentStore() {
        
        do {
            guard let persistentFileURL = shoppingURL else { return }
            let decoder = PropertyListDecoder()
            let shoppingData = try Data(contentsOf: persistentFileURL)
            let shoppingList = try decoder.decode([ShoppingList].self, from: shoppingData)
            
            self.shoppingList = shoppingList
            
        } catch {
            NSLog("Error decoding shopping list: \(error)")
        }
    }
}
