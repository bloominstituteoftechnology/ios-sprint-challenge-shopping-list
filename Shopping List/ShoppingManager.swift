//
//  ShoppingManager.swift
//  Shopping List
//
//  Created by Mitchell Budge on 5/5/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import UIKit

class ShoppingManager: Codable {
    var shoppingList: [ShoppingItem] = []
    
    var selectedItems: [ShoppingItem] {
        return shoppingList.filter { $0.hasBeenAdded == true }
    }
    let itemNames = ["apple", "grapes", "milk", "muffin", "popcorn", "soda", "strawberries"]
    
    let initKey = "myKey"
    private(set) var initCheck: Bool?
    
    init() {
        initCheck = UserDefaults.standard.bool(forKey: initKey)
            for item in itemNames {
                if let image = UIImage(named: item) {
                    let x = ShoppingItem(imageName: item, itemName: item, hasBeenAdded: false)
                    shoppingList.append(x)
                }
            }
           UserDefaults.standard.set(true, forKey: initKey)
    }
    
    private var persistentURL: URL? {
        let fileManager = FileManager.default
        guard let documents = fileManager.urls(for: .documentDirectory, in: .userDomainMask).first else { return nil }
        
        print("Documents: \(documents.path)")
        return documents.appendingPathComponent("shopping.plist")
    }
    
    func saveToPersistentStore() {
        guard let url = persistentURL else { return }
        do {
            let encoder = PropertyListEncoder()
            let data = try encoder.encode(shoppingList)
            try data.write(to: url)
        }   catch {
            print("Error saving shopping list: \(error)")
        }
    }
    
    func loadFromPersistentStore() {
        let fileManager = FileManager.default
        guard let url = persistentURL, fileManager.fileExists(atPath: url.path) else { return }
        do {
            let data = try Data(contentsOf: url)
            let decoder = PropertyListDecoder()
            shoppingList = try decoder.decode([ShoppingItem].self, from: data)
        }   catch {
            print("Error loading data from disk: \(error)")
        }
    }
    
    
    func updateStatus(item: ShoppingItem) {
        guard let index = shoppingList.firstIndex(of: item) else { return }
        shoppingList[index].hasBeenAdded = !shoppingList[index].hasBeenAdded
        saveToPersistentStore()
    }
}
