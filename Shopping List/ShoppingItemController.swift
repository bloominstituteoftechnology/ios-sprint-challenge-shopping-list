//
//  ShoppingItemController.swift
//  ChallengeTry
//
//  Created by Ryan Murphy on 5/10/19.
//  Copyright © 2019 Ryan Murphy. All rights reserved.
//

import Foundation
import UIKit

let myKey = "myKey"

class ShoppingItemController {
    
    var shoppingItems: [ShoppingItem] = []
    
    // make shoppingItems Array
    
    init() {
        if UserDefaults.standard.bool(forKey: myKey) {
            loadFromPersistentStore()
        } else {
       let itemNames = ["apple", "grapes", "milk", "muffin", "popcorn", "soda", "strawberries"]
        createShoppingItems(itemNames: itemNames)
        UserDefaults.standard.set(true, forKey: myKey)
    }
}
    
   
    
   // Persistence
    
    private var shoppingURL: URL? {
        let fileManager = FileManager.default
        guard let documents = fileManager.urls(for: .documentDirectory, in: .userDomainMask).first else {
            return nil }
        return documents.appendingPathComponent("shoppingList.plist")
        
    }
    
    func saveToPersistentStore() {
        let encoder = PropertyListEncoder()
        
        do {
            guard let url = shoppingURL else { return }
            let itemData = try encoder.encode(shoppingItems)
            try itemData.write(to: url)
        } catch {
            print("Error Saving Data: \(error)")
        }
    }
    
    func loadFromPersistentStore() {
        let fileManager = FileManager.default
        
        guard let url = shoppingURL,
        fileManager.fileExists(atPath: url.path)
            else { return }
        do {
            let data = try Data(contentsOf: url)
            let decoder = PropertyListDecoder()
            shoppingItems = try decoder.decode([ShoppingItem].self, from: data)
        } catch { print("Error decoding data: \(error)")}
        
    }
    
    
    
    // Crud
    
    private func createShoppingItems(itemNames: [String]) {
        for name in itemNames {
             guard let imageData = UIImage(named: name)?.pngData() else {
                print("Error loading Image")
                return }
            let newItem = ShoppingItem(name: name, image: imageData)
            shoppingItems.append(newItem)
            saveToPersistentStore()
        }
    }
    
    func update(shoppingItem: ShoppingItem) {
            guard let index = shoppingItems.firstIndex(of: shoppingItem) else {
                return
            }
            shoppingItems[index].isOnList = !shoppingItems[index].isOnList
            saveToPersistentStore()
        }

    func clearCart() {
        for index in 0..<shoppingItems.count {
            shoppingItems[index].isOnList = false
        }
        saveToPersistentStore()
    }
}
