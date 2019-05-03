//
//  ShoppingItemController.swift
//  Shopping List
//
//  Created by Jeffrey Carpenter on 5/3/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import Foundation
import UIKit

private let isSubsiquentLaunchKey = "isSubsiquentLaunchKey"

class ShoppingItemController {
    
    var shoppingItems: [ShoppingItem] = []
    
    private var shoppingListURL: URL? {
        let fileManager = FileManager.default
        guard let documents = fileManager.urls(for: .documentDirectory, in: .userDomainMask).first else { return nil }
        return documents.appendingPathComponent("shoppingList.plist")
    }
    
    init() {
        
        if UserDefaults.standard.bool(forKey: isSubsiquentLaunchKey) {
            loadFromPersistentStore()
        } else {
            let itemNames = ["apple", "grapes", "milk", "muffin", "popcorn", "soda", "strawberries"]
            createItemArray(from: itemNames)
            UserDefaults.standard.set(true, forKey: isSubsiquentLaunchKey)
        }
    }
    
    // MARK: - CRUD methods
    // TODO: make a better name for update method
    func update(shoppingItem: ShoppingItem) {
        
        guard let index = shoppingItems.firstIndex(of: shoppingItem) else {
            print("Error updating ShoppingItem: \(shoppingItem.name) was not found in the array.")
            return
        }
        
        shoppingItems[index].isInCart = !shoppingItems[index].isInCart
        saveToPersistentStore()
    }
    
    private func createItemArray(from itemNames: [String]) {
        for item in itemNames {
            guard let imageData = UIImage(named: item)?.pngData() else {
                print("Error getting image data: could not find image named \(item)")
                return
            }
            let newShoppingItem = ShoppingItem(name: item, image: imageData)
            shoppingItems.append(newShoppingItem)
            saveToPersistentStore()
        }
    }
    
    // MARK: - Persistent Storage Methods
    func saveToPersistentStore() {
        
        let encoder = PropertyListEncoder()
        
        do {
            guard let url = shoppingListURL else { return }
            let itemData = try encoder.encode(shoppingItems)
            try itemData.write(to: url)
        } catch { print("Error saving to disk: \(error.localizedDescription)")}
    }
    
    func loadFromPersistentStore() {
        
        let fileManager = FileManager.default
        
        guard let url = shoppingListURL,
        fileManager.fileExists(atPath: url.path)
        else { return }
        
        do {
            let data = try Data(contentsOf: url)
            let decoder = PropertyListDecoder()
            shoppingItems = try decoder.decode([ShoppingItem].self, from: data)
        } catch { print("(Error reading from disk: \(error.localizedDescription)")}
    }
}
